import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

PreferredSizeWidget appBar ({required text,required List <Widget> Action}){
  return AppBar(
    title: Shimmer.fromColors(
        baseColor: Colors.black,
        highlightColor:Colors.white,
        child: Text(text,style: TextStyle(fontWeight: FontWeight.w900),)),
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions:Action,
  );
}