import 'package:casheir_mobill/Cuibt/State.dart';
import 'package:casheir_mobill/Cuibt/cuibt.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Suppliers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MobilCuibt, MobilState>(
      listener: (context, state) {},
      builder: (context, state) {
        var Size = MediaQuery.of(context).size;
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Size.height,
                width: Size.width,
                child: GridView.count(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                crossAxisCount: 2,
                  children: List.generate(
                      20,
                      (index) => _showSuppliers(
                          Size: Size,
                        name: "Pepsi",
                        firstDate: "20/10/20",
                        dateFess: "20/4/22",
                      fees: 500,
                        totalMoney: 3000

                      )),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Container _showSuppliers({
    required Size Size,
    required String name,
    required double totalMoney,
    required double fees,
    required String firstDate,
    required String dateFess,
  }) {
    return Container(
      margin: const EdgeInsetsDirectional.all(15),
      padding: const EdgeInsetsDirectional.all(15),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      width: Size.width * .5,
      height: Size.height * .2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white.withOpacity(.9),
        boxShadow: const [
          BoxShadow(
              color: Colors.black54,
              offset: Offset(0, 5),
              blurRadius: 6,
              spreadRadius: 2),
        ],
        border: Border.all(
          color: Colors.grey[900]!,
          width: 3,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(children: [
            Text(
              totalMoney.toString(),
              style:const TextStyle(fontSize: 20, fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis,),
            ),
            const Spacer(),
            Text("$fees LE",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700]!,
                  overflow: TextOverflow.ellipsis,)),
          ]),
          const Spacer(),
          Center(
            child: Text(name,
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic)),
          ),
          const Spacer(),
          Row(children: [
          Text(
            firstDate,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800,overflow: TextOverflow.ellipsis,),
          ),
          const Spacer(),
          Text(dateFess,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey[800]!,overflow: TextOverflow.ellipsis,)),
          ]),
      ],
      ),
    );
  }
}
