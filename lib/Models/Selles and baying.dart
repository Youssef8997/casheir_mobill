import 'package:casheir_mobill/Componads/TextForm.dart';
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
        var Size = MediaQuery.of(context).size;
        var cuibt = MobilCuibt.get(context);
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    margin: const EdgeInsetsDirectional.all(20.0),
                    height: Size.height * .2,
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
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Row of title
                          const Text(
                            "total balance",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 22.0),
                          ),
              const SizedBox(height: 20,),

                          //Row of Money
                          Row(
  children:  [
    Text("\$",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w800,color: Colors.teal[700]!),),
    const SizedBox(width: 3),
    const Text("20,000 LE",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w800),),

  ],
),
                          const SizedBox(height: 20,),
                          //Row of analytics

                          Row(
                            children: [
                              Container(
                                color:Colors.white.withOpacity(.15)
                                ,child: const Icon(
                                  Icons.trending_up_outlined,
                                color: Colors.white60,
                                ),
                              ),
                              const SizedBox(width: 5,),
                              const Text("15.0 %",style: TextStyle( fontWeight: FontWeight.bold,fontSize: 17),)
                            ],
                          )


                        ]),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    margin: const EdgeInsetsDirectional.all(20.0),
                    height: Size.height * .2,
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
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Row of title
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "profit",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22.0),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.unfold_more_outlined,
                                  color: Colors.white70,
                                  size: 23,
                                ),
                                onPressed: () {},)
                            ],
                          ),
                          //Row of Money
                          Row(
  children:  [
    Text("\$",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w800,color: Colors.teal[700]!),),
    const SizedBox(width: 3),
    const Text("5,000 LE",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w800),),

  ],
),
                          const SizedBox(height: 20,),
                          //Row of analytics

                          Row(
                            children: [
                              Container(
                                color:Colors.white.withOpacity(.15)
                                ,child: const Icon(
                                  Icons.trending_up_outlined,
                                color: Colors.white60,
                                ),
                              ),
                              const SizedBox(width: 5,),
                              const Text("5.0 %",style: TextStyle( fontWeight: FontWeight.bold,fontSize: 17),)
                            ],
                          )


                        ]),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    margin: const EdgeInsetsDirectional.all(20.0),
                    height: Size.height * .2,
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
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Row of title
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "loss",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22.0),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.unfold_more_outlined,
                                  color: Colors.white70,
                                  size: 23,
                                ),
                                onPressed: () {},)
                            ],
                          ),
                          //Row of Money
                          Row(
  children:  [
    Text("\$",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w800,color: Colors.teal[700]!),),
    const SizedBox(width: 3),
     Text("1,000 LE",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600,color: Colors.grey[800]!),),

  ],
),
                          const SizedBox(height: 20,),
                          //Row of analytics

                          Row(
                            children: [
                              Container(
                                color:Colors.white.withOpacity(.15)
                                ,child: const Icon(
                                  Icons.trending_down_outlined,
                                color: Colors.white60,
                                ),
                              ),
                              const SizedBox(width: 5,),
                              const Text("15.0 %",style: TextStyle( fontWeight: FontWeight.bold,fontSize: 17),)
                            ],
                          )


                        ]),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Visibility visibilitySearch(MobilCuibt cuibt) {
    return Visibility(
        replacement: const SizedBox(
          height: 0,
          width: 0,
        ),
        maintainSize: true,
        maintainState: true,
        maintainAnimation: true,
        visible: cuibt.searchVisibleBar,
        child: Align(
          alignment: Alignment.topCenter,
          child: MyTextField(
            Controlr: cuibt.searchController,
            hint: "pepsi",
          ),
        ));
  }

/*SizedBox(
                    height: Size.height,
                    width: Size.width,
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                        itemBuilder: (context,index)=>showItems(Size),
                        separatorBuilder: (context,index)=>const SizedBox(height:15,),
                        itemCount: 50),
                  )*/
  Container showItems(Size Size) {
    return Container(
      padding: const EdgeInsets.only(right: 10, left: 30),
      height: 80,
      width: Size.width,
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(50.0),
          border: Border.all(color: Colors.grey[600]!, width: 4)),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Pepsi",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "100.00 LE",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[300]!,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Spacer(),
          const Text(
            "50 Package",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
//Show what they baying and selling
//show most sold and most bought
//show the little sold and bought
