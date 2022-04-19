import 'package:casheir_mobill/Cuibt/State.dart';
import 'package:casheir_mobill/Cuibt/cuibt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SellesABuying extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MobilCuibt, MobilState>(
      listener: (context, state) {},
      builder: (context, state) {
        var Size = MediaQuery
            .of(context)
            .size;
        var cuibt = MobilCuibt.get(context);
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Hi Youssef!",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white,fontStyle: FontStyle.italic),),
                  const Text("Thanks for your trust in us to make your work more professional ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white54,),),
                  MyExpansionTile(Size: Size, Children: [balanceContents()], Title: "Account Balance",SubTitle: "All physical transactions are recorded in the account balance",cuibt: cuibt,),
                  MyExpansionTile(Size: Size, Children: [sellsContents()], Title: "Sells",SubTitle: "The monetary gain you earned from selling your products",cuibt: cuibt,),
                  MyExpansionTile(Size: Size,
                      Children: [paymentContents()],
                      Title: "Payments",
                  SubTitle: "The money you paid to buy your products or raw materials",
                  cuibt: cuibt,
                  ),
                  MyExpansionTile(Size: Size, Children: [
                    mostContents()
                  ], Title: "Most in demand",
                  SubTitle: "The most sold products",
                  cuibt: cuibt,
                  ),
                  MyExpansionTile(Size: Size, Children: [
                    leastContents()
                  ], Title: "least in demand",
                  SubTitle:"The least sold products",
                  cuibt: cuibt,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget MyExpansionTile({
    required Size Size,
    required List<Widget> Children,
    required String Title,
     String ? SubTitle,
    required MobilCuibt cuibt
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      margin: const EdgeInsetsDirectional.all(20.0),
      width: Size.width * .8,
      decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey[800]!, width: 2),
          boxShadow: [
            BoxShadow(
                color: Colors.grey[900]!,
                blurRadius: 3,
                spreadRadius: 1,
                offset: const Offset(0, 5)),
          ]),
      //To hide Subtitle
      child: ExpansionTile(onExpansionChanged: (bool)=>cuibt.ChangeHideSubtitle(bool),
        subtitle: cuibt.hideSubtitle??Text(
          SubTitle??"",
          style: TextStyle(
              color: Colors.grey[800]!,
              fontSize: Size.width * .04,
              fontWeight: FontWeight.bold),
        ),
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(
          Title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
        ),
        maintainState: true,
        children: Children,
      ),
    );
  }

  Column balanceContents() {
    return Column(
      crossAxisAlignment:   CrossAxisAlignment.start,
      children: [
        //Row of Money
        Row(
          children: [
            Text(
              "\$",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Colors.teal[700]!),
            ),
            const SizedBox(width: 3),
            const Text(
              "20,000 LE",
              style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.w800),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        //Row of analytics
        Row(
          children: [
            Container(
              color: Colors.white.withOpacity(.15),
              child: const Icon(
                Icons.trending_up_outlined,
                color: Colors.white60,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            const Text(
              "15.0 %",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 17),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Text("First user",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        Row(
          children: [
            Text("5,000 LE",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800]!)),
            const Spacer(),
            Container(
              color: Colors.white.withOpacity(.15),
              child: const Icon(
                Icons.trending_up_outlined,
                color: Colors.white60,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            const Text(
              "15.0 %",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 17),
            ),

          ],
        ),
       const Text("Second user",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        Row(
          children: [
            Text("5,000 LE",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800]!)),
            const Spacer(),
            Container(
              color: Colors.white.withOpacity(.15),
              child: const Icon(
                Icons.trending_up_outlined,
                color: Colors.white60,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            const Text(
              "15.0 %",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 17),
            ),

          ],
        ),
        const Text("third user",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        Row(
          children: [
            Text("5,000 LE",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800]!)),
            const Spacer(),
            Container(
              color: Colors.white.withOpacity(.15),
              child: const Icon(
                Icons.trending_up_outlined,
                color: Colors.white60,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            const Text(
              "15.0 %",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 17),
            ),

          ],
        ),


      ],
    );
  }

  Column sellsContents() {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Row of Money
        Row(
          children: [
            Text(
              "\$",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Colors.teal[700]!),
            ),
            const SizedBox(width: 3),
            const Text(
              "15,000 LE",
              style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.w800),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        //Row of analytics
        Row(
          children: [
            Container(
              color: Colors.white.withOpacity(.15),
              child: const Icon(
                Icons.trending_up_outlined,
                color: Colors.white60,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            const Text(
              "15.0 %",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 17),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Text("First user",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        Row(
          children: [
            Text("5,000 LE",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800]!)),
            const Spacer(),
            Container(
              color: Colors.white.withOpacity(.15),
              child: const Icon(
                Icons.trending_up_outlined,
                color: Colors.white60,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            const Text(
              "15.0 %",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 17),
            ),

          ],
        ),
        const Text("Second user",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        Row(
          children: [
            Text("5,000 LE",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800]!)),
            const Spacer(),
            Container(
              color: Colors.white.withOpacity(.15),
              child: const Icon(
                Icons.trending_up_outlined,
                color: Colors.white60,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            const Text(
              "15.0 %",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 17),
            ),

          ],
        ),
        const Text("third user",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        Row(
          children: [
            Text("5,000 LE",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800]!)),
            const Spacer(),
            Container(
              color: Colors.white.withOpacity(.15),
              child: const Icon(
                Icons.trending_up_outlined,
                color: Colors.white60,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            const Text(
              "15.0 %",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 17),
            ),

          ],
        ),
      ],
    );
  }

  Column paymentContents() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Row of Money
        Row(
          children: [
            Text(
              "\$",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Colors.teal[700]!),
            ),
            const SizedBox(width: 3),
            const Text(
              "4,000 LE",
              style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.w800),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        //Row of analytics
        Row(
          children: [
            Container(
              color: Colors.white.withOpacity(.15),
              child: const Icon(
                Icons.trending_up_outlined,
                color: Colors.white60,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            const Text(
              "15.0 %",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 17),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Text("First user",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        Row(
          children: [
            Text("5,000 LE",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800]!)),
            const Spacer(),
            Container(
              color: Colors.white.withOpacity(.15),
              child: const Icon(
                Icons.trending_up_outlined,
                color: Colors.white60,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            const Text(
              "15.0 %",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 17),
            ),

          ],
        ),
        const Text("Second user",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        Row(
          children: [
            Text("5,000 LE",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800]!)),
            const Spacer(),
            Container(
              color: Colors.white.withOpacity(.15),
              child: const Icon(
                Icons.trending_up_outlined,
                color: Colors.white60,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            const Text(
              "15.0 %",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 17),
            ),

          ],
        ),
        const Text("third user",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        Row(
          children: [
            Text("5,000 LE",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800]!)),
            const Spacer(),
            Container(
              color: Colors.white.withOpacity(.15),
              child: const Icon(
                Icons.trending_up_outlined,
                color: Colors.white60,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            const Text(
              "15.0 %",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 17),
            ),

          ],
        ),
      ],
    );
  }

  Column mostContents() {
    return Column(
      children: [
        //Row of Money
        Row(
          children: [
            Text(
              "\$",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Colors.teal[700]!),
            ),
            const SizedBox(width: 3),
            const Text(
              "20,000 LE",
              style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.w800),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        //Row of analytics
        Row(
          children: [
            Container(
              color: Colors.white.withOpacity(.15),
              child: const Icon(
                Icons.trending_up_outlined,
                color: Colors.white60,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            const Text(
              "15.0 %",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 17),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Column leastContents() {
    return Column(
      children: [
        //Row of Money
        Row(
          children: [
            Text(
              "\$",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Colors.teal[700]!),
            ),
            const SizedBox(width: 3),
            const Text(
              "20,000 LE",
              style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.w800),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        //Row of analytics
        Row(
          children: [
            Container(
              color: Colors.white.withOpacity(.15),
              child: const Icon(
                Icons.trending_up_outlined,
                color: Colors.white60,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            const Text(
              "15.0 %",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 17),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

//Show what they baying and selling
//show most sold and most bought
//show the little sold and bought
}