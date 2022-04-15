import 'package:casheir_mobill/Componads/Comoonads.dart';
import 'package:casheir_mobill/Componads/TextForm.dart';
import 'package:casheir_mobill/Cuibt/State.dart';
import 'package:casheir_mobill/Cuibt/cuibt.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class HomeLayout extends StatefulWidget {
  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MobilCuibt, MobilState>(
      listener: (context, state) {},
      builder: (context, state) {
        var size = MediaQuery.of(context).size;
        var cuibt = MobilCuibt.get(context);
        return Scaffold(
          key: cuibt.kayScaffold,
          extendBody: true,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              if (cuibt.value == 0)
                IconButton(
                  icon: Icon(
                    cuibt.searchVisibleBar
                        ? Icons.clear_outlined
                        : Icons.search,
                    color: Colors.white,
                    size: 28,
                    shadows: const [
                      Shadow(
                        color: Colors.black,
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  onPressed: () {
                    cuibt.changeSearchVisible();
                  },
                ),
            ],
            title: Shimmer.fromColors(
                baseColor: Colors.white60,
                highlightColor: Colors.black,
                child: Text(
                  cuibt.AppBar[cuibt.value],
                  style: const TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0),
                )),
            leading: cuibt.value == 0
                ? IconButton(
                    icon: const Icon(
                      Icons.filter_alt_outlined,
                      color: Colors.white,
                      size: 28,
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          blurRadius: 20,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    onPressed: () {
                      cuibt.kayScaffold.currentState
                          ?.showBottomSheet((context) => MyButtomSheet(size,cuibt));
                    },
                  )
                : null,
          ),
          body: Stack(children: [
            mainWallpaper(size),
            blurWallpaper(size),
            cuibt.Body[cuibt.value]
          ]),
          bottomNavigationBar: FlashyTabBar(
            showElevation: true,
            height: 65,
            iconSize: 28,
            animationDuration: const Duration(milliseconds: 500),
            animationCurve: Curves.easeInOut,
            backgroundColor: Colors.transparent,
            selectedIndex: cuibt.value,
            items: cuibt.barItem,
            onItemSelected: (int value) {
              setState(() {
                cuibt.value = value;
              });
            },
          ),
        );
      },
    );
  }

  Widget MyButtomSheet(Size Sise,MobilCuibt cuibt) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      clipBehavior: Clip.antiAlias,
      height: Sise.height * .5,
      width: Sise.width,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.94),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          //Title
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  const Text(
                    "Filters",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        "Close",
                        style: TextStyle(fontSize: 20, color: Colors.blue),
                      )),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          //Divider
          myDivider(Sise),
          const SizedBox(
            height: 10,
          ),
          Date(cuibt, Sise),
          const SizedBox(
            height: 15,
          ),
          myDivider(Sise),
          const SizedBox(
            height: 15,
          ),
//Second Row
         Padding(
         padding: const EdgeInsets.only(left: 10),
         child: Row(
           children: [
         InkWell(
           onTap: () {
             cuibt.changeActivedColor();
           },
           child: Container(
             color: !cuibt.activeColor?Colors.brown:Colors.grey,
             height: 45,
             width:120
           ),
         ),
         SizedBox(width: 20),
         InkWell(
           onTap: () {
             cuibt.changeActivedColor();
           },
           child: Container(
             color: cuibt.activeColor2?Colors.brown:Colors.grey,
             height: 45,
             width:120
           ),
         ),

    ],

  ),
)
        ],
      ),
    );
  }

  Padding Date(MobilCuibt cuibt, Size Sise) {
    return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                PressButton(cuibt,(){
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(DateTime.now().year-1),
                    lastDate: DateTime.now(),
                  ).then((value) {
                    setState(() {
                      value ??= DateTime.now();
                      cuibt.bottomSheetController.text =DateFormat.yMMMd().format(value!);

                    });
                  });
                },"Date"),
                const SizedBox(
                  width: 10,
                ),
                  Container(
                  padding: const EdgeInsets.only(left: 10),
                  height: 40,
                  width: Sise.width-120,
decoration: BoxDecoration(
border: Border.all(color: Colors.white60,width: 2),
color: Colors.grey[600],
borderRadius: BorderRadius.circular(25.0),
),
                  child: TextField(
                    enabled: false,
                    style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                    controller: cuibt.bottomSheetController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Date of Search",
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
  }

  InkWell PressButton(MobilCuibt cuibt,ontap,text, {color}) {
    return InkWell(
                onTap:ontap,
                child: Container(
                  alignment: Alignment.center,
                  height: 35,
                  width: 90,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white60,width: 2),
                    color: color??= Colors.grey[600],
borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(text,style: TextStyle(fontSize: 18,color: Colors.white),),
                ),
              );
  }
  InkWell activePressButton(MobilCuibt cuibt,ontap,text) {
    return InkWell(
                onTap:ontap,
                child: Container(
                  alignment: Alignment.center,
                  height: 35,
                  width: 90,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white60,width: 2),
                    color:cuibt.activeColor?Colors.brown[600]:Colors.grey[600],
borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(text,style: TextStyle(fontSize: 18,color: Colors.white),),
                ),
              );
  }

  Container myDivider(Size Sise) {
    return Container(
      height: 1,
      width: Sise.width,
      color: Colors.grey[800],
    );
  }
}
