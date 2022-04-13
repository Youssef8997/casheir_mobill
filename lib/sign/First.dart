import 'package:casheir_mobill/Componads/Comoonads.dart';
import 'package:casheir_mobill/Componads/TextForm.dart';
import 'package:casheir_mobill/Cuibt/State.dart';
import 'package:casheir_mobill/Cuibt/cuibt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MobilCuibt, MobilState>(
        listener: (context, state) {},
        builder: (context, state) {
          var Size = MediaQuery.of(context).size;
          var cuibt = MobilCuibt.get(context);
          return Scaffold(
              body: Scaffold(
            body: Stack(
              children: [
                Wallpaper(Size),
                MainWallpaper(Size),
              ],
            ),
          ));
        });
  }
}
