import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

class WallpaperView extends StatefulWidget {
  final String imgUrl;
  WallpaperView({@required this.imgUrl});
  @override
  _WallpaperViewState createState() => _WallpaperViewState();
}

class _WallpaperViewState extends State<WallpaperView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Hero(
            tag: widget.imgUrl,
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  widget.imgUrl,
                  fit: BoxFit.cover,
                )),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0x36ffffff), Color(0x0fffffff)])),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      _save();
                    },
                    child: Stack(children: <Widget>[
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                            color: Color(0xff1C1B1B).withOpacity(0.8),
                            border: Border.all(color: Colors.white60, width: 1),
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width / 2,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white60, width: 1),
                            borderRadius: BorderRadius.circular(30)),
                        child: Column(children: <Widget>[
                          Text(
                            "SET WALLPAPER",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "Image will be saved in gallery",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ]),
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Cancel",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ]),
          ),
        ],
      ),
    );
  }

  _save() async {
    await _askPermission();
    var response = await Dio()
        .get(widget.imgUrl, options: Options(responseType: ResponseType.bytes));
    final result =
        await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    print(result);
    Navigator.pop(context);
  }

  _askPermission() async {
    if(Platform.isAndroid){
      await _askPermission();
    }
    if (Platform.isIOS) {
      /*Map<PermissionGroup, PermissionStatus> permissions =
          */
      await PermissionHandler().requestPermissions([PermissionGroup.photos]);
    } else {
      /* PermissionStatus permission = */ await PermissionHandler()
          .checkPermissionStatus(PermissionGroup.storage);
    }
  }
}
