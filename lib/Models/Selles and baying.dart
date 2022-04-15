import 'package:casheir_mobill/Componads/TextForm.dart';
import 'package:casheir_mobill/Cuibt/State.dart';
import 'package:casheir_mobill/Cuibt/cuibt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SellesABuying extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MobilCuibt, MobilState>(
      listener: (context, state) {},
      builder: (context, state) {
        var Size = MediaQuery.of(context).size;
        var cuibt = MobilCuibt.get(context);
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  visibilitySearch(cuibt),
                  SizedBox(
                    height: Size.height * 0.01,
                  ),
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
        visible: cuibt.searchVisibleBar,
        child: Align(
          alignment: Alignment.topCenter,
          child: MyTextField(
            Controlr: cuibt.searchController,
            hint: "pepsi",
          ),
        ));
  }

  Container showItems(Size Size) {
    return Container(
      padding: const EdgeInsets.only(right: 10),
      height: 80,
      width: Size.width,
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(50.0),

          border: Border.all(color: Colors.grey[600]!, width: 4)),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.transparent,
            radius: 45,
            backgroundImage:  NetworkImage(
                "https://cdn.mosoah.com/wp-content/uploads/2019/10/24120124/pepsico.png"),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Pepsi",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "100.00 LE",
                style:  TextStyle(
                    fontSize: 18,
                    color: Colors.white,
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
//Show what they baying and selling
//show most sold and most bought
//show the little sold and bought
