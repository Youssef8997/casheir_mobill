import 'package:casheir_mobill/Componads/AppBar.dart';
import 'package:casheir_mobill/Componads/Comoonads.dart';
import 'package:casheir_mobill/Cuibt/State.dart';
import 'package:casheir_mobill/Cuibt/cuibt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllFess extends StatefulWidget {
  @override
  State<AllFess> createState() => _AllFessState();
}

class _AllFessState extends State<AllFess> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MobilCuibt,MobilState>
      (
      listener: (context, state) {},
        builder: (context, state) {
        var Size= MediaQuery.of(context).size;
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar:myAppBar(text: "All Fess", Action: []),
           body: Stack(
               children: [
                 mainWallpaper(Size),
                 blurWallpaper(Size),
                 Center(child: Text("All Fess"),)] ),
          );
        },

    );
  }
}
