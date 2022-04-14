import 'package:casheir_mobill/Componads/Comoonads.dart';
import 'package:casheir_mobill/Componads/TextForm.dart';
import 'package:casheir_mobill/Cuibt/State.dart';
import 'package:casheir_mobill/Cuibt/cuibt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Componads/mybutton.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MobilCuibt, MobilState>(
        listener: (context, state) {},
        builder: (context, state) {
          var Size = MediaQuery.of(context).size;
          var cubit = MobilCuibt.get(context);
          return Scaffold(
              body: Scaffold(
            body: Stack(
              children: [
                mainWallpaper(Size),
                blurWallpaper(Size),
                Positioned(
                  top: 50,
                  left: 10,
                  child: Text(
                    " Hey! ",
                    style: TextStyle(
                      fontSize: Size.height * 0.05,
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 3,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  top: 100,
                  left: 15,
                  child: Text(
                    "Create new account \n to manage your business! ",
                    style: TextStyle(
                      fontSize: Size.height * 0.02,
                      color: Colors.grey[600]!,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyTextField(
                        Controlr: cubit.nameController,
                        hint: "Youssef Ahmed",
                        label: "Full Name",
                        Prefix: const Icon(
                          Icons.person,
                          color: Colors.black,
                          shadows: [
                            Shadow(
                                color: Colors.black45,
                                offset: Offset(1, 5),
                                blurRadius: 6)
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      MyTextField(
                         keybordtype: TextInputType.emailAddress,
                        Controlr: cubit.emailController,
                        hint: "Email123@gamil.com",
                        label: "Email Address",
                        Prefix: const Icon(
                          Icons.email,
                          color: Colors.black,
                          shadows: [
                            Shadow(
                                color: Colors.black45,
                                offset: Offset(1, 5),
                                blurRadius: 6)
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      MyTextField(
                          isobsr: cubit.signUpObscuring,
                          Controlr: cubit.passwordController,
                          hint: "***********",
                          label: "Password",
                          Prefix: const Icon(
                            Icons.password,
                            color: Colors.black,
                            shadows: [
                              Shadow(
                                color: Colors.black45,
                                offset: Offset(1, 10),
                                blurRadius: 6,
                              )
                            ],
                          ),
                          suffix: InkWell(
                            onTap: () => cubit.changeSignUpObsr(),
                            child: cubit.signUpObscuring
                                ? const Icon(Icons.visibility,
                                    size: 30, color: Colors.black)
                                : const Icon(Icons.visibility_off,
                                    size: 30, color: Colors.black),
                          )),
                      const SizedBox(height: 15),
                      MyTextField(
                        Controlr: cubit.signUpPassword2,
                        hint: "***********",
                        label: "Confirm Password",
                        Prefix: const Icon(
                          Icons.password,
                          color: Colors.black,
                          shadows: [
                            Shadow(
                              color: Colors.black45,
                              offset: Offset(1, 10),
                              blurRadius: 6,
                            )
                          ],
                        ),
                        isobsr: cubit.signUpObscuring,
                      ),
                      const SizedBox(height: 15),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          border: Border.all(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        ),
                        child: Row(
                          children: [
                           const  Padding(
                              padding:  EdgeInsets.only(left: 15),
                              child: Icon(Icons.manage_accounts_outlined,
                                  color: Colors.black, size: 30),
                            ),
                            DropdownButtonHideUnderline(

                              child:DropdownButton(
                                iconSize: 0,
                                hint:const  Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Text(
                                      "   What is your position?",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ),
                                icon: null,
                                isDense: true,
                                focusColor: Colors.grey[500],
                                style: const TextStyle(color: Colors.white),
                                dropdownColor: Colors.grey[700],
                                alignment: AlignmentDirectional.center,
                                items: const [
                                  DropdownMenuItem(
                                    value: "owner",
                                    child: Text("  Owner"),
                                  ),
                                  DropdownMenuItem(
                                    value: "id",
                                    child: Text(
                                      "  Manger",
                                    ),
                                  ),
                                ],
                                onChanged: (Object? value) =>
                                    cubit.changePostion(value),
                                value: cubit.positionValue,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      MyButton(
                          widget: const Text("Sign Up",
                              style: TextStyle(fontWeight: FontWeight.w900)),
                          onPressed: () {}),
                      const SizedBox(height: 20),
                      TextButton(onPressed: ()=>Navigator.pop(context), child: Text("Already have an account?",style: TextStyle(
                        fontSize: Size.height * 0.027,
                        color: Colors.grey[900]!,
                        fontWeight: FontWeight.bold,
                      ),),),
                    ],
                  ),
                )
              ],
            ),
          ));
        });
  }
}
