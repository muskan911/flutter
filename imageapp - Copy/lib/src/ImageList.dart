import 'package:flutter/material.dart';
import 'ImageModel.dart';
import 'photodetail.dart';

class ImageList extends StatelessWidget{

  List<ImageModel> image;

  ImageList(this.image);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: image.length,
        itemBuilder: (context, int index) {
          return buildImage(context, image[index]);
        }
    );
  }

  Widget buildImage(context, ImageModel im){

    return FlatButton(
      child:Container(
        child: Column(
          children: <Widget>[
            Image.network(im.media.m),
            Padding(
              padding: EdgeInsets.only(
                  bottom: 8.0
              ),
            ),
            Text(im.title)
          ],
        ),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey)
        ),
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.all(10.0),
      ),
      onPressed: (){
        Navigator.push(context,
            new MaterialPageRoute(builder: (context) =>PhotoDetails(im)));
      },
    );

  }

}