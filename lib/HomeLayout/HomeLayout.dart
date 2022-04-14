import 'package:casheir_mobill/Componads/Comoonads.dart';
import 'package:casheir_mobill/Cuibt/State.dart';
import 'package:casheir_mobill/Cuibt/cuibt.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayout extends StatefulWidget {
  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MobilCuibt,MobilState>
      (
     listener: (context,state){},
     builder: (context,state){
       var size=MediaQuery.of(context).size;
       var cuibt=MobilCuibt.get(context);
       return  Scaffold(
         extendBody: true,
         extendBodyBehindAppBar: true,
         appBar: cuibt.AppBar[cuibt.value],
         body: Stack(children: [
           mainWallpaper(size),
           blurWallpaper(size),
           cuibt.Body[cuibt.value]
         ]),
         bottomNavigationBar: FlashyTabBar(
showElevation: false,
             height: 70,
           iconSize: 28,
           animationDuration: const Duration(milliseconds: 500),
           animationCurve: Curves.easeInOut,
           backgroundColor: Colors.transparent,
           selectedIndex: cuibt.value,
           items: cuibt.barItem,
           onItemSelected: (int value) {
             setState(() {
               cuibt.value=value;
             });
           },
         ),
       );
     },
    );
  }
}
