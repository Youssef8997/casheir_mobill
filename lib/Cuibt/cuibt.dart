import 'package:casheir_mobill/Cuibt/State.dart';
import 'package:casheir_mobill/Models/Selles%20and%20baying.dart';
import 'package:casheir_mobill/Models/Store%20and%20products.dart';
import 'package:casheir_mobill/moudle/Suppliers%20Moudle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../Componads/Comoonads.dart';
import '../HomeLayout/HomeLayout.dart';
import '../Models/empo/Empo.dart';
import '../Models/settings.dart';
import '../Models/suppliers/Suppliers.dart';
import '../SheredPrefrence/shered.dart';
import '../moudle/Date Empoloyee.dart';
import '../moudle/Empoloyee.dart';
import '../moudle/Fess moudle.dart';
import '../moudle/Money Moudle.dart';
import '../moudle/ProductMoudle.dart';
import '../moudle/Rate.dart';
import '../moudle/UserMoudule.dart';
import '../moudle/money.dart';
import '../moudle/orders Moudle.dart';
import '../sign/signin.dart';
import '../translations/locale_keys.g.dart';

class MobilCuibt extends Cubit<MobilState> {
  MobilCuibt() : super(initState());

  static MobilCuibt get(context) => BlocProvider.of(context);

  //firebase var
  UserModule? user;
  MoneyMoudel? money;
  List<MoneyEmpo> employeeMoney = [];
  List<OrdersMoudel> itemsQuantity = [];
  List<OrdersMoudel> itemsQuantityLess = [];
  List<ProductsModule> productData = [];
  List<SuppliersModule> suppliers = [];
  List<FeesModule> fess = [];
  List<EmployeeModule> employee = [];
  List<EmployeeDateModule> employeeDate = [];
  Rate? rate;
  var allQuantity = 0.0;

  //SignIN
  var emailAddressController = TextEditingController();
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
  //Store
  bool searchVisibleStore = false; // UI
  var searchControllerStore = TextEditingController();
  var nameItemController = TextEditingController();
  var priceItemController = TextEditingController();
  var expireDateItemController = TextEditingController();
  var quantityItemController = TextEditingController();

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
    Setting()
  ];
  List<String> AppBar = [
    LocaleKeys.bar1.tr(),
    LocaleKeys.bar2.tr(),
    LocaleKeys.bar3.tr(),
    LocaleKeys.bar4.tr(),
    LocaleKeys.bar5.tr(),

  ];
  List<FlashyTabBarItem> barItem = [
    FlashyTabBarItem(
        title:  Text( LocaleKeys.bar1.tr(),),
        icon: const Icon(Icons.shopping_cart),
        inactiveColor: Colors.grey,
        activeColor: Colors.blue),
    FlashyTabBarItem(
      title:  Text(    LocaleKeys.bar2.tr(),
      ),
      icon: const Icon(Icons.store),
      inactiveColor: Colors.white,
      activeColor: Colors.lightBlue[700]!,
    ),
    FlashyTabBarItem(
        title:  Text(    LocaleKeys.bar3.tr(),
        ),
        icon: const Icon(
          Icons.attribution_outlined,
        ),
        inactiveColor: Colors.white,
        activeColor: Colors.lightBlue[500]!),
    FlashyTabBarItem(
        title:  Text(    LocaleKeys.bar4.tr(),
        ),
        icon: const Icon(
          Icons.group_outlined,
        ),
        inactiveColor: Colors.white,
        activeColor: Colors.blueGrey),
    FlashyTabBarItem(
        title:  Text(    LocaleKeys.bar5.tr(),
        ),
        icon: const Icon(
          Icons.settings,
        ),
        inactiveColor: Colors.white,
        activeColor: Colors.grey),
  ];

//Settings
  var BranchName;
  List<String> Branch = [];
