import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

PreferredSizeWidget appBar ({required text,required Action}){
  return AppBar(
    title: Shimmer.fromColors(
        baseColor: Colors.white,
        highlightColor: Colors.grey[600]!,
        child: Text(text)),
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions:Action,

  );
}