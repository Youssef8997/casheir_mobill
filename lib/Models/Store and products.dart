import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:casheir_mobill/Componads/TextForm.dart';
import 'package:casheir_mobill/Componads/mybutton.dart';
import 'package:casheir_mobill/Cuibt/State.dart';
import 'package:casheir_mobill/Cuibt/cuibt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

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
                      itemBuilder: (context, i) => pressItem(
                            Size: Size,
                            NOF: cuibt.productData[i].name!,
                            HMany: cuibt.productData[i].quantityInShop!,
                            HM: cuibt.productData[i].price!,
                            context: context,
                            cuibt: cuibt,
                            endDate: cuibt.productData[i].endDate!,
                            quantityInShop:
                                cuibt.productData[i].quantityInShop!,
                            code: cuibt.productData[i].code!,
                            startDate: cuibt.productData[i].startDate!,
                        quantityInStore: cuibt.productData[i].quantityInStore!,
                          ),
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 15,
                          ),
                      itemCount: cuibt.productData.length),
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
      required int HMany,
      required String endDate}) {
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
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Name of product
              Expanded(
                child: SizedBox(
                  width: Size.width * 0.5,
                  height: 40,
                  child: Text(
                    NOF,
                    style: const TextStyle(
                        fontSize: 21,
                        color: Colors.black,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ),
              const Spacer(),
              Expanded(
                child: Text(
                  maxLines: 1,
                  "$HMany Pack",
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  "$HM LE",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[800]!,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Spacer(),
              Expanded(
                child: Text(
                  maxLines: 1,
                  endDate,
                  style: const TextStyle(
                      fontSize: 19,
                      color: Colors.black,
                      fontWeight: FontWeight.bold

                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget pressItem({
    required Size Size,
    required String NOF,
    required double HM,
    required int HMany,
    required context,
    required MobilCuibt cuibt,
    required endDate,
    required startDate,
    required code,
    required quantityInShop,
    required quantityInStore,
  }) {
    return GestureDetector(
        onTap: () {
cuibt.fullController(name: NOF, price: HM ,quantity: quantityInShop,expireDate:endDate);
          settingDialog(
            context,
            cuibt,
            startDate: startDate,
            expireDate: endDate,
            code: code,
            name: NOF,
            price: HM,
            quantity: HMany,
            quantityInShop: quantityInShop,
            quantityInStore: quantityInStore
          );
        },
        child: showItems(
            Size: Size, NOF: NOF, HM: HM, HMany: HMany, endDate: endDate));
  }

  settingDialog(
    context,
    MobilCuibt cuibt, {
    required name,
    required price,
    required quantity,
    required expireDate,
    required quantityInShop,
    required quantityInStore,
    required code,
    required startDate,
  }) {
    return showDialog(
        barrierDismissible: true,
        useRootNavigator: true,
        routeSettings:
            const RouteSettings(name: "setting", arguments: "Dialog"),
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
                  color: Colors.white,
                  fontWeight: FontWeight.w900),
              backgroundColor: Colors.brown[600],
              elevation: 0,
              content: Column(
                mainAxisSize: MainAxisSize.max,
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
                      Controlr: cuibt.priceItemController,
                      hint: "30 LE"),
                  const SizedBox(height: 15),
                  MyTextField(
                      Controlr: cuibt.quantityItemController,
                      hint: "60",
                      keybordtype: TextInputType.number,
                      label: " quantity of packages"),
                  const SizedBox(height: 15),
                  MyTextField(
                      keybordtype: TextInputType.none,
                      OnTap: () => showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            initialDatePickerMode: DatePickerMode.year,
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2030),
                          ).then((value) {
                            if(value == null){
                              cuibt.expireDateItemController.text =
                                  DateFormat.yMMMd().format(DateTime.now()) ;}
                            cuibt.expireDateItemController.text =DateFormat.yMMMd().format(value!);
                          }),

                      label: "Expire Date",
                      Controlr: cuibt.expireDateItemController,
                      hint: "2023/8/5"),
                ],
              ),
              actionsAlignment: MainAxisAlignment.center,
              scrollable: true,
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: MyButton(
                          widget: const Text("Save",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 22)),
                          onPressed: () {
                            cuibt.updateProduct(
                                name: cuibt.nameItemController.text,
                                price:  cuibt.priceItemController.text,
                                quantity: cuibt.quantityItemController.text,
                                expireDate: cuibt.expireDateItemController.text,
                                quantityInShop: quantityInShop,
                                code: code,
                                startDate: startDate,
                            quantityInStore: quantityInStore
                            );
                            cuibt.getProductData();
                            Navigator.pop(context);
                          }),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: MyButton(
                          widget: const Text("cancel",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 22)),
                          onPressed: () {
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
}

/* 1-Show the item which almost finish
* 2-Show the item which finish
* 3-show all item with cost and number of package
* 4- edit the item about name and cost,number of package,End date
  */
