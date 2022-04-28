import 'package:casheir_mobill/Componads/AppBar.dart';
import 'package:casheir_mobill/Cuibt/State.dart';
import 'package:casheir_mobill/Cuibt/cuibt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
class Empo extends StatefulWidget {

  @override
  State<Empo> createState() => _EmpoState();
}

class _EmpoState extends State<Empo> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MobilCuibt,MobilState>
      (
      listener: (context,state){},
      builder: (context,state){
        var cuibt =MobilCuibt.get(context);
        var size= MediaQuery.of(context).size;
        return Scaffold(
          key: cuibt.employeeScaffold,
          extendBodyBehindAppBar: true,
          appBar: myAppBar(text: "Details",Action: [],leading:IconButton(
            icon: const Icon(
              Icons.filter_alt_outlined,
              color: Colors.white,
              size: 28,
              shadows: [
                Shadow(
                  color: Colors.black,
                  blurRadius: 20,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            onPressed: () {
              cuibt.employeeScaffold.currentState?.showBottomSheet(
                      (context) => MyButtomSheet(size, cuibt));
            },
          ) ),
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/assest/Wallpaperbluer.jpg"),
                fit: BoxFit.fill,
              ),
            ),
            child: SafeArea(
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
            ),
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
         const  Text("Give rating to employee",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
          const SizedBox(height: 15,),
          RatingBar.builder(
            initialRating: 3,
            itemCount: 5,
            allowHalfRating: true,
            itemBuilder: (context, index) {
              switch (index) {
                case 0:
                  return const Icon(
                    Icons.sentiment_very_dissatisfied,
                    color: Colors.red,
                  );
                case 1:
                  return const Icon(
                    Icons.sentiment_dissatisfied,
                    color: Colors.redAccent,
                  );
                case 2:
                  return const Icon(
                    Icons.sentiment_neutral,
                    color: Colors.amber,
                  );
                case 3:
                  return const Icon(
                    Icons.sentiment_satisfied,
                    color: Colors.lightGreen,
                  );
                case 4:
                  return const Icon(
                    Icons.sentiment_very_satisfied,
                    color: Colors.green,
                  );
                default:
                  return const SizedBox.shrink();
              }
            },
            onRatingUpdate: (rating) {

            },
            itemPadding: const EdgeInsets.symmetric(horizontal: 5.0),
          ),
          const SizedBox(height: 50,),
          const  Text("Manger`s rating of employee",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
          const SizedBox(height: 15,),
          RatingBar.builder(
            ignoreGestures: true,
          initialRating: 3,
          itemCount: 5,
          allowHalfRating: true,
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return const Icon(
                  Icons.sentiment_very_dissatisfied,
                  color: Colors.red,
                );
              case 1:
                return const Icon(
                  Icons.sentiment_dissatisfied,
                  color: Colors.redAccent,
                );
              case 2:
                return const Icon(
                  Icons.sentiment_neutral,
                  color: Colors.amber,
                );
              case 3:
                return const Icon(
                  Icons.sentiment_satisfied,
                  color: Colors.lightGreen,
                );
              case 4:
                return const Icon(
                  Icons.sentiment_very_satisfied,
                  color: Colors.green,
                );
              default:
                return const SizedBox.shrink();
            }
          },
          onRatingUpdate: (rating) {

          },
itemPadding: const EdgeInsets.symmetric(horizontal: 5.0),
          )

        ],
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
  Widget MyButtomSheet(Size Sise, MobilCuibt cuibt) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      clipBehavior: Clip.antiAlias,
      height: Sise.height * .5,
      width: Sise.width,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.94),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,

        children: [
          //Title
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  const Text(
                    "Filters",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        "Close",
                        style: TextStyle(fontSize: 20, color: Colors.blue),
                      )),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          myDivider(Sise),
          const SizedBox(
            height: 25,
          ),
          Date(cuibt, Sise),
          const SizedBox(
            height: 25,
          ),
          myDivider(Sise),
          const SizedBox(
            height: 25,
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(

              children: [
                activePressButton(cuibt,(){
                  Navigator.pop(context);
                  setState(() {
                    cuibt.typeOrder="descending";
                  });
                },"descending", cuibt.typeOrder),
                const SizedBox(width:100),
                activePressButton(cuibt,(){
                  Navigator.pop(context);
                  setState(() {
                    cuibt.typeOrder="ascending";
                  });
                },"ascending", cuibt.typeOrder),
              ],
            ),
          ),
//descending and ascending
        ],
      ),
    );
  }
  InkWell activePressButton(MobilCuibt cuibt, ontap, text,type) {
    return InkWell(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        height: 35,
        width: 90,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white60, width: 2),
          color:type=="$text"?Colors.brown:Colors.grey[600],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 18, color: Colors.white,overflow: TextOverflow.fade,),
        ),
      ),
    );
  }
  Container myDivider(Size Sise) {
    return Container(
      height: 1,
      width: Sise.width,
      color: Colors.grey[900],
    );
  }
  Padding Date(MobilCuibt cuibt, Size Sise) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Row(
          children: [
            PressButton(cuibt, () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(DateTime.now().year - 1),
                lastDate: DateTime.now(),
              ).then((value) {
                setState(() {
                  value ??= DateTime.now();
                  cuibt.bottomSheetController.text =
                      DateFormat.yMMMd().format(value!);
                });
              });
            }, "Date"),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white60, width: 2),
                  color: Colors.grey[600],
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: TextField(
                  enabled: false,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  controller: cuibt.bottomSheetController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Date of Search",
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
           const  SizedBox(width: 10,),
            activePressButton(cuibt,(){},"All",false)

          ],
        ),
      ),
    );
  }
  InkWell PressButton(MobilCuibt cuibt, ontap, text) {
    return InkWell(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        height: 35,
        width: 90,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white60, width: 2),
          color: Colors.grey[600],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }

}
