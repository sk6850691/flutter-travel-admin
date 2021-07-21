import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';



enum Status{Uninitialized,Authenticated,Unauthenticated,Authenticating}

class UserProvider extends ChangeNotifier {

  FirebaseAuth auth = FirebaseAuth.instance;
  User user;


  Map cartitem;

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleUser
        .authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,

    );

    return await auth.signInWithCredential(credential).then((value) {
      user = value.user;
      FirebaseFirestore.instance.collection('users').doc(value.user.uid).set({
        "id": value.user.uid,
        "name": value.user.displayName,
        "email": value.user.email
      });
    });
  }


  Status status = Status.Uninitialized;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  TextEditingController phoneController = TextEditingController();


  UserProvider.intialize(){


  }

  googleSignOut() {
    auth.signOut();
  }

  signin() {


  }

  signUp() {
    auth.signInWithPhoneNumber(phoneController.text, RecaptchaVerifier(

        container: 'rewcaptcha',
        size: RecaptchaVerifierSize.compact,
        theme: RecaptchaVerifierTheme.dark
    ));
  }


}






