import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'dart:convert';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  // void getData() async {
    // await Future.delayed(Duration(seconds: 3), () {
    //   print("Jogi");
    // });
    //
    // // simulate network request for bio of username
    // Future.delayed(Duration(seconds: 2), () {
    //   print("Bhopendra");
    // });

    /* api control :-
     Uri url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
    Response response = await get(url);
    print(response.body);

    Map data = jsonDecode(response.body);
    print(data);
    print(data['title']);*/

  // String time = 'Loading';

  void setupWorldTime() async{
    WorldTime instance = WorldTime(location: 'Kolkata', flag: 'germany.png', url: 'Asia/Kolkata');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDayTime,
    });
    // print(instance.time);
    // setState(() {
    //   time = instance.time;
    // });
  }

  @override
  void initState() {
    super.initState();
    // getData();
    setupWorldTime();
    print("initState function ran");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 90.0,
        ),
      ),
    );
  }
}
