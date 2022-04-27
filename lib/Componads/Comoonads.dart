import 'package:blurrycontainer/blurrycontainer.dart';
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