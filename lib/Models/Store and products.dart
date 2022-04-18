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
        var Size= MediaQuery.of(context).size;
        var cuibt=MobilCuibt.get(context);
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                visibilitySearch(cuibt),
                SizedBox(
                  height: Size.height,
                  width: Size.width,
                  child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context,index)=>showItems(Size),
                      separatorBuilder: (context,index)=>const SizedBox(height:15,),
                      itemCount: 50),
                )
              ],
            ),
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
  Container showItems(Size Size) {
    return Container(
      padding: const EdgeInsets.only(right: 10, left: 30),
      height: 80,
      width: Size.width,
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(50.0),
          border: Border.all(color: Colors.grey[600]!, width: 4)),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Pepsi",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "100.00 LE",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[300]!,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Spacer(),
          const Text(
            "50 Package",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

}
