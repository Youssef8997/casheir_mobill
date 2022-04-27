import 'package:casheir_mobill/Componads/AppBar.dart';
import 'package:casheir_mobill/Cuibt/State.dart';
import 'package:casheir_mobill/Cuibt/cuibt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class AllFess extends StatelessWidget {
  final String userName;
  final String suppliersName;
  final double totalMoney;
  final double lastFess;
  final List Fess;

  const AllFess(
      {required this.userName,
      required this.suppliersName,
      required this.totalMoney,
      required this.lastFess,
      required this.Fess});
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
              padding: const EdgeInsets.only(left: 10, right: 10),
              height: Size.height,
              width: Size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("lib/assest/Wallpaperbluer.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
              child: SafeArea(
                child: ListView (
                    children: [
                  Expanded(child: precentge_circular(precent: 1, size: Size)),
                      Expanded(
                        child: ListView.separated(
                          padding:EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context,i)=>showFess(context,user: userName,date:"20/10/2022",fess:500.0,moneyBefore:3000.0,moneyAfter: 2500.0 ),
                        separatorBuilder: (context,_)=>const SizedBox(height: 15),
                        itemCount:20),
                      ),
                ]),
              ),
            ));
      },
    );
  }

  Widget precentge_circular({
    required Size size,
    required double precent,
  }) {
    return Container(
      height: size.height * .5,
      width: size.width,

      child: CircularPercentIndicator(
        radius: size.width * .4,
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
              suppliersName,
              style: const TextStyle(
                  fontSize: 21,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Text("${(precent * 100).ceil()}%",
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
            Text(
              "Total Money : $totalMoney LE",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 21,
              ),
            ),
            Text(
              "Last fess : $lastFess LE",
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

  Widget showFess(context,
      {required String date,
      required String user,
      required double fess,
      required double moneyBefore,
      required double moneyAfter}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RotatedBox(
            quarterTurns: 3,
            child: Text(
              date,
              style: const TextStyle(
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
                  blurRadius: 5,
                  spreadRadius: 4,
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
                      user,
                      style: const TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )),
                    const SizedBox(
                      width: 30,
                    ),
                    Expanded(
                        child: Text(
                      "Fees: $fess LE",
                      style: const TextStyle(
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
                      "$moneyBefore LE",
                      style: const TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        decoration: TextDecoration.lineThrough,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )),
                    const SizedBox(
                      width: 30,
                    ),
                    Expanded(
                        child: Text(
                      "$moneyAfter LE",
                      style: const TextStyle(
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
