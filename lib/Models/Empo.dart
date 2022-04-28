import 'package:casheir_mobill/Cuibt/State.dart';
import 'package:casheir_mobill/Cuibt/cuibt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Employees extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MobilCuibt,MobilState>
      (
      listener: (context,state){},
      builder: (context,state){
        var cuibt =MobilCuibt.get(context);
        return SafeArea(
          child: Column(
children: [
  listTileWidget(cuibt),

  ],
          ),
        );
      },

    );
  }
  Widget listTileWidget(MobilCuibt cuibt) {
    return ListTileTheme(
      iconColor: Colors.white,
      textColor: Colors.white,
      enableFeedback: true,
      selectedTileColor: Colors.teal,
      selectedColor: Colors.blue[200],
      child: Column(
        children:  [
          ListTile(
            onTap: ()=>cuibt.changeSelectedTile(1),
            selected: cuibt.selectedTile==1,
            leading: const Icon(Icons.access_time_outlined),
            title: const Text('Time',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            subtitle: const Text('Attendance, Leave, Overtime',style: TextStyle(fontSize: 17,),),
            trailing: cuibt.selectedTile==1?const Icon(Icons.arrow_downward_outlined):null,
          ),
          ListTile(
            onTap: ()=>cuibt.changeSelectedTile(2),
            selected: cuibt.selectedTile==2,
            leading: const Icon(Icons.star,color: Colors.yellow,),
            title: const Text('Rating',style:  TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            subtitle: const Text('Rate employee ',style: TextStyle(fontSize: 17,),),
            trailing: cuibt.selectedTile==2?const Icon(Icons.arrow_downward_outlined):null,
          ),
          ListTile(
            onTap: ()=>cuibt.changeSelectedTile(3),
            selected: cuibt.selectedTile==3,
            leading: const Icon(Icons.monetization_on,color: Colors.greenAccent,),
            title: const Text('Time',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            subtitle: const Text('Attendance, Leave, Overtime',style: TextStyle(fontSize: 17,),),
            trailing: cuibt.selectedTile==3?const Icon(Icons.arrow_downward_outlined):null,
          ),

        ],
      ),
    );
  }
}
