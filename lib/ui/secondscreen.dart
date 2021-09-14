import 'package:flutter/material.dart';
import 'package:greenpen/model/comic.dart';

class SecondScreen extends StatefulWidget {
  final List<ComicModel> comicModel;

  const SecondScreen({Key key, this.comicModel}) : super(key: key);

  @override
  _SecondScreenState createState() =>
      _SecondScreenState(comicModel: comicModel);
}

class _SecondScreenState extends State<SecondScreen> {
  final List<ComicModel> comicModel;
  _SecondScreenState({this.comicModel});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("SecondScreen"),
          leading: IconButton(
            color: Colors.white,
            icon:Icon (Icons.arrow_back),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                Expanded(

                  child: ListView.builder(itemCount:comicModel.length,shrinkWrap:true,itemBuilder: (context,index){
                    return Card(
                      elevation: 5,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Container(
                              child: ConstrainedBox(child: Image.network(comicModel[index].img),constraints: BoxConstraints(minHeight: 200),),
                            ),
                            SizedBox(
                              height: 5,
                            ),

                            ExpansionTile(
                              title: Text(comicModel[index].title),
                              children: [
                                Row(
                                  children: [
                                    Expanded(child: Text(comicModel[index].transcript)),
                                  ],
                                )
                              ],
                              expandedAlignment: Alignment.bottomLeft,
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                )
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: FloatingActionButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                child: Icon(Icons.arrow_back),
                  ),
            ),
            Positioned(
              right: 10,
              bottom: 10,
              child: FloatingActionButton(

                child: Icon(Icons.arrow_forward),
                  ),
            ),
          ],
        ),

      ),
    );
  }
}
