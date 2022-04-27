import 'package:casheir_mobill/Componads/AppBar.dart';
import 'package:casheir_mobill/Componads/Comoonads.dart';
import 'package:casheir_mobill/Cuibt/State.dart';
import 'package:casheir_mobill/Cuibt/cuibt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class AllFess extends StatefulWidget {
  @override
  State<AllFess> createState() => _AllFessState();
}

class _AllFessState extends State<AllFess> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MobilCuibt, MobilState>(
      listener: (context, state) {},
      builder: (context, state) {
        var Size = MediaQuery.of(context).size;
        return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: myAppBar(text: "All Fess", Action: []),
            body: Container(
              padding: EdgeInsets.only(top: 25, left: 10, right: 10),
              height: Size.height,
              width: Size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("lib/assest/Wallpaperbluer.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(children: [
                precentge_circular(precent: 1, size: Size),
                showFess()
              ]),
            ));
      },
    );
  }

  Widget precentge_circular({
    required Size size,
    required double precent,
  }) {
    return SizedBox(
      height: size.height * .5,
      width: size.width,
      child: CircularPercentIndicator(
        radius: 150,
        lineWidth: 10,
        linearGradient: const LinearGradient(colors: [
          Colors.tealAccent,
          Colors.blue,
        ]),
        percent: precent > 1 ? 1 : precent,
        center: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Pepsi",
              style: const TextStyle(
                  fontSize: 21,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text("${(precent * 100).ceil()}%",
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
            Text(
              "Total Money : 3000 LE",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 21,
              ),
            ),
            Text(
              "Total Money : 3000 LE",
              style: TextStyle(
                color: Colors.grey[600]!,
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),
            ),
          ],
        ),
        arcBackgroundColor: Colors.white54,
        animation: true,
        addAutomaticKeepAlive: true,
        animationDuration: 1200,
        animateFromLastPercent: false,
        curve: Curves.easeInCubic,
        arcType: ArcType.FULL,
      ),
    );
  }

  Widget showFess() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RotatedBox(
            quarterTurns: 3,
            child: Text(
              "20/4/2022",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
        Expanded(
          child: Container(
            height: 85,
            width: MediaQuery.of(context).size.width * .8,
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.blueGrey[700]!,
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[900]!,
                  blurRadius: 10,
                  spreadRadius: 5,
                  offset: const Offset(2, 5),
                )
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Text(
                      "youssef ahmed",
                      style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontStyle: FontStyle.italic,



                      ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                    )),
                  const   SizedBox(
                      width: 30,
                    ),
                    Expanded(
                        child: Text(
                      "Fees: 300 LE",
                      style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontStyle: FontStyle.italic),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                    )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Text(
                      "3300 LE",
                      style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                      decoration: TextDecoration.lineThrough,
                      ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                    )),
                    SizedBox(
                      width: 30,
                    ),
                    Expanded(
                        child: Text(
                      "3000 LE",
                      style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontStyle: FontStyle.italic),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                    )),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
