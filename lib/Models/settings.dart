import 'package:casheir_mobill/Cuibt/State.dart';
import 'package:casheir_mobill/Cuibt/cuibt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

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
                    'Branches',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  controlAffinity: ListTileControlAffinity.trailing,
                  subtitle: Text(
                    'Move between your branches',
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
                    'Language',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  controlAffinity: ListTileControlAffinity.trailing,
                  subtitle: Text(
                    'Change app language',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  children: [MyListTile(Name: "lORD", cuibt: cuibt)],
                ),
                ExpansionTile(
                  leading: Icon(Icons.date_range),
                  title: Text(
                    'Date',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  controlAffinity: ListTileControlAffinity.trailing,
                  subtitle: Text(
                    'Change your date of your information',
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
                        "Change Date",
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
                    "Log out",
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
