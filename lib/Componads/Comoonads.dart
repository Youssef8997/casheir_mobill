import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';

Future Nevigator({ page, context, bool=false}){
  return Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=> page),(Route route)=>bool);
}
Container Wallpaper(Size Size) {
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
Container sssWallpaper(Size Size) {
  return   Container(
    width: Size.width,
    height: Size.height,
    decoration:const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          filterQuality: FilterQuality.high,
          image: AssetImage(
            "lib/assest/WallpaperWithOut.psd",

          ),
        )),
  );
}
BlurryContainer MainWallpaper(Size Size) {
  return   BlurryContainer(
    blur: 6,
    width: Size.width,
    height: Size.height,
    child: const Text(""),
  );
}