String dataTime=DateFormat.yMMMd().format(DateTime.now());
  void setBranchName(name) {
    BranchName = name;
   getUserDate();
   getMoneyDate();
   getOrdersItem();
   getProductData();
   getSuppliers();
   getEmployeeData();
   scrollController.animateToPage(0, duration: const Duration(seconds: 1), curve: Curves.easeOutCubic);
value=0;
    emit(ChangeBranch());
  }

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

  void changeSelectedTile(int value) {
    selectedTile = value;
    emit(ChangeSelectedTile());
  }

  //SignIn Methods FireBase
  void signIn(context) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailAddressController.text,
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
        .doc(sherdprefrence.getdate(key: 'Token'))
        .collection("Shops")
        .doc(BranchName)
        .collection("Money")
        .doc(dataTime)
        .get()
        .then((value) {
      print(value.data());
      if (value.data() != null) {
        money = MoneyMoudel.fromJson(value.data()!);
      } else {
        money = MoneyMoudel(
            moneyInBox: 0.0,
            moneyPaid: 0.0,
            allMoneyGeted: 0.0,
            dateTime: DateFormat.yMMMd().format(DateTime.now()));
        print(money!.moneyPaid);
      }
      emit(GetMoneyDateTr());
    }).catchError((onError) {
      emit(GetMoneyDateFa());
      print(onError);
    });
  }

//Get buying item
  void getOrdersItem() {
    itemsQuantity.clear();
    FirebaseFirestore.instance
        .collection("Users")
        .doc(sherdprefrence.getdate(key: 'Token'))
        .collection("Shops")
        .doc(BranchName)
        .collection("Orders")
        .orderBy("quantity", descending: true)
        .get()
        .then((value) {
      for (var element in value.docs) {
        itemsQuantity.add(OrdersMoudel.fromJson(element.data()));
        allQuantity = allQuantity + element.data()["quantity"];
      }
      itemsQuantityLess = List.from(itemsQuantity.reversed);
      emit(GetOrderItemDateTr());
    }).catchError((onError) {
      emit(GetOrderItemDateFa());
      print(onError);
    });
  }

//get Product Data
  void getProductData() {
    productData.clear();
    print("getProductData");
    FirebaseFirestore.instance
        .collection("Users")
        .doc(sherdprefrence.getdate(key: 'Token'))
        .collection("Shops")
        .doc(BranchName)
        .collection("products")
        .orderBy("quantityInShop", descending: false)
        .get()
        .then((value) {
      for (var element in value.docs) {
        productData.add(ProductsModule.fromJson(element.data()));
      }
      emit(GetProductDateTr());
    }).catchError((onError) {
      emit(GetProductDateFa());
      print(onError);
    });
  }

//UpdateProduct
  void updateProduct({
    required name,
    required price,
    required quantity,
    required expireDate,
    required quantityInShop,
    required code,
    required startDate,
    required quantityInStore,
  }) {
    ProductsModule product = ProductsModule(
      name: name,
      price: double.parse(price),
      quantityInShop: int.parse(quantity),
      quantityInStore: quantityInStore,
      code: code,
      endDate: expireDate,
      startDate: startDate,
    );
    FirebaseFirestore.instance
        .collection("Users")
        .doc(sherdprefrence.getdate(key: 'Token'))
        .collection("Shops")
        .doc(BranchName)
        .collection("products")
        .doc(product.code)
        .update(product.toJson())
        .then((value) {
      print("update");
      emit(UpdateProductDateTr());
    }).catchError((onError) {
      emit(UpdateProductDateFa());
      print(onError);
    });
  }

  //Insert information to controller
  void fullController({name, price, quantity, expireDate}) {
    nameItemController.text = name;
    priceItemController.text = price.toString();
    quantityItemController.text = quantity.toString();
    expireDateItemController.text = expireDate;
  }

