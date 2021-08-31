import 'dart:ffi';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greenpen/bloc/album_bloc.dart';
import 'package:greenpen/model/album.dart';
import 'package:greenpen/ui/facemassage.dart';
import 'package:greenpen/ui/facewash.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(

        drawer: Drawer(),
        appBar: AppBar(
          bottom: TabBar(tabs: [
            Tab(text: "FaceMassage",),
            Tab(text: "Beauty",),
          ],),
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          title: Text(
            "Top Categories",
            style: TextStyle(color: Colors.black),
          ),

        ),
        body:
        TabBarView(children: [
          FaceMassage(),FaceWash()
        ],)
      ),
    );
  }


}
