import 'package:casheir_mobill/Componads/AppBar.dart';
import 'package:casheir_mobill/Cuibt/State.dart';
import 'package:casheir_mobill/Models/Selles%20and%20baying.dart';
import 'package:casheir_mobill/Models/Store%20and%20products.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Models/Empo.dart';
import '../Models/Suppliers.dart';
import '../Models/Users.dart';

class MobilCuibt extends Cubit<MobilState> {
  MobilCuibt() : super(initState());
  static MobilCuibt get(context) => BlocProvider.of(context);
  //SignIN
  var emailAdreessController = TextEditingController();
  var passwordController = TextEditingController();
  bool obscuring=true;
  //SignUp
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var signUpPassword = TextEditingController();
  var signUpPassword2 = TextEditingController();
  var phoneController = TextEditingController();
  String? positionValue ;
  bool signUpObscuring=true;

// UI
  var value=0;
List<Widget>Body=[
  SellesABuying(),
  StoreAProducts(),
  Suppliers(),
  Users(),
  Employees(),
  ];
List <PreferredSizeWidget>AppBar=[
  appBar(text: "Selles ", Action: []),
  appBar(text: "Store ", Action: []),
  appBar(text: "Suppliers ", Action: []),
  appBar(text: "Users activity ", Action: []),
  appBar(text: "Employees ", Action: []),
];
List<FlashyTabBarItem>barItem=[
  FlashyTabBarItem(title: const Text("Sells"), icon: const Icon(Icons.shopping_cart),inactiveColor: Colors.grey,activeColor: Colors.blue[900]!),
  FlashyTabBarItem(title: const Text("Store"), icon: const Icon(Icons.store),inactiveColor: Colors.white,activeColor: Colors.lightBlue[700]!,),
  FlashyTabBarItem(title: const Text("Suppliers"), icon: const Icon(Icons.attribution_outlined,),inactiveColor:Colors.white,activeColor: Colors.lightBlue[500]! ),
  FlashyTabBarItem(title: const Text("activity"), icon: const Icon(Icons.supervisor_account_outlined,),inactiveColor:Colors.white,activeColor: Colors.blue[400]! ),
  FlashyTabBarItem(title: const Text("Employees"), icon: const Icon(Icons.group_outlined,),inactiveColor: Colors.white,activeColor: Colors.blueGrey ),
];
  //Methods
void changeSignInObsr(){
  obscuring=!obscuring;
  emit(changeObsr());
}
void changeSignUpObsr(){
  signUpObscuring=!signUpObscuring;
  emit(changeObsr());
}
 void changePostion(value){
   positionValue=value;
   emit(ChangePosition());
 }
}