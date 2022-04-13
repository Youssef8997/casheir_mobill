import 'package:flutter/material.dart';

Widget MyButton({required Widget widget, onPressed}) {
  return InkWell(
    onTap: onPressed,
    splashColor: Colors.brown[400],
    child: Container(
      alignment: Alignment.center,
      width: 150,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.grey[700]!,
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            offset: Offset(0, 5),
            blurRadius: 10,
          ),
        ],


      ),
      child: widget,
    ),
  );
}