import 'package:casheir_mobill/Componads/Comoonads.dart';
import 'package:casheir_mobill/Cuibt/State.dart';
import 'package:casheir_mobill/Cuibt/cuibt.dart';
import 'package:casheir_mobill/Models/suppliers/All%20Fess.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Suppliers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MobilCuibt, MobilState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cuibt=MobilCuibt.get(context);
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
                  childAspectRatio: .98,
                  children: List.generate(
                      cuibt.suppliers.length,
                      (i) => _showSuppliers(
                          Size: Size,
                          name: cuibt.suppliers[i].name!,
                          firstDate:"",
                          dateFess: cuibt.suppliers[i].feesDate!,
                          fees: cuibt.suppliers[i].LastPaid!,
                          totalMoney: cuibt.suppliers[i].TotalSuppliers!,
                      context: context,
                        cuibt: cuibt,
                        i: i
                      )),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  InkWell _showSuppliers({
    required Size Size,
    required String name,
    required double totalMoney,
    required double fees,
    required String firstDate,
    required String dateFess,
    required int i,
    required BuildContext context,
    required MobilCuibt cuibt
  }) {
    return InkWell(
      onTap: () {
        cuibt.getFessData(name: name);
        nevigator(bool: true, page: AllFess(index:i,), context: context);

      },
      child: Container(
        margin: const EdgeInsetsDirectional.all(15),
        padding: const EdgeInsetsDirectional.all(15),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        width: Size.width * .5,
        height: Size.height * .2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
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
              Expanded(
                child: Text(
                  totalMoney.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 3,),
              Expanded(
                child: Text(
                  "$fees LE",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700]!,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                ),
              ),
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
              Expanded(
                child: Text(
                  firstDate,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              const SizedBox(width: 3,),
              Expanded(
                child: Text(dateFess,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700]!,
                      overflow: TextOverflow.ellipsis,
                    )),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
