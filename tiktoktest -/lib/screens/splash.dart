import 'dart:async';

import 'package:flutter/material.dart';

import 'package:tiktoktest/screens/login.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  String url = "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.tiktok.com%2Ftrending&psig=AOvVaw2lPj7zvibL0irA2YJ64SPU&ust=1588192917288000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCLCXien9i-kCFQAAAAAdAAAAABAD";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 7), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Stack(
            children: <Widget>[
              Container(
                color:Colors.pink,
                width: mediaQuery.width,
                height: mediaQuery.height,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        maxRadius: 200,
                        backgroundImage: NetworkImage(url),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        'Loading...',
                        style: TextStyle(fontSize: 30),
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}