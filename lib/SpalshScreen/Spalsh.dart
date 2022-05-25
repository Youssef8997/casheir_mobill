import 'package:casheir_mobill/Componads/Comoonads.dart';
import 'package:casheir_mobill/sign/signin.dart';
import 'package:connection_notifier/connection_notifier.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../HomeLayout/HomeLayout.dart';
import '../SheredPrefrence/shered.dart';
late Widget widget;
class Spalsh extends StatefulWidget {
  @override
  State<Spalsh> createState() => _SpalshState();
}

class _SpalshState extends State<Spalsh> with TickerProviderStateMixin {
  late final AnimationController _controller;
  String? Token;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);

    if(sherdprefrence.getdate(key:'Token')==null){
     widget= SignIn();
    }
    else {
      widget =HomeLayout();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown[800],
      child: Center(
        child: ConnectionNotifierToggler(
          onConnectionStatusChanged: (bool? status) {
            if (status = true) {
              _controller
                ..duration = const Duration(milliseconds: 1500)
                ..forward().then((value) =>
                    nevigator(bool: false, context: context, page: widget));
            }
          },
          disconnected: Lottie.asset(
            'lib/assest/Lottie.json',
            repeat: true,
            controller: _controller,
            onLoaded: (composition) {
              _controller
                ..duration = composition.duration
                ..repeat().then((value) {});
            },
          ),
          connected: Lottie.asset(
            'lib/assest/Lottie.json',
            controller: _controller,
            repeat: true,
            onLoaded: (composition) {
              _controller
                ..duration = composition.duration
                ..forward().then((value) =>
                    nevigator(bool: false, context: context, page: widget));
            },
          ),
        ),
      ),
    );
  }
}
