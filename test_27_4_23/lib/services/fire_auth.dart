// import 'dart:convert';
// import 'dart:math';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:crypto/crypto.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:hashids2/hashids2.dart';
// import 'package:sign_in_with_apple/sign_in_with_apple.dart';
// import 'package:http/http.dart' as http;
//
// import '../constants/constants.dart';
// import '../main.dart';
// import '../src/data/models/wallet.dart';
// import '../src/data/preferences/app_preferences.dart';
//
// String sha256ofString(String input) {
//   final bytes = utf8.encode(input);
//   final digest = sha256.convert(bytes);
//   return digest.toString();
// }
//
// /// Generates a cryptographically secure random nonce, to be included in a
// /// credential request.
// String generateNonce([int length = 32]) {
//   const charset =
//       '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
//   final random = Random.secure();
//   return List.generate(length, (_) => charset[random.nextInt(charset.length)])
//       .join();
// }
//
// /// Returns the sha256 hash of [input] in hex notation.
//
// class FireAuth {
//   static Future<void> unlinkAccountLogout(String uuid) async {
//     final myHash = HashIds(salt: 'CD Mob App Salt');
//     String my_uid = myHash.encode(DateTime.now().millisecondsSinceEpoch);
//
//     String apiUrl = Globals.UNLINK_ACCOUNT;
//     String checksum =
//         sha256.convert(utf8.encode(my_uid + 'CDMob App Scret')).toString();
//
//     final response = await http.post(Uri.parse(apiUrl), body: {
//       //'mode': txMode,
//       'uid': uuid,
//       'region': Globals.REGION,
//       't_uid': my_uid,
//       'checksum': checksum,
//     });
//
//     if (response.statusCode == 200) {
//       // If the server did return a 200 OK response,
//       // then parse the JSON.
//       //return Album.fromJson(jsonDecode(response.body));
//       if (kDebugMode) {
//         print('response OK');
//       }
//     } else {
//       // If the server did not return a 200 OK response,
//       // then throw an exception.
//       throw Exception('Network Failed. Unlink unsuccessful.');
//     }
//   }
//
//   /// takes userEmail and performs sendSignInLInkToEmail via FirebaseAuth service
//   static Future<void> sendEmailLink(String emailAuth) async {
//     var acs = ActionCodeSettings(
//         // URL you want to redirect back to. The domain (www.example.com) for this
//         // URL must be whitelisted in the Firebase Console.
//         url: 'https://dragon_rewards.page.link',
//         // This must be true
//         handleCodeInApp: true,
//         iOSBundleId: 'com.dtg.dragon_rewards',
//         androidPackageName: 'com.dtg.dragon_rewards',
//         // installIfNotAvailable
//         androidInstallApp: true,
//         // minimumVersion
//         androidMinimumVersion: '12');
//
//     //var emailAuth = 'someemail@domain.com';
//     FirebaseAuth.instance
//         .sendSignInLinkToEmail(email: emailAuth, actionCodeSettings: acs)
//         .catchError(
//             (onError) => print('Error sending email verification $onError'))
//         .then((value) {
//       if (kDebugMode) print('Successfully sent email verification');
//       final AppPreferences _pref = getIt<AppPreferences>();
//       _pref.setData(AppPreferences.KEY_EMAIL, emailAuth);
//     });
//   }
//
//   static Future<bool> linkEmailCredentials(
//       String userEmail, Uri emailLink) async {
//     bool _linkSuccess = false;
//     if (FirebaseAuth.instance
//         .isSignInWithEmailLink(emailLink.path.toString())) {
//       try {
//         // The client SDK will parse the code from the link for you.
//         final userCredential = await FirebaseAuth.instance.signInWithEmailLink(
//             email: userEmail, emailLink: emailLink.path.toString());
//
//         final authCredential = EmailAuthProvider.credentialWithLink(
//             email: userEmail, emailLink: emailLink.path.toString());
//
//         try {
//           final UserCredential? userCred = await FirebaseAuth
//               .instance.currentUser
//               ?.linkWithCredential(authCredential);
//         } catch (error) {
//           print("Error linking emailLink credential.");
//         }
//         print('Successfully signed in with email link!');
//       } catch (error) {
//         print('Error getting credentials with email link.');
//       }
//     }
//     return _linkSuccess;
//   }
//
//   static Future<bool> linkEmailPasswordCredentials(
//       String userEmail, String password) async {
//     bool linkSuccess = false;
//     try {
//       // The client SDK will parse the code from the link for you.
//       /*
//         final userCredential = await FirebaseAuth.instance.signInWithEmailLink(
//             email: userEmail, emailLink: emailLink.path.toString());
//          */
//       final authCredential =
//           EmailAuthProvider.credential(email: userEmail, password: password);
//       if (kDebugMode) print('providerId: ${authCredential.providerId}');
//       try {
//         final UserCredential? userCred = await FirebaseAuth.instance.currentUser
//             ?.linkWithCredential(authCredential);
//         linkSuccess = (userCred != null);
//         if (kDebugMode) print('linkSuccess: ${linkSuccess}');
//       } on FirebaseAuthException catch (e) {
//         switch (e.code) {
//           case "provider-already-linked":
//             print("The provider has already been linked to the user.");
//             break;
//           case "invalid-credential":
//             print("The provider's credential is not valid.");
//             break;
//           case "credential-already-in-use":
//             print("The account corresponding to the credential already exists, "
//                 "or is already linked to a Firebase User.");
//             break;
//           // See the API reference for the full list of error codes.
//           default:
//             print("${e.code}, ${e.credential}");
//         }
//       }
//       if (linkSuccess) print('Successfully signed in with email link!');
//     } catch (error) {
//       print('Error getting credentials with email link.');
//     }
//     return linkSuccess;
//   }
//
//   static Future<User?> signInWithApple() async {
//     User? user;
//     // To prevent replay attacks with the credential returned from Apple, we
//     // include a nonce in the credential request. When signing in in with
//     // Firebase, the nonce in the id token returned by Apple, is expected to
//     // match the sha256 hash of `rawNonce`.
//     final rawNonce = generateNonce();
//     final nonce = sha256ofString(rawNonce);
//
//     try {
//       // Request credential for the currently signed in Apple account.
//       final appleCredential = await SignInWithApple.getAppleIDCredential(
//         scopes: [
//           AppleIDAuthorizationScopes.email,
//           AppleIDAuthorizationScopes.fullName,
//         ],
//         nonce: nonce,
//       );
//
//       if (kDebugMode) {
//         print(appleCredential.authorizationCode);
//       }
//
//       // Create an `OAuthCredential` from the credential returned by Apple.
//       final oauthCredential = OAuthProvider("apple.com").credential(
//         idToken: appleCredential.identityToken,
//         rawNonce: rawNonce,
//       );
//
//       // Sign in the user with Firebase. If the nonce we generated earlier does
//       // not match the nonce in `appleCredential.identityToken`, sign in will fail.
//       final UserCredential userCred =
//           await FirebaseAuth.instance.signInWithCredential(oauthCredential);
//       user = userCred.user;
//       /*
//       final displayName =
//           '${appleCredential.givenName} ${appleCredential.familyName}';
//       final userEmail = '${appleCredential.email}';
//
//       print(displayName);
//       await firebaseUser.updateProfile(displayName: displayName);
//       await firebaseUser.updateEmail(userEmail);
//       // Once signed in, return the UserCredential
//       UserCredential userCred =
//       await FirebaseAuth.instance.signInWithCredential(credential);
//        */
//
//     } catch (exception) {
//       if (kDebugMode) {
//         print(exception);
//       }
//     }
//
//     if (kDebugMode) {
//       print(user);
//     }
//     return user;
//   }
//
//   static Future<User?> signInWithGoogle() async {
//     User? user;
//     // Trigger the authentication flow
//     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//     // Obtain the auth details from the request
//     final GoogleSignInAuthentication googleAuth =
//         await googleUser!.authentication;
//
//     // Create a new credential
//     final credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );
//
//     // Once signed in, return the UserCredential
//     UserCredential userCred =
//         await FirebaseAuth.instance.signInWithCredential(credential);
//     user = userCred.user;
//
//     if (kDebugMode) {
//       print(user);
//     }
//     return user;
//   }
//
//   /*
//   static Future<LoginResponse> viewModel(String username, String password) async {
//     return Future.delayed(const Duration(milliseconds: 1000), () {
//       if (username.isEmpty || password.isEmpty) {
//         Error error = new Error();
//         return Future.error(error);
//       } else {
//         LoginResponse response =
//             new LoginResponse(userId: 0, userName: "Redux example");
//         return response;
//       }
//     });
//   }*/
//
//   // Example code of how to verify phone number
//   static Future<User?> signInWithPhoneNumber(
//     String verId,
//     String smsCodeStr,
//   ) async {
//     FirebaseAuth auth = FirebaseAuth.instance;
//
//     User? user;
//     try {
//       final PhoneAuthCredential credential = PhoneAuthProvider.credential(
//         verificationId: verId,
//         smsCode: smsCodeStr,
//       );
//       user = (await auth.signInWithCredential(credential)).user!;
//     } catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//     }
//     return user;
//   }
//
//   static Future<User?> signInUsingEmailPassword(
//     String email,
//     String password,
//   ) async {
//     FirebaseAuth auth = FirebaseAuth.instance;
//     User? user;
//
//     try {
//       UserCredential userCredential = await auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       //user = userCredential.user;
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         if (kDebugMode) {
//           print('No user found for that email.');
//         }
//       } else if (e.code == 'wrong-password') {
//         if (kDebugMode) {
//           print('Wrong password provided.');
//         }
//       } else {
//         if (kDebugMode) {
//           print(e.code);
//         }
//       }
//     }
//     if (kDebugMode) {
//       print(user);
//     }
//     return user;
//   }
//
//   static Future<User?> registerUsingEmailPassword(
//     String name,
//     String email,
//     String password,
//   ) async {
//     FirebaseAuth auth = FirebaseAuth.instance;
//     User? user;
//     try {
//       UserCredential userCredential = await auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       user = userCredential.user;
//       await user?.updateDisplayName(name);
//       await user?.reload();
//       user = auth.currentUser;
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         if (kDebugMode) {
//           print('The password provided is too weak.');
//         }
//       } else if (e.code == 'email-already-in-use') {
//         if (kDebugMode) {
//           print('The account already exists for that email.');
//         }
//       }
//     } catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//     }
//     if (kDebugMode) {
//       print(user);
//     }
//     return user;
//   }
//
//   static Future<void> logout() async {
//     await FirebaseAuth.instance.signOut();
//   }
//
//   static Future<void> createNewWallet(String uuid) async {
//     String localWallet = Globals.HK_WALLET;
//     if (Globals.REGION == Globals.SG_CODE) {
//       localWallet = Globals.SG_WALLET;
//     } else if (Globals.REGION == Globals.TH_CODE) {
//       localWallet = Globals.TH_WALLET;
//     }
//     final walletsColRef = FirebaseFirestore.instance
//         .collection(localWallet)
//         .withConverter<Wallet>(
//           fromFirestore: (snapshot, _) => Wallet.fromJson(snapshot.data()!),
//           toFirestore: (wallet, _) => wallet.toJson(),
//         );
//
//     walletsColRef
//         .doc(uuid)
//         .set(
//           Wallet(
//             id: uuid,
//             encryptedToken: '',
//             balance: 0.0,
//             points: 0.0,
//             voucherTxCount: 0,
//             unreadMsgCount: 0,
//             dateCreated: Timestamp.fromDate(DateTime.now()),
//             lastUpdated: Timestamp.fromDate(DateTime.now()),
//             enabled: true,
//           ),
//         )
//         .then((value) async {
//       if (kDebugMode) {
//         print("New wallet added.");
//       }
//       final myHash = HashIds(salt: 'CD Mob App Salt');
//       String my_uid = myHash.encode(DateTime.now().millisecondsSinceEpoch);
//
//       String apiUrl = Globals.UNLOCK_REWARD;
//       String checksum =
//           sha256.convert(utf8.encode(my_uid + 'CDMob App Scret')).toString();
//
//       final response = await http.post(Uri.parse(apiUrl), body: {
//         //'mode': txMode,
//         'uid': uuid,
//         'region': Globals.REGION,
//         'msgId': Globals.REWARD_FIRST_MSG_ID, //welcome message
//         't_uid': my_uid,
//         'checksum': checksum,
//       });
//
//       if (response.statusCode == 200) {
//         // If the server did return a 200 OK response,
//         // then parse the JSON.
//         //return Album.fromJson(jsonDecode(response.body));
//         if (kDebugMode) {
//           print('response OK');
//         }
//       } else {
//         // If the server did not return a 200 OK response,
//         // then throw an exception.
//         throw Exception('Network Failed. Unlock reward unsuccessful.');
//       }
//     }).catchError((error) {
//       if (kDebugMode) {
//         print("Failed to add new wallet: $error");
//       }
//     });
//   }
//
//   static Future<void> addItem({
//     required String title,
//     required String description,
//   }) async {
//     CollectionReference documentReferencer =
//         FirebaseFirestore.instance.collection('vouchers');
//     //_mainCollection.doc(userUid).collection('items').doc();
//
//     Map<String, dynamic> data = <String, dynamic>{
//       "title": title,
//       "description": description,
//     };
//
//     /*await documentReferencer
//       .set(data)
//       .whenComplete(() => print("Notes item added to the database"))
//       .catchError((e) => print(e));
//      */
//   }
// }
