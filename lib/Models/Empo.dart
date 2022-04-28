import 'package:casheir_mobill/Cuibt/State.dart';
import 'package:casheir_mobill/Cuibt/cuibt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
  if(cuibt.selectedTile==1)
  timeColumn(),
  if(cuibt.selectedTile==2)
    ratingColumn(),
  if(cuibt.selectedTile==3)
    moneyColumn(),
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
            title: const Text('money',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            subtitle: const Text('Salary of employees ',style: TextStyle(fontSize: 17,),),
            trailing: cuibt.selectedTile==3?const Icon(Icons.arrow_downward_outlined):null,
          ),

        ],
      ),
    );
  }
  Widget timeColumn(){
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [

        ],
      ),
    );
  }
  Widget ratingColumn(){
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [

        RatingBar.builder(
        initialRating: 4,
        itemCount: 5,
        allowHalfRating: true,
        itemBuilder: (context, index) {
          switch (index) {
            case 0:
              return Icon(
                Icons.sentiment_very_dissatisfied,
                color: Colors.red,
              );
            case 1:
              return Icon(
                Icons.sentiment_dissatisfied,
                color: Colors.redAccent,
              );
            case 2:
              return Icon(
                Icons.sentiment_neutral,
                color: Colors.amber,
              );
            case 3:
              return Icon(
                Icons.sentiment_satisfied,
                color: Colors.lightGreen,
              );
            case 4:
              return Icon(
                Icons.sentiment_very_satisfied,
                color: Colors.green,
              );
            default:
              return SizedBox.shrink();
          }
        },
        onRatingUpdate: (rating) {

        },
itemPadding: const EdgeInsets.symmetric(horizontal: 5.0),
        )],
      ),
    );
  }
  Widget moneyColumn(){
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [

        ],
      ),
    );
  }
}
