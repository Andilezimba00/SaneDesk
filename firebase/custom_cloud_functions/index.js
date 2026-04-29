const admin = require("firebase-admin/app");
admin.initializeApp();

const scheduledNotifications = require("./scheduled_notifications.js");
exports.scheduledNotifications = scheduledNotifications.scheduledNotifications;
const processDodoPayment = require("./process_dodo_payment.js");
exports.processDodoPayment = processDodoPayment.processDodoPayment;
