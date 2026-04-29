import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBCPOgkQ-BPGlART7K6gPUDQhrRmUPDfU8",
            authDomain: "sanedesk3-tr4d9.firebaseapp.com",
            projectId: "sanedesk3-tr4d9",
            storageBucket: "sanedesk3-tr4d9.firebasestorage.app",
            messagingSenderId: "165128632150",
            appId: "1:165128632150:web:5e55caf649e816899888f7"));
  } else {
    await Firebase.initializeApp();
  }
}
