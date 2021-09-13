
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greenpen/bloc/album_bloc.dart';
import 'package:greenpen/model/album.dart';
import 'package:greenpen/model/comic.dart';

import 'package:greenpen/ui/secondscreen.dart';

class FaceMassage extends StatefulWidget {
  const FaceMassage({Key key}) : super(key: key);

  @override
  _FaceMassageState createState() => _FaceMassageState();
}

class _FaceMassageState extends State<FaceMassage> {
  List<Album>albumList=[];
  AlbumBloc albumBloc = AlbumBloc();
   List<ComicModel> comicModel;
  ScrollController _controller = ScrollController();
  bool isLoading=false;

  @override
  void initState() {
    albumBloc.fetchAlbumsListData();
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



          StreamBuilder(
            stream: albumBloc.getAlbums,
            builder: (context, AsyncSnapshot<List<ComicModel>> snapshot) {
           //   albumList=snapshot.data;
              if (snapshot.hasData) {
                return Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      controller: _controller,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        comicModel=snapshot.data;
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondScreen(
                              comicModel: comicModel,
                            )));
                          },
                          child: Card(
                              elevation: 5,
                              child: Container(
padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(20)),
                                  child: IntrinsicHeight(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Stack(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                BorderRadius.all(
                                                    Radius.circular(5)),
                                                child: Image.network(
                                                  snapshot.data[index].img,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),

                                              SizedBox(
                                                width: 5,
                                              ),
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
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        snapshot.data[index].title,
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight
                                                                .bold),
                                                      ),
                                                    ),
                                                    Text(
                                                      "$index",
                                                      style: TextStyle(
                                                          fontWeight:
                                                          FontWeight
                                                              .bold),
                                                    ),
                                                  ],
                                                ),
                                                Expanded(
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          snapshot.data[index].alt,
                                                          style: TextStyle(
                                                              fontSize: 12),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                               /* Expanded(
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
                                                ),*/
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ))),
                        );
                      }),
                );
              }
              if (!snapshot.hasError) {
                return Center(child: CircularProgressIndicator());
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}
