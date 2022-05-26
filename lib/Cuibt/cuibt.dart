import 'package:casheir_mobill/Cuibt/State.dart';
import 'package:casheir_mobill/Models/Selles%20and%20baying.dart';
import 'package:casheir_mobill/Models/Store%20and%20products.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../Componads/Comoonads.dart';
import '../HomeLayout/HomeLayout.dart';
import '../Models/empo/Empo.dart';
import '../Models/suppliers/Suppliers.dart';
import '../SheredPrefrence/shered.dart';
import '../moudle/Money Moudle.dart';
import '../moudle/UserMoudule.dart';
import '../moudle/orders Moudle.dart';

class MobilCuibt extends Cubit<MobilState> {
  MobilCuibt() : super(initState());
  static MobilCuibt get(context) => BlocProvider.of(context);
  //firebase var
  UserModule? user;
MoneyMoudel? money;
List<OrdersMoudel>itemsQuntity=[];
List<OrdersMoudel>itemsQuntityLess=[];
var allquantity=0.0;
  //SignIN
  var emailAdreessController = TextEditingController();
  var passwordController = TextEditingController();
  bool obscuring = true;
  //SignUp
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var signUpPassword = TextEditingController();
  var signUpPassword2 = TextEditingController();
  var phoneController = TextEditingController();
  String? positionValue;
  bool signUpObscuring = true;
//Sells
  var hideSubtitle; // UI
  //Store
  bool searchVisibleStore = false; // UI
  var searchControllerStore = TextEditingController();
  var nameItemController = TextEditingController();
  var costItemController = TextEditingController();
  var dateItemController = TextEditingController();
  var numberItemController = TextEditingController();
  //employee
  bool searchVisibleEmployee = false;
  var searchControllerEmployee = TextEditingController();
  int selectedTile = 1;
  var employeeScaffold = GlobalKey<ScaffoldState>();

  //Filters
  var bottomSheetController = TextEditingController();
  var kayScaffold = GlobalKey<ScaffoldState>();
  String typeSearch = "Sells";
  String typeOrder = "descending"; //hive boxs
  //UI
  var scrollController = PageController();
  var value = 0;
  List<Widget> body = [
    SellesABuying(),
    StoreAProducts(),
    Suppliers(),
    Employees(),
  ];
  List<String> AppBar = [
    "Selles ",
    "Store ",
    "Suppliers ",
    "Employees ",
  ];
  List<FlashyTabBarItem> barItem = [
    FlashyTabBarItem(
        title: const Text("Sells"),
        icon: const Icon(Icons.shopping_cart),
        inactiveColor: Colors.grey,
        activeColor: Colors.blue),
    FlashyTabBarItem(
      title: const Text("Store"),
      icon: const Icon(Icons.store),
      inactiveColor: Colors.white,
      activeColor: Colors.lightBlue[700]!,
    ),
    FlashyTabBarItem(
        title: const Text("Suppliers"),
        icon: const Icon(
          Icons.attribution_outlined,
        ),
        inactiveColor: Colors.white,
        activeColor: Colors.lightBlue[500]!),
    FlashyTabBarItem(
        title: const Text("Employees"),
        icon: const Icon(
          Icons.group_outlined,
        ),
        inactiveColor: Colors.white,
        activeColor: Colors.blueGrey),
  ];

  //Methods
  void changeSignInObsr() {
    obscuring = !obscuring;
    emit(changeObsr());
  }

  void changeSignUpObsr() {
    signUpObscuring = !signUpObscuring;
    emit(changeObsr());
  }

  void changePostion(value) {
    positionValue = value;
    emit(ChangePosition());
  }

  void changeSearchVisible() {
    if (value == 1) {
      searchVisibleStore = !searchVisibleStore;
    }
    emit(ChangeVisibalBar());
  }

  void ChangeHideSubtitle(expanded) {
    if (expanded) {
      hideSubtitle = Text("");
    } else {
      hideSubtitle = null;
    }
  }

  void changeSelectedTile(int value) {
    selectedTile = value;
    emit(ChangeSelectedTile());
  }

  //SignIn Methods FireBase
  void signIn(context) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailAdreessController.text,
            password: passwordController.text)
        .then((value) {
      sherdprefrence.setdate(key: 'Token', value: value.user!.uid);
      getUserDate();
      print(value.user!.uid);
      nevigator(bool: false, page: HomeLayout(), context: context);
      emit(SignInTr());
    }).catchError((onError) {
      emit(SignInFa()); //error
      print(onError);
    });
  }

  //Get user data from firebase
  void getUserDate() {
    FirebaseFirestore.instance
        .collection("Users")
        .doc(sherdprefrence.getdate(key: 'Token'))
        .get()
        .then((value) {
      user = UserModule.fromJson(value.data()!);
      print(user!.uid);
      emit(GetUserDateTr());
    }).catchError((onError) {
      emit(GetUserDateFa());
      print(onError);
    });
  }
  //Get Money data from firebase
  void getMoneyDate() {
    FirebaseFirestore.instance
        .collection("Users")
        .doc("buD9c6qOdBalk4AXJeA3W2wtXes2")
        .collection("Shops")
        .doc("lord")
        .collection("Money")
        .doc("${DateFormat.yMMMd().format(DateTime.now())}")
        .get()
        .then((value) {
          print(value.data());
         if(value.data()!=null){
            money = MoneyMoudel.fromJson(value.data()!);
           }
          else{
            money=MoneyMoudel(moneyInBox: 0.0,moneyPaid: 0.0,allMoneyGeted: 0.0,dateTime:DateFormat.yMMMd().format(DateTime.now()));
          print(money!.moneyPaid);}
          emit(GetMoneyDateTr());
    }).catchError((onError){
      emit(GetMoneyDateFa());
      print(onError);
    });
  }
//Get buying item
void GetOrdersItem(){
  itemsQuntity.clear();
   FirebaseFirestore.instance
      .collection("Users")
      .doc("buD9c6qOdBalk4AXJeA3W2wtXes2")
      .collection("Shops")
      .doc("lord")
      .collection("Orders")
       .orderBy("quantity",descending: true)
      .get()
      .then((value) {
    for (var element in value.docs) {
      itemsQuntity.add(OrdersMoudel.fromJson(element.data()));
      allquantity=allquantity+element.data()["quantity"];
    }
    itemsQuntityLess=List.from(itemsQuntity.reversed);
    emit(GetOrderItemDateTr());
  }).catchError((onError){
    emit(GetOrderItemDateFa());
    print(onError);
  });
}
//get the most and less Item buying



}
