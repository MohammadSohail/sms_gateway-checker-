import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class History extends StatefulWidget {
  String id;
  History({this.id});
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
        ),
        iconTheme: IconThemeData(
            color: Colors.black
        ),
        centerTitle: true,
        backgroundColor: Colors.yellow,
        title: Text('History',
          style: TextStyle(
            fontSize: 30,
            color: Colors.black,
          ),),
      ),
      body: Column(
        children: [
          RaisedButton(
            child:Text("Home"),
            onPressed: (){
              Navigator.pop(context);
            },
          )
        ],
      ),
        ),
    );
  }
}
