import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:casheir_mobill/Componads/TextForm.dart';
import 'package:casheir_mobill/Componads/mybutton.dart';
import 'package:casheir_mobill/Cuibt/State.dart';
import 'package:casheir_mobill/Cuibt/cuibt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreAProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MobilCuibt, MobilState>(
      listener: (context, state) {},
      builder: (context, state) {
        var Size = MediaQuery.of(context).size;
        var cuibt = MobilCuibt.get(context);
        return SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                if (cuibt.searchVisibleStore) visibilitySearch(cuibt),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: Size.height,
                  width: Size.width,
                  child: ListView.separated(
                      reverse: false,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => pressItem(
                            Size: Size,
                            NOF: "pepsi",
                            HMany: 30,
                            HM: 200,
                            context: context,
                            cuibt: cuibt,
                          ),
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 15,
                          ),
                      itemCount: 30),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget visibilitySearch(MobilCuibt cuibt) {
    return Align(
      alignment: Alignment.topCenter,
      child: MyTextField(
        Prefix: const Icon(
          Icons.search,
          size: 25,
          color: Colors.white,
        ),
        Controlr: cuibt.searchControllerStore,
        hint: "pepsi",
      ),
    );
  }

  Container showItems(
      {required Size Size,
      required String NOF,
      required double HM,
      required int HMany}) {
    return Container(
      margin: const EdgeInsetsDirectional.all(8.0),
      padding: const EdgeInsets.only(right: 10, left: 30),
      height: 80,
      width: Size.width,
      decoration: BoxDecoration(
          color: HMany >= 20
              ? Colors.grey[500]
              : HMany == 0
                  ? const Color(0xFFe63946)
                  : Colors.red[300],
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
                    fontSize: 21,
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$HMany Package",
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                "2023/12/30",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget pressItem(
      {required Size Size,
      required String NOF,
      required double HM,
      required int HMany,
      required context,
      required MobilCuibt cuibt}) {
    return GestureDetector(
        onTap: () => settingDialog(context, cuibt),
        child: showItems(Size: Size, NOF: NOF, HM: HM, HMany: HMany));
  }
}

settingDialog(context, MobilCuibt cuibt) {
  return showDialog(
    barrierDismissible: false,
      useRootNavigator: true,
      routeSettings: const RouteSettings(name: "setting",arguments:"Dialog"),
      context: context,
      builder: (context) {
        return BlurryContainer(
          borderRadius: BorderRadius.circular(35),
          height: double.maxFinite,
          width: double.maxFinite,
          blur: 6,
          child: AlertDialog(

              clipBehavior: Clip.antiAliasWithSaveLayer,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35)),
              title: const Text("Edit Item"),
              titleTextStyle: const TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.w900),
              backgroundColor: Colors.brown[600],
              elevation: 0,
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MyTextField(
                    label: "Name of Product",
                    Controlr: cuibt.nameItemController,
                    hint: "cola",
                  ),
                  const SizedBox(height: 15),
                  MyTextField(

                    label: "Price",
                      keybordtype: TextInputType.number,
                      Controlr: cuibt.costItemController, hint: "30 LE"),
                  const SizedBox(height: 15),
                  MyTextField(
                      Controlr: cuibt.numberItemController,
                      hint: "60",
                      keybordtype: TextInputType.number,
                      label: "Number of packages"),
                  const SizedBox(height: 15),
                  MyTextField(
                    keybordtype: TextInputType.none,
                    OnTap: () => showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      initialDatePickerMode: DatePickerMode.year,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2030),
                    ),
                      label: "Expire Date",
                      Controlr: cuibt.dateItemController, hint: "2023/8/5"),
                ],
              ),
          actionsAlignment: MainAxisAlignment.center,
          scrollable:true,

          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: MyButton(widget: const Text("Save"), onPressed: () {
                    Navigator.pop(context);
                  }),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: MyButton(widget: const Text("cancel"), onPressed: () {
                    Navigator.pop(context);
                  }),
                ),
              ],
            ),
          ],

          ),

        );
      });
}

/* 1-Show the item which almost finish
* 2-Show the item which finish
* 3-show all item with cost and number of package
* 4- edit the item about name and cost,number of package,End date
  */
