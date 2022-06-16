import 'package:casheir_mobill/Cuibt/State.dart';
import 'package:casheir_mobill/Cuibt/cuibt.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeLayout extends StatefulWidget {
  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}


class _HomeLayoutState extends State<HomeLayout> {
  @override
  void initState() {
    MobilCuibt.get(context).getBranchName();
    MobilCuibt.get(context).getUserDate();
    MobilCuibt.get(context).getMoneyDate();
    MobilCuibt.get(context).getOrdersItem();
    MobilCuibt.get(context).getProductData();
    MobilCuibt.get(context).getSuppliers();
    MobilCuibt.get(context).getEmployeeData();
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

          ),
          body: Container(
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assest/Wallpaperbluer.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: PageView(
              controller: cuibt.scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              allowImplicitScrolling: true,
              onPageChanged: (index){setState(() {
                cuibt.value = index;
              });},
              children: [
                cuibt.body[0],
                cuibt.body[1],
                cuibt.body[2],
                cuibt.body[3],
                cuibt.body[4],
              ],

            ),
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


}
