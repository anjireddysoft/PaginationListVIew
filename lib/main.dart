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
  AlbumBloc albumBloc = AlbumBloc();
  TabController tabController;
  ScrollController _controller = ScrollController();
  List<String> imageList = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIt4Q0VOjUFneCcGNP3g9YWFZ1Guk3mQbjJQ&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqCN8PM4CErA21v510IzAPaZHOE-goO2ZCXg&usqp=CAU",
    "https://img.freepik.com/free-photo/spa-massage-concept-herbal-compress-ball-cream-flower-soap-scented-candle_73344-3118.jpg?size=626&ext=jpg"
   ];
  @override
  void initState() {
    albumBloc.fetchAlbumsListData();

    _controller.addListener(() {
      if (_controller.offset >= _controller.position.maxScrollExtent &&
          !_controller.position.outOfRange) {
        showToast("Reach the bottom");
      }
      if (_controller.offset <= _controller.position.minScrollExtent &&
          !_controller.position.outOfRange) {
        showToast("Reach the top");
      }
    });
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

  showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
