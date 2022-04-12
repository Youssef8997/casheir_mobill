import 'package:casheir_mobill/Cuibt/State.dart';
import 'package:casheir_mobill/Models/Selles%20and%20baying.dart';
import 'package:casheir_mobill/Models/Store%20and%20products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Models/Empo.dart';
import '../Models/Suppliers.dart';
import '../Models/Users.dart';

class MobilCuibt extends Cubit<MobilState> {
  MobilCuibt() : super(initState());
  static MobilCuibt get(context) => BlocProvider.of(context);
// UI
List<Widget>Body=[
  SellesABuying(),
  StoreAProducts(),
  Suppliers(),
  Users(),
  Employees(),
  ];

}