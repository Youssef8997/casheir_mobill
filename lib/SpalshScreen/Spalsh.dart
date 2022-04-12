import 'package:casheir_mobill/Componads/Comoonads.dart';
import 'package:casheir_mobill/HomeLayout/HomeLayout.dart';
import 'package:connection_notifier/connection_notifier.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class Spalsh extends StatefulWidget {
  @override
  State<Spalsh> createState() => _SpalshState();
}

class _SpalshState extends State<Spalsh>with TickerProviderStateMixin {
  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue[800],
      child: Center(
        child: ConnectionNotifierToggler(
          onConnectionStatusChanged: (bool? status) {
            if (status=false) {
              _controller
                ..duration =  Duration(milliseconds: 1500)
                ..forward().then((value) =>Nevigator(bool: false, context: context,page: HomeLayout()));
            }
          },
          disconnected: Lottie.asset(
            'lib/assest/Lottie.json',
            controller: _controller,
            onLoaded: (composition) {
              _controller
                ..duration = composition.duration
                ..repeat().then((value) {}
                );

            },

          ),
          connected: Lottie.asset(

            'lib/assest/Lottie.json',
            controller: _controller,
            onLoaded: (composition) {
              _controller
                ..duration =Duration(milliseconds:1500)
                ..forward().then((value) =>Nevigator(bool: false, context: context,page: HomeLayout())
                );

            },

          ),

        ),

      ),
    );
  }
}
