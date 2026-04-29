const { onRequest } = require("firebase-functions/v2/https");
const { onSchedule } = require("firebase-functions/v2/scheduler");
const admin = require("firebase-admin");
const moment = require("moment");

// Initialize Firebase Admin
if (admin.apps.length === 0) {
  admin.initializeApp();
}

// 1. SCHEDULED NOTIFICATIONS (Europe West 3)
exports.scheduledNotifications = onSchedule(
  {
    schedule: "every 60 minutes",
    region: "europe-west3",
    memory: "256MiB",
    timeoutSeconds: 60,
  },
  async (event) => {
    const now = admin.firestore.Timestamp.now();
    const snapshot = await admin
      .firestore()
      .collection("scheduled_notifications")
      .where("next_send_date", "<=", now)
      .get();

    for (const doc of snapshot.docs) {
      const {
        notification_title,
        notification_description,
        repeat_in_mins,
        user_ref,
        is_active,
      } = doc.data();
      if (is_active === false) continue;

      await sendFFPushNotification(
        notification_title,
        notification_description,
        user_ref,
      );

      await admin.firestore().collection("notifications").add({
        received_by: user_ref,
        title: notification_title,
        content: notification_description,
        created_time: admin.firestore.FieldValue.serverTimestamp(),
      });

      const nextNotificationTime = moment(doc.data().next_send_date.toDate())
        .add(repeat_in_mins, "minutes")
        .toDate();

      await doc.ref.update({
        next_send_date:
          admin.firestore.Timestamp.fromDate(nextNotificationTime),
      });
    }
  },
);

// 2. DODO PAYMENT WEBHOOK (Europe West 3)
exports.processDodoPayment = onRequest(
  {
    region: "europe-west3",
    memory: "512MiB",
    invoker: "public",
  },
  async (req, res) => {
    if (req.method !== "POST")
      return res.status(405).send("Method Not Allowed");

    const data = req.body;
    // Dodo sends the customer email here
    const paymentEmail = data?.customer?.email || data?.data?.customer?.email;

    if (!paymentEmail) {
      console.log("Webhook hit but no email found.");
      return res.status(200).send("No email found");
    }

    try {
      // Find the user in SaneDesk with this email
      const userQuery = await admin
        .firestore()
        .collection("users")
        .where("email", "==", paymentEmail)
        .limit(1)
        .get();

      if (userQuery.empty) {
        console.log(`User ${paymentEmail} not found in database.`);
        return res.status(200).send("User not found");
      }

      const userDoc = userQuery.docs[0];

      // 1. Update Premium Status
      await userDoc.ref.update({
        is_premium: true,
        last_payment_date: admin.firestore.FieldValue.serverTimestamp(),
      });

      // 2. Send Success Notification
      await sendFFPushNotification(
        "Premium Activated!",
        "Welcome to SaneDesk Premium. Your tools are now unlocked.",
        userDoc.ref,
      );

      return res.status(200).send("Success");
    } catch (error) {
      console.error("Webhook Error:", error);
      return res.status(500).send("Internal Server Error");
    }
  },
);

// Helper function for Push Notifications
async function sendFFPushNotification(title, body, userRef) {
  try {
    const tokensSnap = await userRef.collection("fcm_tokens").get();
    if (tokensSnap.empty) return;
    const tokens = tokensSnap.docs.map((d) => d.data().fcm_token);
    await admin.messaging().sendEachForMulticast({
      notification: { title, body },
      tokens: tokens,
    });
  } catch (e) {
    console.error("FCM Error:", e);
  }
}
