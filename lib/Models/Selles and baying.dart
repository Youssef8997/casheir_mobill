import 'package:casheir_mobill/Componads/Comoonads.dart';
import 'package:casheir_mobill/Cuibt/State.dart';
import 'package:casheir_mobill/Cuibt/cuibt.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../translations/locale_keys.g.dart';

class SellesABuying extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MobilCuibt, MobilState>(
      listener: (context, state) {},
      builder: (context, state) {
        var Size = MediaQuery.of(context).size;
        var cuibt = MobilCuibt.get(context);
        return SafeArea(
            child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          physics: const BouncingScrollPhysics(),
          child: ConditionalBuilder(
            condition: cuibt.user != null && cuibt.money != null,
            builder: (context) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${LocaleKeys.hi.tr()} ${cuibt.user!.name}!",
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontStyle: FontStyle.italic),
                ),
                 Text(
                  LocaleKeys.descriptionsells.tr(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white54,
                  ),
                ),
                MyExpansionTile(
                  Size: Size,
                  Children: [_balanceContents(cuibt)],
                  Title:LocaleKeys.account.tr(),
                  SubTitle:
                  LocaleKeys.description1.tr(),
                  cuibt: cuibt,
                ),
                MyExpansionTile(
                  Size: Size,
                  Children: [_sellsContents(cuibt)],
                  Title:LocaleKeys.bar1.tr(),
                  SubTitle:
                  LocaleKeys.description2.tr(),
                  cuibt: cuibt,
                ),
                MyExpansionTile(
                  Size: Size,
                  Children: [_paymentContents(cuibt)],
                  Title: LocaleKeys.title3.tr(),
                  SubTitle:
                  LocaleKeys.description3.tr(),
                  cuibt: cuibt,
                ),
                MyExpansionTile(
                  Size: Size,
                  Children: [_mostContents(context, cuibt)],
                  Title:  LocaleKeys.title4.tr(),
                  SubTitle: LocaleKeys.description4.tr(),
                  cuibt: cuibt,
                ),
                MyExpansionTile(
                  Size: Size,
                  Children: [_leastContents(Size,cuibt)],
                  Title: LocaleKeys.title5.tr(),
                  SubTitle: LocaleKeys.description5.tr(),
                  cuibt: cuibt,
                ),
              ],
            ),
            fallback: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ));
      },
    );
  }

  Widget MyExpansionTile(
      {required Size Size,
      required List<Widget> Children,
      required String Title,
      String? SubTitle,
      required MobilCuibt cuibt}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      margin: const EdgeInsetsDirectional.all(20.0),
      width: Size.width * .8,
      decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey[800]!, width: 2),
          boxShadow: [
            BoxShadow(
                color: Colors.grey[900]!,
                blurRadius: 3,
                spreadRadius: 1.5,
                offset: const Offset(0, 5)),
          ]),
      //To hide Subtitle
      child: ExpansionTile(
        childrenPadding: const EdgeInsets.symmetric(vertical: 10),
        subtitle: Text(
          SubTitle!,
          style: TextStyle(
              color: Colors.grey[800]!,
              fontSize: Size.width * .04,
              fontWeight: FontWeight.bold),
        ),
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(
          Title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
        ),
        maintainState: true,
        children: Children,
      ),
    );
  }

  Column _balanceContents(MobilCuibt cuibt) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Row of Money
        Row(
          children: [
            Text(
              "\$",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Colors.teal[700]!),
            ),
            const SizedBox(width: 3),
            Text(
              "${cuibt.money!.moneyInBox} ${LocaleKeys.le.tr()}",
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
            ),
          ],
        ),
        UserNMoney(
            Money: cuibt.money!.moneyInBox!,
            NU: cuibt.BranchName,
            precent: (30.0).ceil()),
      ],
    );
  }

  Column UserNMoney(
      {required String NU, required double Money, required int precent}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
          child: Text("${NU} ${LocaleKeys.branch.tr()}",
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          onPressed: () {},
        ),
        Row(
          children: [
            Text("$Money ${LocaleKeys.le.tr()}",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800]!)),
            const Spacer(),
            Container(
              color: Colors.white.withOpacity(.15),
              child: const Icon(
                Icons.trending_up_outlined,
                color: Colors.white60,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              "$precent %",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ],
        ),
      ],
    );
  }

  Column _sellsContents(MobilCuibt cuibt) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Row of Money
        Row(
          children: [
            Text(
              "\$",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Colors.teal[700]!),
            ),
            const SizedBox(width: 3),
            Text(
              "${cuibt.money!.allMoneyGeted!} ${LocaleKeys.le.tr()}",
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
            ),
          ],
        ),
        UserNMoney(
            Money: cuibt.money!.allMoneyGeted!,
            NU:cuibt.BranchName,
            precent: (30.0).ceil()),
      ],
    );
  }

  Column _paymentContents(MobilCuibt cuibt) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Row of Money
        Row(
          children: [
            Text(
              "\$",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Colors.teal[700]!),
            ),
            const SizedBox(width: 3),
            Text(
              "${cuibt.money!.moneyPaid} ${LocaleKeys.le.tr()}",
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        //Row of analytics
        UserNMoney(
            Money: cuibt.money!.moneyPaid!, NU: cuibt.BranchName, precent: (30.0).ceil()),
      ],
    );
  }

  Widget _mostContents(context, MobilCuibt cuibt) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .8,
      height: MediaQuery.of(context).size.height * .38,
      child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) => progerssBar(context,
              text: cuibt.itemsQuantity[i].Name,
              percentage: cuibt.itemsQuantity[i].quantity!,
              color: mostColors[i]),
          separatorBuilder: (context, _) => const SizedBox(
                width: 5,
              ),
          itemCount: cuibt.itemsQuantity.length.clamp(0, 5)),
    );
  }

  SizedBox _leastContents(Size size, MobilCuibt cuibt) {
    return SizedBox(
      width: size.width * .8,
      height: size.height * .38,
      child: ListView.separated(
          itemBuilder: (context, i) =>
              _showItems(size, lessColors[i], NOF:cuibt.itemsQuantityLess[i].Name!, HM: 60, HMany: cuibt.itemsQuantityLess[i].quantity!),
          separatorBuilder: (context, _) => const SizedBox(
                height: 10,
              ),
          itemCount:5),
    );
  }

  Container _showItems(Size Size, color,
      {required String NOF, required double HM, required double HMany}) {
    return Container(
      margin: const EdgeInsetsDirectional.all(8.0),
      padding: const EdgeInsets.only(right:10, left:15),
      height: 80,
      width: Size.width,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50.0),
          border: Border.all(color: Colors.grey[600]!, width: 4)),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Name of product
              SizedBox(
                width: Size.width * .35,
                child: Text(
                  NOF,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w900),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "${HM} ${LocaleKeys.le.tr()}",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[800]!,
                    fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          const Spacer(),
          //how many packages sell
          SizedBox(
            width: Size.width * .2,
            child: Text(
              "${HMany.ceil()} ${LocaleKeys.package.tr()}",
              style: const TextStyle(
                  fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,

            ),
          ),
        ],
      ),
    );
  }

  Column progerssBar(context,
      {required text, required double percentage, required Color color}) {
    var precint =
        (((percentage / MobilCuibt.get(context).allQuantity) * 100).floor()) /
            100;
    return Column(
      children: [
        Container(
          width: 50,
          child: RotatedBox(
            quarterTurns: 3,
            child: LinearPercentIndicator(
              barRadius: const Radius.circular(10),
              width: MediaQuery.of(context).size.height * .3,
              animation: true,
              lineHeight: 30.0,
              animationDuration: 2500,
              percent: precint,
              progressColor: color,
              restartAnimation: true,
              center: Text(
                "${(((percentage / MobilCuibt.get(context).allQuantity) * 100)).floor()}%",
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Text(text,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
