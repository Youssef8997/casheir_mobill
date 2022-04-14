import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

PreferredSizeWidget appBar ({required text,required List <Widget> Action}){
  return AppBar(
    title: Shimmer.fromColors(
        highlightColor: Colors.black,
        baseColor:Colors.white54,
        child: Text(text,style: TextStyle(fontWeight: FontWeight.w900),)),
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions:Action,
  );
}