import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greenpen/bloc/album_bloc.dart';
import 'package:greenpen/model/album.dart';
import 'package:greenpen/ui/facewash.dart';

class FaceMassage extends StatefulWidget {
  const FaceMassage({Key key}) : super(key: key);

  @override
  _FaceMassageState createState() => _FaceMassageState();
}

class _FaceMassageState extends State<FaceMassage> {
  List<Album>albumList=[];
  AlbumBloc albumBloc = AlbumBloc();
  ScrollController _controller = ScrollController();
  bool isLoading=false;
  List<String> imageList = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIt4Q0VOjUFneCcGNP3g9YWFZ1Guk3mQbjJQ&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqCN8PM4CErA21v510IzAPaZHOE-goO2ZCXg&usqp=CAU",
    "https://img.freepik.com/free-photo/spa-massage-concept-herbal-compress-ball-cream-flower-soap-scented-candle_73344-3118.jpg?size=626&ext=jpg"
  ];
  @override
  void initState() {
    albumBloc.fetchAlbumsListData();
    _controller.addListener(() {
      if (_controller.offset == _controller.position.maxScrollExtent
          ) {
        setState(() {
          isLoading=true;
          albumList.add(Album(id: 1,userId: 1,title: ""),);
        });
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
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 150.0,
              autoPlay: true,

            ),
            items: imageList.map((value) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(color: Colors.amber),
                      child: Image.network(
                        value,
                        fit: BoxFit.fill,
                      ));
                },
              );
            }).toList(),
          ),
          Row(
            children: [
              Expanded(child: Text("Face Massage")),
              Text("Filter"),
              IconButton(
                icon: Icon(Icons.filter_alt_rounded),
                onPressed: () {},
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          StreamBuilder(
            stream: albumBloc.getAlbums,
            builder: (context, AsyncSnapshot<List<Album>> snapshot) {
              albumList=snapshot.data;
              if (snapshot.hasData) {
                return Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      controller: _controller,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return Card(
                            elevation: 5,
                            child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(20)),
                                child: IntrinsicHeight(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Stack(
                                          children: [
                                            Container(
                                              height: 100,
                                              child: ClipRRect(
                                                borderRadius:
                                                BorderRadius.all(
                                                    Radius.circular(5)),
                                                child: Image.network(
                                                  "https://goodspaguide.co.uk/images/uploads/Summer_Candles_.jpg",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                                left: 10,
                                                bottom: 10,
                                                child: Container(
                                                  width: 40,
                                                  height: 15,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          200),
                                                      color: Colors.pink),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .center,
                                                      children: [
                                                        Text(
                                                          "*",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .yellow),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Center(
                                                            child: Text(
                                                                "4.5",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                    10,
                                                                    color: Colors
                                                                        .white))),
                                                      ],
                                                    ),
                                                  ),
                                                ))
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              right: 15, bottom: 10),
                                          child: Column(
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "AnjiReddy",
                                                      style: TextStyle(
                                                          fontWeight:
                                                          FontWeight
                                                              .bold),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "anjireedyy.avula@gmail.com",
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "10.00 Am - 2.00 Pm",
                                                      style: TextStyle(
                                                          color:
                                                          Colors.green,
                                                          fontSize: 12),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.location_pin,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                    Expanded(
                                                        flex: 1,
                                                        child: Text(
                                                          "2.5 km",
                                                          style: TextStyle(
                                                              fontSize: 10),
                                                        )),
                                                    SizedBox(
                                                      width: 25,
                                                    ),
                                                    Expanded(
                                                      child: MaterialButton(
                                                        color: Colors.pink,
                                                        onPressed: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                      FaceWash()));
                                                        },
                                                        child: Text(
                                                          "Book",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white,
                                                              fontSize: 12),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )));
                      }),
                );
              }
              if (!snapshot.hasError) {
                return Text("Data loaded wait sometime");
              }
              return CircularProgressIndicator();
            },
          ),
        ],
      ),
    );
  }
}
