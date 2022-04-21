import 'package:casheir_mobill/Componads/Comoonads.dart';
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
  void initState() {
    MobilCuibt.get(context).bottomSheetController.text =
        DateFormat.yMMMd().format(DateTime.now());
    super.initState();
  }
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
              if (cuibt.value ==1)
                IconButton(

                  icon: Icon(
                    cuibt.searchVisibleStore
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
                )
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
            leading: cuibt.value == 0||cuibt.value == 1
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
                      cuibt.kayScaffold.currentState?.showBottomSheet(
                          (context) => MyButtomSheet(size, cuibt));
                    },
                  )
                : null,
          ),
          body: PageView(
            controller: cuibt.scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            allowImplicitScrolling: true,
            onPageChanged: (index){setState(() {
              cuibt.value = index;
            });},
            scrollBehavior: const ScrollBehavior(),
            children: [
              Stack(children: [
                mainWallpaper(size),
                blurWallpaper(size),
                cuibt.Body[0]
              ]),
              Stack(children: [
                mainWallpaper(size),
                blurWallpaper(size),
                cuibt.Body[1]
              ]),
              Stack(children: [
                mainWallpaper(size),
                blurWallpaper(size),
                cuibt.Body[2]
              ]),
              Stack(children: [
                mainWallpaper(size),
                blurWallpaper(size),
                cuibt.Body[3]
              ]),
              Stack(children: [
                mainWallpaper(size),
                blurWallpaper(size),
                cuibt.Body[4]
              ]),

            ],

          ),
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
                cuibt.scrollController.animateToPage(cuibt.value, duration: const Duration(seconds: 1), curve: Curves.easeOutCubic);
              });
            },
          ),
        );
      },
    );
  }

  Widget MyButtomSheet(Size Sise, MobilCuibt cuibt) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
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
            padding: const EdgeInsets.all(8.0),
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
            height: 20,
          ),
          myDivider(Sise),
          const SizedBox(
            height: 25,
          ),
          Date(cuibt, Sise),
          const SizedBox(
            height: 25,
          ),
          myDivider(Sise),
          const SizedBox(
            height: 25,
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(

              children: [
                activePressButton(cuibt,(){
                  Navigator.pop(context);
                  setState(() {
                    cuibt.typeOrder="descending";
                  });
                },"descending", cuibt.typeOrder),
                const SizedBox(width:100),
                activePressButton(cuibt,(){
                  Navigator.pop(context);
                  setState(() {
                    cuibt.typeOrder="ascending";
                  });
                },"ascending", cuibt.typeOrder),
              ],
            ),
          ),
//descending and ascending
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
            PressButton(cuibt, () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(DateTime.now().year - 1),
                lastDate: DateTime.now(),
              ).then((value) {
                setState(() {
                  value ??= DateTime.now();
                  cuibt.bottomSheetController.text =
                      DateFormat.yMMMd().format(value!);
                });
              });
            }, "Date"),
            const SizedBox(
              width: 10,
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              height: 40,
              width: Sise.width - 120,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white60, width: 2),
                color: Colors.grey[600],
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: TextField(
                enabled: false,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
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

  InkWell PressButton(MobilCuibt cuibt, ontap, text) {
    return InkWell(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        height: 35,
        width: 90,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white60, width: 2),
          color: Colors.grey[600],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
  InkWell activePressButton(MobilCuibt cuibt, ontap, text,type) {
    return InkWell(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        height: 35,
        width: 90,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white60, width: 2),
          color:type=="$text"?Colors.brown:Colors.grey[600],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 18, color: Colors.white,overflow: TextOverflow.fade,),
        ),
      ),
    );
  }
  Container myDivider(Size Sise) {
    return Container(
      height: 1,
      width: Sise.width,
      color: Colors.grey[900],
    );
  }
}