//Get Suppliers Data
  void getSuppliers() {
    suppliers.clear();
    FirebaseFirestore.instance
        .collection("Users")
        .doc(sherdprefrence.getdate(key: 'Token'))
        .collection("Shops")
        .doc(BranchName)
        .collection("Suppliers")
        .get()
        .then((value) {
      for (var element in value.docs) {
        suppliers.add(SuppliersModule.fromJson(element.data()));
      }
      print(suppliers);
      emit(GetSuppliersDateTr());
    }).catchError((onError) {
      emit(GetSuppliersDateFa());
      print(onError);
    });
  }

  //Fess
  void getFessData({name}) {
    fess.clear();
    FirebaseFirestore.instance
        .collection("Users")
        .doc(sherdprefrence.getdate(key: 'Token'))
        .collection("Shops")
        .doc(BranchName)
        .collection("Suppliers")
        .doc(name)
        .collection("Fees")
        .get()
        .then((value) {
      for (var element in value.docs) {
        fess.add(FeesModule.fromJson(element.data()));
      }
      print("fess is ${fess.length}");
      emit(GetFessDateTr());
    }).catchError((onError) {
      emit(GetFessDateFa());
      print(onError);
    });
  }

//employee
  void getEmployeeData() {
    employee.clear();
    FirebaseFirestore.instance
        .collection("Users")
        .doc(sherdprefrence.getdate(key: 'Token'))
        .collection("Shops")
        .doc(BranchName)
        .collection("Employee")
        .get()
        .then((value) {
      for (var element in value.docs) {
        employee.add(EmployeeModule.fromJson(element.data()));
      }
      print("employee is ${employee.length}");
      emit(GetEmployeeDateTr());
    }).catchError((onError) {
      emit(GetEmployeeDateFa());
      print(onError);
    });
  }

  //Get Employee Data
  void getAttendance({id}) {
    employeeDate.clear();
    FirebaseFirestore.instance
        .collection("Users")
        .doc(sherdprefrence.getdate(key: 'Token'))
        .collection("Shops")
        .doc(BranchName)
        .collection("Employee")
        .doc("$id")
        .collection("Attendance,Leaving Date")
        .get()
        .then((value) {
      for (var element in value.docs) {
        employeeDate.add(EmployeeDateModule.fromJson(element.data()));
      }
      print("employeeDate is ${employeeDate.length}");
      emit(GetAttendanceDateTr());
    }).catchError((onError) {
      emit(GetAttendanceDateFa());
      print(onError);
    });
  }

  void getRate({id}) {
    FirebaseFirestore.instance
        .collection("Users")
        .doc(sherdprefrence.getdate(key: 'Token'))
        .collection("Shops")
        .doc(BranchName)
        .collection("Employee")
        .doc("$id")
        .collection("Rate")
        .doc(DateFormat.yMMMd().format(DateTime.now()))
        .get()
        .then((value) {
      rate = Rate.fromJson(value.data()!);
      print("rate is ${rate}");
      emit(GetRateDateTr());
    }).catchError((onError) {
      emit(GetRateDateFa());
      rate = Rate.fromJson({"Rate": "0"});
      print(onError);
    });
  }

  void getMoneyData({id}) {
    FirebaseFirestore.instance
        .collection("Users")
        .doc(sherdprefrence.getdate(key: 'Token'))
        .collection("Shops")
        .doc(BranchName)
        .collection("Employee")
        .doc("$id")
        .collection("Money")
        .get()
        .then((value) {
      for (var element in value.docs) {
        employeeMoney.add(MoneyEmpo.fromJson(element.data()));
      }
      print("money is ${employeeMoney.length}");
      emit(GetMoneyDateTr());
    });
  }

  //get name of branches
  void getBranchName() async {
    Branch.clear();
    print("dsvfgfv");
    var collection = FirebaseFirestore.instance.collection('Users').doc(sherdprefrence.getdate(key: 'Token')).collection('Shops');
    var querySnapshots = await collection.get();
    print(querySnapshots.docs.length);
    for (var snapshot in querySnapshots.docs) {
      Branch.add(snapshot.id) ;// <-- Document ID
      print(snapshot.id);
    }
    BranchName=Branch[0];
}
void logout(context){
  sherdprefrence.removedate(key: 'Token');
  employeeMoney = [];
itemsQuantity = [];
  itemsQuantityLess = [];
 productData = [];
 suppliers = [];
 fess = [];
 employee = [];
 employeeDate = [];
  nevigator(bool: false,page: SignIn(),context: context);
}
}