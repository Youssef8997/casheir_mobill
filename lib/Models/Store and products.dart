import 'package:casheir_mobill/Componads/TextForm.dart';
import 'package:casheir_mobill/Cuibt/State.dart';
import 'package:casheir_mobill/Cuibt/cuibt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreAProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MobilCuibt,MobilState>
      (
      listener: (context,state){},
      builder: (context,state){
        var cuibt=MobilCuibt.get(context);
        return SafeArea(
          child: Column(
            children: [
              visibilitySearch(cuibt),
            ],
          ),
        );
      },

    );
  }
  Visibility visibilitySearch(MobilCuibt cuibt) {
    return Visibility(
        replacement: const SizedBox(height: 0,width: 0,),
        maintainSize: true,
        maintainState: true,
        maintainAnimation: true,
        visible:cuibt.searchVisibleStore,
        child: Align(
          alignment: Alignment.topCenter,
          child: MyTextField(
            Controlr: cuibt.searchControllerStore,
            hint: "pepsi",
          ),
        ));
  }

}
