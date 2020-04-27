import 'package:flutter/material.dart';
import 'package:horizons/model/wallpaper_model.dart';
import 'package:horizons/views/image_view.dart';

Widget WallpaperListWidget({List<WallpaperModel> wallpapers, context}) {
  return Container(
      child: GridView.count(
    shrinkWrap: true,
    crossAxisCount: 2,
    childAspectRatio: 0.6,
    crossAxisSpacing: 8,
    physics: ClampingScrollPhysics(),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    mainAxisSpacing: 8,
    children: wallpapers.map((wallpaper) {
      return GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return WallpaperView(imgUrl: wallpaper.src.portrait);
          }));
        },
        child: Hero(
          tag: wallpaper.src.portrait,
          child: GridTile(
            child: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  wallpaper.src.portrait,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      );
    }).toList(),
  ));
}
