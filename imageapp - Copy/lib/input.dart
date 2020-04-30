import 'package:flutter/material.dart';
import 'myapp.dart';

class AskInput extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
        title: Text("Enter type of Image"),
        ),
        body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, int index){
            return Forms1();
          },
        ),
      ),
    );
  }

}

class Forms1 extends StatefulWidget {
  @override
  FormsState createState() {
    // TODO: implement createState
    return FormsState();
  }
}

class FormsState extends State<Forms1> {
  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();


  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
        key: _formKey,
        child: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                TextFormField(
                  validator: (value){
                    if(value.isEmpty){
                      return 'Please Enter something';
                    }
                  },
                  controller: myController,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                ),
                Text(
                  "We are taking these photos from flutter public feed."
                      "\n It is advisable to enter some specific thing that you may like to see,"
                      "\n if search criteria left blank it may sometimes produce horrific images.",
                  style: TextStyle(color: Colors.red ,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                ),
                RaisedButton(
                  child: Text("Flutter Search"),
                  onPressed:(){
                    if(_formKey.currentState.validate()){

                      Navigator.push(context,
                          new MaterialPageRoute(builder: (context) =>MyApp(myController.text.toString())));
                    }
                  } ,
                )
              ],
            ),
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.all(10.0),
          ),
        ));
  }
}
