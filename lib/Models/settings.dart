import 'package:casheir_mobill/Cuibt/State.dart';
import 'package:casheir_mobill/Cuibt/cuibt.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../translations/locale_keys.g.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MobilCuibt, MobilState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cuibt = MobilCuibt.get(context);
        return SafeArea(
            child: ExpansionTileTheme(
          data: ExpansionTileThemeData(
            iconColor: Colors.white,
            textColor: Colors.white,
            collapsedIconColor: Colors.grey[400],
            collapsedTextColor: Colors.grey[400],
            expandedAlignment: Alignment.bottomCenter,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ExpansionTile(
                  leading: Icon(Icons.storefront),
                  title: Text(
                   LocaleKeys.branches.tr(),
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  controlAffinity: ListTileControlAffinity.trailing,
                  subtitle: Text(
                      LocaleKeys.setting1.tr() ,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  children: [
                    SizedBox(
                    width: MediaQuery.of(context).size.width,
                      height:250,
                      child: ListView.separated(
                          itemBuilder: (context,i)=>MyListTile(Name:cuibt.Branch[i], cuibt: cuibt),
                          separatorBuilder: (context,_)=>const SizedBox(height: 25),
                          itemCount:cuibt.Branch.length),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                ExpansionTile(
                  leading: Icon(Icons.language),
                  title: Text(
                    LocaleKeys.Language.tr(),
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  controlAffinity: ListTileControlAffinity.trailing,
                  subtitle: Text(
                    LocaleKeys.Change_app_language.tr(),
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  children: [
                    ListTile(
                    onTap: () {context.setLocale(Locale('ar'));},
                    leading: Icon(Icons.date_range_sharp, color: Colors.white),
                    title: Text(
                      "العربيه",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.italic),
                    ),
                  ) ,
                    ListTile(
                    onTap: () {context.setLocale(Locale('en'));},
                    leading: Icon(Icons.flag, color: Colors.white),
                    title: Text(
                      "English",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.italic),
                    ),
                  ) ,

                  ],
                ),
                ExpansionTile(
                  leading: Icon(Icons.date_range),
                  title: Text(
                    LocaleKeys.Date.tr(),
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  controlAffinity: ListTileControlAffinity.trailing,
                  subtitle: Text(
                    LocaleKeys.Change_your_date_of_your_information.tr(),
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  children: [
                    const SizedBox(height: 15,),
                    ListTile(
                      onTap: () { showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.parse('2022-05-01'),
                        lastDate: DateTime.parse('2027-11-07'),
                      ).then((value) {
                        value ??= DateTime.now();
                        cuibt.dataTime = DateFormat.yMMMd().format(value);
                       cuibt.scrollController.animateToPage(0, duration: const Duration(seconds: 1), curve: Curves.easeOutCubic);
                        cuibt.value=0;
                        cuibt.getMoneyDate();
                      });},
                      leading: Icon(Icons.date_range_sharp, color: Colors.white),
                      title: Text(
                        LocaleKeys.change_date.tr(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.italic),
                      ),
                    )                ],
                ),
                const SizedBox(height: 25),
                ListTile(
                  onTap: () => cuibt.logout(context),
                  leading: Icon(Icons.logout, color: Colors.white),
                  title: Text(
                    LocaleKeys.log_out.tr(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic),
                  ),
                )
              ],
            ),
          ),
        ));
      },
    );
  }

  Widget MyListTile({required String Name, required MobilCuibt cuibt}) {
    return ListTile(
      onTap: () => cuibt.setBranchName(Name),
      leading: Icon(Icons.store, color: Colors.white),
      title: Text(
        Name,
        style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.italic),
      ),
    );
  }
}
