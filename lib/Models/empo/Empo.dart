import 'package:casheir_mobill/Models/empo/showDetiles.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:casheir_mobill/Componads/Comoonads.dart';
import 'package:casheir_mobill/Cuibt/State.dart';
import 'package:casheir_mobill/Cuibt/cuibt.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Employees extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MobilCuibt, MobilState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cuibt=MobilCuibt.get(context);
        var empo=cuibt.employee;
        var Size = MediaQuery.of(context).size;
        return SingleChildScrollView(
          child:
           Column(
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
                        empo.length,
                            (i) => _showEmployee(
                            Size: Size,
                            name: empo[i].name!,
                            startWork: empo[i].AttendanceDate!,
                            endWork: empo[i].LeavingDate!,
                                salary: empo[i].Salary!,
                            jobTitle: "Cashier",
                            context: context,
                              cuibt: cuibt,
                              id: empo[i].id!,
                              index: i
                        )),
                  ),
                )
              ],
            ),
        );
      },
    );
  }

  InkWell _showEmployee({
    required Size Size,
    required String name,
    required String jobTitle,
    required double salary,
    required String startWork,
    required String endWork,
    required BuildContext context,
    required MobilCuibt cuibt,
    required int id,
    required index

  }) {
    return InkWell(
      onTap: () {
        nevigator(bool: true, page: Empo(index:index), context: context);
        cuibt.getAttendance(id:id );
        cuibt.getRate(id:id );
        cuibt.getMoneyData(id:id );
      },
      child: Container(
        margin: const EdgeInsetsDirectional.all(15),
        padding: const EdgeInsetsDirectional.all(15),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        width: Size.width * .5,
        height: Size.height * .2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.blueGrey[400],
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(children: [
              Expanded(
                child: Text(
                  jobTitle,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 3,),
              Expanded(
                child: Text(
                  "$salary LE",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[900]!,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                ),
              ),
            ]),
            const Spacer(),
            Text(
              textAlign: TextAlign.center,
                name,
                style: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                  color: Colors.white,

                ),

            ),
            const Spacer(),

            Row(children: [
              Expanded(
                child: Text(
                  startWork,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    overflow: TextOverflow.ellipsis,
                    color: Colors.white,

                  ),
                ),
              ),
              const SizedBox(width: 3,),
              Expanded(
                child: Text(endWork,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[900]!,
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

