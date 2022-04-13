import 'package:flutter/material.dart';

Widget MyTextField({required Controlr,required String hint,label,Prefix,suffix,keybordtype,isobsr=false,validator,OnTap,enabled,onChanged,Focusnode}) {
  return TextFormField(
    focusNode: Focusnode,
    enabled: enabled,
    onTap: OnTap,
    onChanged: onChanged,
    style: const TextStyle(color: Colors.white),
    controller: Controlr,
    keyboardType: keybordtype,
    decoration: InputDecoration(
      focusColor: Colors.white,

        enabledBorder:OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white,width: 2),
            borderRadius: BorderRadius.circular(40),
            gapPadding: 10
        ),
        focusedBorder:OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[500]!,width: 3),
            borderRadius: BorderRadius.circular(40),
            gapPadding: 10
        ),
        contentPadding: EdgeInsetsDirectional.fromSTEB(20, 0, 0,0),
        hintText: hint,
        hintStyle:TextStyle(color: Colors.white),
        label: label!=null?Text("$label"):null,
        labelStyle: TextStyle(color: Colors.white,fontSize: 20),
        prefixIcon: Prefix,
        suffixIcon: suffix,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(40),
        gapPadding: 0
      ),
    ),
    obscureText: isobsr,
    obscuringCharacter: "*",
    validator: validator,

  );
}
