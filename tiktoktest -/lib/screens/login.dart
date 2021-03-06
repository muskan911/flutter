import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import './home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String msg = '';
  bool isLogin = false;
  String url =
      'https://cdn.iconscout.com/icon/free/png-256/laptop-user-1-1179329.png';
  FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();
  _signOut() {
    googleSignIn.signOut();
    setState(() {
      msg = 'U Logout SuccessFully....';
      url =
      //'https://img.icons8.com/cotton/2x/logout-rounded-left.png'
      'https://cdn.clipart.email/3f30c2be220eb22205e9176cbf560deb_entry-20-by-teambart-for-create-a-user-icon-silhouette-freelancer_792-612.jpeg';
      isLogin = false;
    });
  }

  _doLogin() async {

    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication gsa = await googleSignInAccount.authentication;
    print("GSA is ${gsa.idToken} and ${gsa.accessToken}");
    AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: gsa.idToken, accessToken: gsa.accessToken);
    AuthResult result = await _auth.signInWithCredential(credential);
    FirebaseUser user = result.user;
    print("User Info ${user.displayName} ${user.email} ");
    setState(() {
      msg = 'Welcome ${user.displayName}';
      url = user.photoUrl;
      isLogin = true;
      _moveToHomePage(user.displayName, user.photoUrl);
    });
  }

  _moveToHomePage(String name, String photoUrl) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              msg,
              style: TextStyle(fontSize: 30),
            ),
            Image.network(url),
            Container(
              child: RaisedButton(
                onPressed: () {
                  if (!isLogin) {
                    _doLogin();
                  } else {
                    _signOut();
                  }
                },
                child: Text(isLogin ? 'Logout' : 'Login'),
                padding: EdgeInsets.all(5),
                elevation: 5,
                splashColor: Colors.orange,
                color: Colors.tealAccent,
              ),
            )
          ],
        ),
      ),
    );
  }
}
