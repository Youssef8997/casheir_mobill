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
       var cuibt=MobilCuibt.get(context);
       return  Scaffold(
         extendBodyBehindAppBar: true,
         appBar: cuibt.AppBar[cuibt.value],
         body: cuibt.Body[cuibt.value],
         bottomNavigationBar: FlashyTabBar(
           iconSize: 25,
           showElevation: true,
           animationDuration: const Duration(milliseconds: 500),
           animationCurve: Curves.easeInOut,
           backgroundColor: Colors.grey[500]!,
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
