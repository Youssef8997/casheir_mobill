import 'package:flutter/material.dart';

// ignore: avoid_types_as_parameter_names
Future nevigator({ page, context, bool=false}){
  return Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=> page),(Route route)=>bool);
}
Container wallpaper(Size Size) {
  return   Container(
    width: Size.width,
    height: Size.height,
    decoration:const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          filterQuality: FilterQuality.high,
          image: AssetImage(
            "lib/assest/Wallpaper.jpg",

          ),
        )),
  );
}
Container mainWallpaper(Size Size) {
  return Container(
    width: Size.width,
    height: Size.height,
    decoration:const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          filterQuality: FilterQuality.high,
          image: AssetImage(
            "lib/assest/WallpaperWithOut.psd.jpg",

          ),
        )),
  );
}
Container gfWallpaper(Size Size) {
  return Container(
    width: Size.width,
    height: Size.height,
    decoration:const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          filterQuality: FilterQuality.high,
          image: AssetImage(
            "lib/assest/Wallpaperbluer.jpg",

          ),
        )),
  );
}
Color activeColor=Colors.brown[700]!;
Color anActiveColor=Colors.grey[600]!;
const List<Color> mostColors=[
  Color(0xffd8f3dc),
  Color(0xffb7e4c7),
  Color(0xff74c69d),
  Color(0xff40916c),
  Color(0xff1b4332),
];
 List<Color> lessColors=[
   const  Color(0xFFe63946),
   const Color(0xFFE97171),
   const Color(0xFFFFCB8E),
   Colors.grey[500]!,
   const Color(0xFFF5EFEF),
];