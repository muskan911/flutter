import 'package:flutter/material.dart';
import 'ImageModel.dart';

class PhotoDetails extends StatelessWidget{

  ImageModel image;

  PhotoDetails(this.image);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              FlatButton(
                child: Icon(Icons.arrow_back),
                onPressed: (){
                  Navigator.pop(context);
                },
              )
            ],
            title: Text("Details"),
          ),
          body:ListView.builder(itemCount: 1,
              itemBuilder: (context, int index){
                return Container(
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey)
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(image.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic
                      )),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                      ),
                      Image.network(image.media.m.replaceFirst("_m.", "_b."),
                      fit: BoxFit.fill,),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                      ),
                      Text("Date ${image.date_taken}"
                          ,style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.italic
                      )),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                      ),
                      Text("Link ${image.link}",
                          style: TextStyle(
                              fontWeight: FontWeight.w200,
                              fontStyle: FontStyle.italic
                          )),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                      ),
                      Text("Author ${image.author}",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.italic
                          ))
                    ],
                  ),
                );
              }
          ),  
      ),
    );
  }

  Widget buildWidget(){}

}