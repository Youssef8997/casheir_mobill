import 'package:casheir_mobill/Componads/Comoonads.dart';
import 'package:casheir_mobill/Componads/TextForm.dart';
import 'package:casheir_mobill/Cuibt/State.dart';
import 'package:casheir_mobill/Cuibt/cuibt.dart';
import 'package:casheir_mobill/sign/First.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MobilCuibt, MobilState>(
        listener: (context, state) {},
        builder: (context, state) {
          var Size = MediaQuery.of(context).size;
          var cuibt = MobilCuibt.get(context);
          return Scaffold(
            body: Stack(fit: StackFit.expand, children: [
              sssWallpaper(Size),
              Positioned(
                top: 80,
                left: 20,
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
              Positioned(
                top: 130,
                left: 20,
                child: Text(
                  "Sign in to continue",
                  style: TextStyle(
                    fontSize: Size.height * 0.04,
                    color: Colors.grey[700],
                    fontStyle: FontStyle.italic,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: Size.height * 0.2,
                  ),
                  MyTextField(
                    Controlr: cuibt.EmailAdreessController,
                    hint: "Email123@gmail.com",
                    label: "Email Address",
                    Prefix: const Icon(
                      Icons.email,
                      color: Colors.black,
                      size: 27,
                      shadows: [
                        Shadow(
                          color: Colors.black38,
                          blurRadius: 20,
                          offset: Offset(0, 5),
                        )
                      ],
                    ),
                    keybordtype: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyTextField(
                    Controlr: cuibt.PasswordController,
                    hint: "***********",
                    label: "Password",
                    suffix: InkWell(
                      onTap: () => cuibt.ChangeObsr(),
                      child: const Icon(
                        Icons.visibility_off_outlined,
                        color: Colors.black,
                        size: 30.0,
                        shadows: [
                          Shadow(
                            color: Colors.black38,
                            blurRadius: 20,
                            offset: Offset(0, 5),
                          )
                        ],
                      ),
                    ),
                    Prefix: const Icon(Icons.password,
                        color: Colors.black,
                        size: 27,
                        shadows: [
                          Shadow(
                            color: Colors.black38,
                            blurRadius: 20,
                            offset: Offset(0, 5),
                          )
                        ]),
                    keybordtype: TextInputType.visiblePassword,
                    isobsr: cuibt.obsr,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 120,
                    height: 40,
                    decoration: BoxDecoration(
                       color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(20),

                    ),
                    child: Text("Sign in",style: TextStyle(
                      fontSize: Size.height * 0.027,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),),
                  ),
                  const SizedBox(height: 10,),
                  TextButton(onPressed: (){}, child:Text("Forgot Password?",style: TextStyle(
                    fontSize: Size.height * 0.027,
                    color: Colors.grey[900],
                    fontWeight: FontWeight.bold,
                  ),),),
                  TextButton(onPressed: (){Nevigator(page:SignUp(),context: context,bool: true );}, child:Text("don't have Email?",style: TextStyle(
                    fontSize: Size.height * 0.03,
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                  ),),),
                ],
              ),
            ]),
          );
        });
  }
}
