import 'package:casheir_mobill/Componads/AppBar.dart';
import 'package:casheir_mobill/Cuibt/State.dart';
import 'package:casheir_mobill/Cuibt/cuibt.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../moudle/Date Empoloyee.dart';
import '../../translations/locale_keys.g.dart';

class Empo extends StatefulWidget {
  int? index;
  Empo({this.index});
  @override
  State<Empo> createState() => _EmpoState(index);
}

class _EmpoState extends State<Empo> {
  int? index;
  _EmpoState(this.index);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MobilCuibt, MobilState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cuibt = MobilCuibt.get(context);
        var TimeList = cuibt.employeeDate;
        var size = MediaQuery.of(context).size;
        return Scaffold(
          key: cuibt.employeeScaffold,
          extendBodyBehindAppBar: true,
          appBar: myAppBar(text: LocaleKeys.details.tr(), Action: []),
          body: Container(
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/assest/Wallpaperbluer.jpg"),
                fit: BoxFit.fill,
              ),
            ),
            child: ConditionalBuilder(
              builder: (context) => SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      listTileWidget(cuibt),
                      if (cuibt.selectedTile == 1) timeColumn(TimeList, cuibt),
                      if (cuibt.selectedTile == 2) ratingColumn(cuibt),
                      if (cuibt.selectedTile == 3) moneyColumn(cuibt),
                    ],
                  ),
                ),
              ),
              fallback: (context) => Center(child: CircularProgressIndicator()),
              condition: TimeList.isNotEmpty,
            ),
          ),
        );
      },
    );
  }

  Widget listTileWidget(MobilCuibt cuibt) {
    return ListTileTheme(
      iconColor: Colors.white,
      textColor: Colors.white,
      enableFeedback: true,
      selectedTileColor: Colors.teal,
      selectedColor: Colors.blue[200],
      child: Column(
        children: [
          ListTile(
            onTap: () => cuibt.changeSelectedTile(1),
            selected: cuibt.selectedTile == 1,
            leading: const Icon(Icons.access_time_outlined),
            title:  Text(
              LocaleKeys.time.tr(),
    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            subtitle:  Text(
              LocaleKeys.empo_description1.tr(),
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            trailing: cuibt.selectedTile == 1
                ? const Icon(Icons.arrow_downward_outlined)
                : null,
          ),
          ListTile(
            onTap: () => cuibt.changeSelectedTile(3),
            selected: cuibt.selectedTile == 3,
            leading: const Icon(
              Icons.monetization_on,
              color: Colors.greenAccent,
            ),
            title:  Text(
              LocaleKeys.empo2.tr(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            subtitle:  Text(
              LocaleKeys.empo_desc.tr(),
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            trailing: cuibt.selectedTile == 3
                ? const Icon(Icons.arrow_downward_outlined)
                : null,
          ),
          ListTile(
            onTap: () => cuibt.changeSelectedTile(2),
            selected: cuibt.selectedTile == 2,
            leading: const Icon(
              Icons.star,
              color: Colors.yellow,
            ),
            title:  Text(
              LocaleKeys.Rating.tr(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            subtitle:  Text(
              LocaleKeys.Rate_employee.tr(),
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            trailing: cuibt.selectedTile == 2
                ? const Icon(Icons.arrow_downward_outlined)
                : null,
          ),
        ],
      ),
    );
  }

  Widget timeColumn(List<EmployeeDateModule> TimeList, MobilCuibt cuibt) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width,
        child: ListView.separated(
          itemBuilder: (context, i) {
            int lateMin =
                (int.parse(TimeList[i].AttendanceDate!.substring(2, 5)) -
                            int.parse(cuibt
                                .employee[widget.index!].AttendanceDate!
                                .substring(2, 5)))
                        .isNegative
                    ? 6
                    : (int.parse(TimeList[i].AttendanceDate!.substring(2, 5)) -
                            int.parse(cuibt
                                .employee[widget.index!].AttendanceDate!
                                .substring(2, 5)))
                        .abs();
            int overMin = int.parse(TimeList[i].LeavingDate!.substring(2, 5)) -
                int.parse(
                    cuibt.employee[widget.index!].LeavingDate!.substring(2, 5));
            int Overhour = int.parse(TimeList[i].LeavingDate![0]) -
                int.parse(cuibt.employee[widget.index!].LeavingDate![0]);
            int totalhour = (overMin + Overhour) - lateMin;

            return showTime(
              context,
              date: TimeList[i].DataTimeDay!,
              attendance: TimeList[i].AttendanceDate!,
              leave: TimeList[i].LeavingDate!,
              lateTime: lateMin.toString(),
              overTime: totalhour.toString(),
            );
          },
          separatorBuilder: (context, _) => SizedBox(
            height: 25,
          ),
          itemCount: TimeList.length,
        ),
      ),
    );
  }

  Widget ratingColumn(MobilCuibt cuibt) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
           Text(
           LocaleKeys.Rate_employee.tr(),
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(
            height: 15,
          ),
          RatingBar.builder(
            initialRating: 3,
            itemCount: 5,
            allowHalfRating: true,
            itemBuilder: (context, index) {
              switch (index) {
                case 0:
                  return const Icon(
                    Icons.sentiment_very_dissatisfied,
                    color: Colors.red,
                  );
                case 1:
                  return const Icon(
                    Icons.sentiment_dissatisfied,
                    color: Colors.redAccent,
                  );
                case 2:
                  return const Icon(
                    Icons.sentiment_neutral,
                    color: Colors.amber,
                  );
                case 3:
                  return const Icon(
                    Icons.sentiment_satisfied,
                    color: Colors.lightGreen,
                  );
                case 4:
                  return const Icon(
                    Icons.sentiment_very_satisfied,
                    color: Colors.green,
                  );
                default:
                  return const SizedBox.shrink();
              }
            },
            onRatingUpdate: (rating) {},
            itemPadding: const EdgeInsets.symmetric(horizontal: 5.0),
          ),
          const SizedBox(
            height: 50,
          ),
           Text(
             LocaleKeys.rate3.tr(),
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(
            height: 15,
          ),
          RatingBar.builder(
            ignoreGestures: true,
            initialRating: double.parse(cuibt.rate!.rate!),
            itemCount: 5,
            allowHalfRating: true,
            itemBuilder: (context, index) {
              switch (index) {
                case 0:
                  return const Icon(
                    Icons.sentiment_very_dissatisfied,
                    color: Colors.red,
                  );
                case 1:
                  return const Icon(
                    Icons.sentiment_dissatisfied,
                    color: Colors.redAccent,
                  );
                case 2:
                  return const Icon(
                    Icons.sentiment_neutral,
                    color: Colors.amber,
                  );
                case 3:
                  return const Icon(
                    Icons.sentiment_satisfied,
                    color: Colors.lightGreen,
                  );
                case 4:
                  return const Icon(
                    Icons.sentiment_very_satisfied,
                    color: Colors.green,
                  );
                default:
                  return const SizedBox.shrink();
              }
            },
            onRatingUpdate: (rating) {},
            itemPadding: const EdgeInsets.symmetric(horizontal: 5.0),
          )
        ],
      ),
    );
  }

  Widget moneyColumn(MobilCuibt cuibt) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: SizedBox(
          height: MediaQuery.of(context).size.height * .8,
          width: MediaQuery.of(context).size.width,
          child: ListView.separated(
              itemBuilder: (context, i) => showMoney(context,
                  user:cuibt.employeeMoney[i].Name!,
                  date: cuibt.employeeMoney[i].date!,
                  money: cuibt.employeeMoney[i].paidMoney!,
                  moneyBefore:cuibt.employeeMoney[i].MoneyBefore! ,
                  moneyAfter: cuibt.employeeMoney[i].restSalary!),
              separatorBuilder: (context, _) => const SizedBox(
                    height: 10,
                  ),
              itemCount: cuibt.employeeMoney.length)),
    );
  }





  Widget showTime(context,
      {required String date,
      required String attendance,
      required String leave,
      required String overTime,
      required String lateTime}) {
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
              color: Colors.white.withOpacity(.8),
              borderRadius: BorderRadius.circular(40),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 5,
                  spreadRadius: 6,
                  offset: const Offset(0, 5),
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
                      attendance,
                      style: const TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
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
                      leave,
                      style: const TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
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
                      "$lateTime Min Late",
                      style: const TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                        decoration: TextDecoration.underline,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )),
                    const SizedBox(
                      width: 30,
                    ),
                    Expanded(
                        child: Text(
                      "$overTime Min Over",
                      style: const TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
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

  Widget showMoney(context,
      {required String date,
      required String user,
      required String money,
      required double moneyBefore,
      required String moneyAfter}) {
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
                      "$money LE",
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
