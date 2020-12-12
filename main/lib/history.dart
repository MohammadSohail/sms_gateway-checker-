import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


// ignore: camel_case_types, must_be_immutable
class History extends StatefulWidget {
   String number;
   String message;
   String timer;
   History(String number, String message, String timer) {this.number = number; this.message = message; this.timer = timer;}

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  // var list = [
  //   {'id':"123123","date":"20/08/2016", "status" : "true"},{'id':"123124","date":"26/08/2016","status" : "true"},{'id':"123125","date":"26/08/2016","status" : "false"}
  // ];

  // _loadData() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   return pref.getString("number");
  // }
  //
  // _save() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   setState(() {
  //     pref.setString("number", widget.number);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        ],
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
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          //for(var item in list )
            Card(
              child: ListTile(
                leading: Icon(Icons.history),
                title: Text(widget.number),
                subtitle: Text(widget.message),
                trailing: Icon(Icons.done)
              ))
        ],
      ),
        ),
    );
  }
}
