import "package:flutter/material.dart";

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        title:Text("HORIZONS",style: TextStyle(
          color:Colors.black87
        ),),

      ),
      body: Container(
        child: Column(
          children:<Widget>[
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.symmetric(horizontal:16),
        decoration: BoxDecoration(
          color:Color(0xfff5f8fd),
          borderRadius: BorderRadius.circular(16)
        ),
              child: Row(
                children:<Widget>[
                  Expanded(
                           child: TextField(
                      decoration: InputDecoration(
                        hintText: "search"
                      ),
                    ),
                  ),
                  GestureDetector(
                    child:Icon(
                      Icons.search
                    )
                  ),
                ]
              ),
            ),
          ]
        ),
      ),
    );
  }
}