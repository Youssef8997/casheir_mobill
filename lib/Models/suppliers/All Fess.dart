import 'package:casheir_mobill/Componads/AppBar.dart';
import 'package:casheir_mobill/Cuibt/State.dart';
import 'package:casheir_mobill/Cuibt/cuibt.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../translations/locale_keys.g.dart';

class AllFess extends StatelessWidget {
  var index;
  AllFess({this.index});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MobilCuibt, MobilState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cuibt = MobilCuibt.get(context);
        var listFess = MobilCuibt.get(context).fess;
        var Size = MediaQuery.of(context).size;
        return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: myAppBar(text:LocaleKeys.title6.tr(), Action: []),
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
              child: ConditionalBuilder(
                builder:(context)=> SafeArea(
                  child: Column(children: [
                    Expanded(
                        child: precentge_circular(
                            precent: (cuibt.suppliers[index].TotalSuppliers!/cuibt.suppliers[index].AllMoney!)
                            , size: Size, cuibt: cuibt)),
                    Expanded(
                      child: ListView.separated(
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, i) => showFess(context,
                              user: listFess[i].name!,
                              date: listFess[i].feesDate!,
                              fess: listFess[i].Paid!,
                              moneyBefore: listFess[i].TotalSuppliers!+listFess[i].Paid!,
                              moneyAfter: listFess[i].TotalSuppliers!),
                          separatorBuilder: (context, _) =>
                          const SizedBox(height: 15),
                          itemCount: listFess.length),
                    ),
                  ]),
                ),
                fallback: (context)=>Center(child:CircularProgressIndicator()),
                condition: listFess.isNotEmpty,
              ),




            ));
      },
    );
  }

  Widget precentge_circular(
      {required Size size,
      required double precent,
      required MobilCuibt cuibt}) {
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
              cuibt.suppliers[index].name!,
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
              "${LocaleKeys.total_money.tr()} : ${cuibt.suppliers[index].TotalSuppliers!} ${LocaleKeys.le.tr()}",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 21,
              ),
            ),
            Text(
              "${LocaleKeys.fees.tr()} : ${cuibt.suppliers[index].LastPaid!} ${LocaleKeys.le.tr()}",
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
                      "${LocaleKeys.fees6.tr()}: $fess ${LocaleKeys.le.tr()}",
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
                      "$moneyBefore ${LocaleKeys.le.tr()}",
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
                      "$moneyAfter ${LocaleKeys.le.tr()}",
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
