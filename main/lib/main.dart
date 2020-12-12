
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:analog_clock/analog_clock.dart';
import 'package:tutorial_flutter/history.dart';
import 'package:flutter/cupertino.dart';


void main() {
  runApp(MaterialApp(
    title: 'MyApp',
    // MaterialApp contains our top-level Navigator
    initialRoute: '/',
    routes: {
      '/': (BuildContext context) => MyApp(),
      '/history': (BuildContext context) => History("", "", ""),
    },
  ));
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // @override
  // void initState(){
  //   super.initState();
  // }
  //Create a text controller and use it to retrieve the current value
  //   // of the TextField.
  final num = TextEditingController();
  final msg = TextEditingController();
  final tmr = TextEditingController();

  var currentTime = "";
  var history = new List();

 void tmp() {
   // Timer.periodic(Duration(seconds: 2), (timer) => setState(() {
   //      print('Hello from server');
   //       //print(DateTime.now())
   //    }));
  }
  // void _getTime() {
  //   var currentTime = DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());
  //   setState(() {
  //     _timeString = currentTime;
  //   });
  // }

  Future callService() async
  {
    HttpClient client = new HttpClient();
    client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);

    //String url = "https://alphasms.biz/index.php?app=ws&u=Sohail&h=f6d9aec95bb9c4e46dc7265a22a87b4d&op=pv&to=${num.text}&msg=${msg.text}";
    String url1 = "https://jobxprss.com/api/send/app_link/";
     currentTime = DateFormat('dd-MM-yyyy – kk:mm').format(DateTime.now());
    //print(msg.text + "\n Created at: " + currentTime);
    history.add({
      "number" : num.text,
      "message" : msg.text + " Created at: " + currentTime,
      "timer" : tmr.text
    });
    print(history);
    var tim = int.parse(tmr.text);
    try {
      http.Response res = await http.get(
          //Timer.periodic(Duration(seconds: tim), (timer) => setState(() {
            Uri.encodeFull(url1),
          //})),
          headers: {
            "Accept" : "Application/json"
          }
      );
      print(json.decode(res.body));
    } on Exception catch (e) {
      print(e);
    }
  }


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    num.dispose();
    msg.dispose();
    tmr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final history = ModalRoute.of(context).settings.arguments;
    return new Builder(
        builder: (ctx) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('SMS Gateway_Checker', style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),),
          backgroundColor: Colors.yellow,
        ),
        body: SafeArea(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: num,
                    decoration: InputDecoration(
                        hintText: 'Phone Number',
                        border: OutlineInputBorder(),
                        icon: Icon(Icons.phone)
                    ),
                  ),
                  TextFormField(
                    controller: msg,
                    decoration: InputDecoration(
                        hintText: 'Message',
                        border: OutlineInputBorder(),
                        icon: Icon(Icons.message)
                    ),
                  ),
                  TextFormField(
                    controller: tmr,
                    decoration: InputDecoration(
                        hintText: 'Timer',
                        border: OutlineInputBorder(),
                        icon: Icon(Icons.timer_sharp)
                    ),
                  ),
                  RaisedButton(
                    onPressed: callService,
                    child: Text('Send Message',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)
                    ),
                  ),
                  RaisedButton(
                    child: Column(
                      children: [
                        Text("History", style: TextStyle(fontSize: 20),),
                      ],
                    ),
                    onPressed: () {
                      //Route route = MaterialPageRoute(builder: (context) => History());
                      //Navigator.pushNamed(context, '/history');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                            new History(num.text, msg.text + '  Created At: ' + currentTime, tmr.text),
                          ));
                    },
                    textColor: Colors.black,
                  ),
                  SizedBox(height: 25.0,),
                  Center(
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Current Server Time:",
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),

                  Center(
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          DateFormat('dd-MM-yyyy – kk:mm').format(
                              DateTime.now()),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  //###############################
                  // SizedBox(
                  //   height: 200,
                  //   child: ListView(
                  //     scrollDirection: Axis.vertical,
                  //     children: <Widget>[
                  //       Text("History",
                  //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
                  //     ],
                  //   ),
                  // ),
                  //#################################
                ],
              ),
            ),
          ),


        ),
      ),
    );
  }
    );
  }
}