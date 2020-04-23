import 'dart:convert';

import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import 'package:horizons/constant.dart';
import 'package:horizons/data/data.dart';
import 'package:horizons/model/categories_model.dart';
import 'package:http/http.dart' as http;
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = new List();

  getCuratedPhotos() async {
    String curatedPhotosUrl = "https://api.pexels.com/v1/curated?per_page=25&page=1";
    var response = await http.get(curatedPhotosUrl,headers: {
      "Authorization":apikey
    });
    print(response.body.toString());

    Map<String,dynamic> jsonData = jsonDecode(response.body);

    jsonData["photos"].forEach((element){});
  }
  
  @override
  void initState() {
    categories = getCategories();
    print(categories);
    getCuratedPhotos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          "HORIZONS",
          style: TextStyle(color: Colors.black87),
        ),
      ),
      body: Container(
        child: Column(children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                color: Color(0xfff5f8fd),
                borderRadius: BorderRadius.circular(16)),
            child: Row(children: <Widget>[
              Expanded(
                child: TextField(
                  decoration: InputDecoration(hintText: "search"),
                ),
              ),
              GestureDetector(child: Icon(Icons.search)),
            ]),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            height:80,
            child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal:24),
                itemBuilder: (context, index) {
                  return CategoryTile(
                      title: categories[index].categoryName,
                      imgUrl: categories[index].imgUrl);
                },
                itemCount: categories.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                ),
          )
        ]),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String imgUrl, title;
  CategoryTile({@required this.imgUrl, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
        child: Stack(
      children: <Widget>[
        ClipRRect(
          child: Image.network(imgUrl, height: 60, width:100, fit:BoxFit.cover),
          borderRadius: BorderRadius.circular(10),
          ),
        Container(
          alignment: Alignment.center,
          height: 60, 
          width:100,
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Text(title,style: TextStyle(color:Colors.white,fontWeight: FontWeight.w600,fontSize: 16),))
      ],
    ));
  }
}
