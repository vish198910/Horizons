import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:horizons/constants.dart';
import 'package:horizons/model/wallpaper_model.dart';
import 'package:horizons/widgets/widget.dart';
import 'package:http/http.dart' as http;

class CategoryName extends StatefulWidget {
  final String categoryName;
  CategoryName({this.categoryName});
  @override
  _CategoryNameState createState() => _CategoryNameState();
}

class _CategoryNameState extends State<CategoryName> {

  List<WallpaperModel> wallpapers = new List();
  TextEditingController textEditingController = new TextEditingController();

  getSearchPhotos(String query) async {
    String curatedPhotosUrl =
        "https://api.pexels.com/v1/search?query=$query&per_page=50&page=1";
    var response =
        await http.get(curatedPhotosUrl, headers: {"Authorization": apikey});
    print(response.body.toString());

    Map<String, dynamic> jsonData = jsonDecode(response.body);

    jsonData["photos"].forEach((element) {
      WallpaperModel wallpaperModel = new WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
    });
    setState(() {});
  }
  @override
  void initState() {
    getSearchPhotos(widget.categoryName);
    super.initState();
    textEditingController.text = widget.categoryName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          "HORIZONS",
          style: TextStyle(color: Colors.black87),
        ),
      ),
      body: SingleChildScrollView(
              child: Container(
          child: Column(
            children: <Widget>[
              Container(
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                          color: Color(0xfff5f8fd),
                          borderRadius: BorderRadius.circular(16)),
                      child: Row(children: <Widget>[
                        Expanded(
                          child: TextField(
                            controller: textEditingController,
                            decoration: InputDecoration(hintText: "search"),
                          ),
                        ),
                        GestureDetector(child: Icon(Icons.search),
                        onTap: (){
                          wallpapers = [];
                          getSearchPhotos(textEditingController.text);
                        },),
                      ]),
                    ),
                    SizedBox(height: 16,),
                    WallpaperListWidget(wallpapers: wallpapers, context: context),
            ],
          ),
        ),
      ),
    );
  }
}