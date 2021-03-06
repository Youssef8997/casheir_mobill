
import 'package:casheir_mobill/Cuibt/cuibt.dart';
import 'package:casheir_mobill/SpalshScreen/Spalsh.dart';
import 'package:casheir_mobill/translations/codegen_loader.g.dart';
import 'package:connection_notifier/connection_notifier.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'SheredPrefrence/shered.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  await sherdprefrence.init();
  runApp(EasyLocalization(
      path: 'lib/assest/Trans',
      supportedLocales: [Locale('en'), Locale('ar')],
      fallbackLocale: Locale('en'),
      assetLoader: CodegenLoader(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ConnectionNotifier(

      child: MultiBlocProvider(
        providers: [
       BlocProvider(create: (BuildContext context) => MobilCuibt())
        ],
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.brown,
            visualDensity: VisualDensity.adaptivePlatformDensity,

          ),
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
  
  debugShowCheckedModeBanner: false,
          home: Spalsh(),
        ),
      ),
    );
  }
}






