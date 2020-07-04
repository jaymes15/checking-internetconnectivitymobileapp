import 'dart:async';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(HomePage());
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//check internet connection
//  void checkcon () async{
//    try{
//      final result = await InternetAddress.lookup('www.google.com');
//      if(result.isNotEmpty &&  result[0].rawAddress.isNotEmpty){
//        print("connected");
//      }
//    } on SocketException catch(_){
//      print("not connected");
//    }
//  }

// mobile or wifi connectivity
//  void checkcon () async{
//    var connresult = await(Connectivity().checkConnectivity());
//    if(connresult == ConnectivityResult.none){
//      print("not connected");
//    }
//    else if(connresult == ConnectivityResult.mobile){
//      print("Mobile");
//    }
//    else if (connresult == ConnectivityResult.wifi){
//      print("wifi");
//    }
//  }

ConnectivityResult oldres;
StreamSubscription connectivitystream;


@override
void initState(){
  super.initState();

  connectivitystream = Connectivity().onConnectivityChanged.listen((ConnectivityResult resnow){
    if(resnow == ConnectivityResult.none){
      print("No connection");
    }else if (oldres ==ConnectivityResult.none){
      print("connected");
    }
    oldres = resnow;
  });
}

@override
void dispose(){
  super.dispose();

  connectivitystream.cancel();
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home:Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Internet Connectivity",
              style: TextStyle(
                fontSize: 30.0,
                fontFamily: "Times New Roman",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40.0),
              child: RaisedButton(
                onPressed: (){},
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
                child: Text(
                  "Check !",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}
