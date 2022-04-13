import 'package:casheir_mobill/Componads/Comoonads.dart';
import 'package:casheir_mobill/Componads/TextForm.dart';
import 'package:casheir_mobill/Cuibt/State.dart';
import 'package:casheir_mobill/Cuibt/cuibt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MobilCuibt, MobilState>(
        listener: (context, state) {},
        builder: (context, state) {
          var Size = MediaQuery.of(context).size;
          var cuibt = MobilCuibt.get(context);
          return Scaffold(
              body: Scaffold(
                backgroundColor: Colors.black,
            body: SafeArea(
              child: Stack(

                children: [
                  Positioned(
                    top: 30,
                    left: 10,
                    child: Text(
                      "Welcome",
                      style: TextStyle(
                        fontSize: Size.height * 0.05,
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: Size.height * 0.17,
                      ),
                      Container(
                        height: Size.height * 0.3,
                        width: Size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              filterQuality: FilterQuality.high,
                              colorFilter: ColorFilter.mode(Colors.black45, BlendMode.multiply),
                              image: AssetImage(
                                  "lib/assest/undraw_Services_re_hu5n.png"),
                            )),
                      ),
                      const SizedBox(height: 15,),
                      Text (
                        "Hello!",
                        style: TextStyle(
                            fontSize: Size.height * 0.05,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 15,),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Text("Welcome to the app of the cashier mobile app ,we here to help you to achieve your goal and make your bessness more easy and professional",
                            style: TextStyle(
                                fontSize: Size.height * 0.026,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[500])),
                      ),
                      const SizedBox(height: 15,),
                      Container(
                        alignment: Alignment.center,
                        width: 120,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey[600],
                          borderRadius: BorderRadius.circular(20),

                        ),
                        child: Text("Get stared",style: TextStyle(
                          fontSize: Size.height * 0.027,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),),
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ));
        });
  }
}
