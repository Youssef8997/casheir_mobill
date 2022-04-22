import 'package:casheir_mobill/Cuibt/State.dart';
import 'package:casheir_mobill/Models/Selles%20and%20baying.dart';
import 'package:casheir_mobill/Models/Store%20and%20products.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Models/Empo.dart';
import '../Models/suppliers/Suppliers.dart';
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
//Sells
  var hideSubtitle;// UI
  //Store
  bool searchVisibleStore=false;// UI
  var searchControllerStore = TextEditingController();
  var nameItemController = TextEditingController();
  var costItemController = TextEditingController();
  var dateItemController = TextEditingController();
  var numberItemController = TextEditingController();
  //Filters
  var bottomSheetController = TextEditingController();
  var kayScaffold=GlobalKey<ScaffoldState>();
  String typeSearch="Sells";
  String typeOrder="descending";
  //UI
  var scrollController = PageController();
  var value=0;
  List<Widget>body=[
  SellesABuying(),
  StoreAProducts(),
  Suppliers(),
  Users(),
  Employees(),
  ];
List <String>AppBar=[
  "Selles ",
  "Store ",
   "Suppliers ",
 "Users activity ",
  "Employees ",
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
 void changeSearchVisible(){

  if(value==1) {
      searchVisibleStore = !searchVisibleStore;
  }
    emit(ChangeVisibalBar());
 }
 void ChangeHideSubtitle(expanded){
if(expanded) {
  hideSubtitle=Text("");
} else {
  hideSubtitle=null;
}
emit(clopsed());
 }

}