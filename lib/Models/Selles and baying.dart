import 'package:casheir_mobill/Cuibt/State.dart';
import 'package:casheir_mobill/Cuibt/cuibt.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class SellesABuying extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return BlocConsumer<MobilCuibt, MobilState>(
      listener: (context, state) {},
      builder: (context, state) {
        var Size = MediaQuery.of(context).size;
        var cuibt = MobilCuibt.get(context);
        return SafeArea(
          child:SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal:20,vertical: 20),
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  "Hi ${cuibt.user!.name}!",
                  style:const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontStyle: FontStyle.italic),
                ),
                const Text(
                  "Thanks for your trust in us to make your work more professional ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white54,
                  ),
                ),
                MyExpansionTile(
                  Size: Size,
                  Children: [_balanceContents()],
                  Title: "Account Balance",
                  SubTitle:
                  "All physical transactions are recorded in the account balance",
                  cuibt: cuibt,
                ),
                MyExpansionTile(
                  Size: Size,
                  Children: [_sellsContents()],
                  Title: "Sells",
                  SubTitle:
                  "The monetary gain you earned from selling your products",
                  cuibt: cuibt,
                ),
                MyExpansionTile(
                  Size: Size,
                  Children: [_paymentContents()],
                  Title: "Payments",
                  SubTitle:
                  "The money you paid to buy your products or raw materials",
                  cuibt: cuibt,
                ),
                MyExpansionTile(
                  Size: Size,
                  Children: [_mostContents(context)],
                  Title: "Most in demand",
                  SubTitle: "The most sold products",
                  cuibt: cuibt,
                ),
                MyExpansionTile(
                  Size: Size,
                  Children: [_leastContents(Size)],
                  Title: "least in demand",
                  SubTitle: "The least sold products",
                  cuibt: cuibt,
                ),
              ],
            ),
          )
        );
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
        onExpansionChanged: (bool) => cuibt.ChangeHideSubtitle(bool),
        subtitle: cuibt.hideSubtitle ??
            Text(
              SubTitle ?? "",
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

  Column _balanceContents() {
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
            const Text(
              "20,000 LE",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
            ),
          ],
        ),
        UserNMoney(Money: 10000, NU: "zyad", precent: (30.0).ceil()),
        UserNMoney(Money: 5000, NU: "3rfat", precent: (30.0).ceil()),
        UserNMoney(Money: 15000, NU: "magdy", precent: (30.0).ceil()),
      ],
    );
  }

  Column UserNMoney(
      {required String NU, required double Money, required int precent}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
          child: Text("${NU} user",
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          onPressed: () {},
        ),
        Row(
          children: [
            Text("$Money LE",
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

  Column _sellsContents() {
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
            const Text(
              "15,000 LE",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
            ),
          ],
        ),
        UserNMoney(Money: 10000, NU: "zyad", precent: (30.0).ceil()),
        UserNMoney(Money: 5000, NU: "3rfat", precent: (30.0).ceil()),
        UserNMoney(Money: 15000, NU: "magdy", precent: (30.0).ceil()),
      ],
    );
  }

  Column _paymentContents() {
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
            const Text(
              "4,000 LE",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        //Row of analytics
        UserNMoney(Money: 10000, NU: "zyad", precent: (30.0).ceil()),
        UserNMoney(Money: 5000, NU: "3rfat", precent: (30.0).ceil()),
        UserNMoney(Money: 15000, NU: "magdy", precent: (30.0).ceil()),
      ],
    );
  }

  Row _mostContents(context) {
    return Row(
      children: [
        progerssBar(context,
            color: const Color(0xffd8f3dc), percentage: .9, text: "pepsi"),
        const SizedBox(
          width: 3,
        ),
        progerssBar(context,
            color: const Color(0xffb7e4c7), percentage: .7, text: "cola"),
        const SizedBox(
          width: 3,
        ),
        progerssBar(context,
            color: const Color(0xff74c69d), percentage: .5, text: "twinkes"),
        const SizedBox(
          width: 3,
        ),
        progerssBar(context,
            color: const Color(0xff40916c), percentage: .4, text: "hogo"),
        const SizedBox(
          width: 3,
        ),
        progerssBar(context,
            color: const Color(0xff1b4332), percentage: .3, text: "pepsi"),
      ],
    );
  }

  Column _leastContents(Size) {
    return Column(
      children: [
        _showItems(Size, const Color(0xFFe63946),
            NOF: "prile", HMany: 10, HM: 60),
        _showItems(Size, const Color(0xFFE97171), NOF: "Axe", HM: 50, HMany: 20),
        _showItems(Size, const Color(0xFFFFCB8E),
            NOF: "Biscuit", HM: 40, HMany: 10),
        _showItems(Size, Colors.grey[500], NOF: "Chips", HM: 30, HMany: 5),
        _showItems(Size, const Color(0xFFF5EFEF),
            NOF: "Coffee", HM: 20, HMany: 3),
      ],
    );
  }

  Container _showItems(Size Size, color,
      {required String NOF, required double HM, required int HMany}) {
    return Container(
      margin: const EdgeInsetsDirectional.all(8.0),
      padding: const EdgeInsets.only(right: 10, left: 30),
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
              Text(
                NOF,
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "${HM} LE",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[800]!,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Spacer(),
          //how many packages sell
          Text(
            "${HMany} Package",
            style: const TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Column progerssBar(context,
      {required text, required double percentage, required Color color}) {
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
              percent: percentage,
              progressColor: color,
              restartAnimation: true,
              center: RotatedBox(
                quarterTurns: 1,
                child: Text(
                  "${(percentage * 100).ceil()}%",
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
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
