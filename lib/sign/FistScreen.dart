import 'package:casheir_mobill/Componads/Comoonads.dart';
import 'package:casheir_mobill/Cuibt/State.dart';
import 'package:casheir_mobill/Cuibt/cuibt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MobilCuibt,MobilState>
      (
      listener: (context,state){},
        builder: (context,state){
        var Size = MediaQuery.of(context).size;
        return Scaffold(
          body: Stack(
            alignment: Alignment.center,
            children: [
              Wallpaper(Size),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
const CircleAvatar(
  backgroundImage: AssetImage('lib/assest/cryptocurrency-2(3).png'),
  radius: 80,
),
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Text("Lets go",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
        }

    );
  }
}
