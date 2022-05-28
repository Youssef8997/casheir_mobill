import 'package:casheir_mobill/Componads/Comoonads.dart';
import 'package:casheir_mobill/Componads/TextForm.dart';
import 'package:casheir_mobill/Componads/mybutton.dart';
import 'package:casheir_mobill/Cuibt/State.dart';
import 'package:casheir_mobill/Cuibt/cuibt.dart';
import 'package:casheir_mobill/sign/SignUp.dart';
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
              wallpaper(Size),
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
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: Size.height * 0.2,
                    ),
                    MyTextField(
                      Controlr: cuibt.emailAddressController,
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
                      Controlr: cuibt.passwordController,
                      hint: "***********",
                      label: "Password",
                      suffix: InkWell(
                        onTap: () => cuibt.changeSignInObsr(),
                        child: cuibt.obscuring
                            ? const Icon(Icons.visibility,
                            size: 30, color: Colors.black)
                            : const Icon(Icons.visibility_off,
                            size: 30, color: Colors.black),
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
                      isobsr: cuibt.obscuring,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    MyButton(widget: Text("Sign in",style: TextStyle(
                      fontSize: Size.height * 0.027,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),),onPressed: ()=>cuibt.signIn(context),),
                    const SizedBox(height: 10,),
                    TextButton(onPressed: (){}, child:Text("Forgot Password?",style: TextStyle(
                      fontSize: Size.height * 0.027,
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                    ),),),
                    TextButton(onPressed: (){nevigator(page:SignUp(),context: context,bool: true );}, child:Text("don't have Email?",style: TextStyle(
                      fontSize: Size.height * 0.03,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                    ),),),
                  ],
                ),
              ),
            ]),
          );
        });
  }
}
