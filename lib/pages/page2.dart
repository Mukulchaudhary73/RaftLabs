import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:raftlabs/utils/customWidgets.dart';

class WelcomeMessage extends StatefulWidget {
  WelcomeMessage({Key? key}) : super(key: key);

  @override
  State<WelcomeMessage> createState() => _WelcomeMessageState();
}

class _WelcomeMessageState extends State<WelcomeMessage> {
  late StreamSubscription subscription;
  bool connection = false;
  @override
  void initState() {
    getConnectivity();
    super.initState();
  }

  getConnectivity() {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile) {
        setState(() {
          connection = true;
        });
      } else if (result == ConnectivityResult.wifi) {
        setState(() {
          connection = true;
        });
      } else if (result == ConnectivityResult.none) {
        setState(() {
          connection = false;
        });
      }
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    int hour = now.hour;

    return Center(
        child: hour >= 0 && hour <= 11
            ? CustomGreetingsColumn(
                imageName: 'assets/gif1.gif',
                greetingName: 'Good Morning',
                connectionImage: 'assets/gif6.gif',
                isConnected: connection,
              )
            : hour >= 12 && hour <= 16
                ? CustomGreetingsColumn(
                    imageName: 'assets/gif5.gif',
                    greetingName: 'Good Afternoon',
                    connectionImage: 'assets/gif6.gif',
                    isConnected: connection,
                  )
                : CustomGreetingsColumn(
                    imageName: 'assets/gif3.gif',
                    greetingName: 'Good Evening',
                    connectionImage: 'assets/gif6.gif',
                    isConnected: connection,
                  ));
  }
}
