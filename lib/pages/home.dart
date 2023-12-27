import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    // if (ModalRoute.of(context)?.settings.arguments != null) {
      data = data.isNotEmpty? data : ModalRoute.of(context)!.settings.arguments as Map;
      // print(data);
    // } else {
    //   print("No data received");
    // }    print(data);

    // set backgroung
    String bgimage = data['isDaytime'] ? 'https://e7.pngegg.com/pngimages/108/729/png-clipart-sky-sky-white-and-blue-sky-blue-atmosphere-thumbnail.png' : 'https://w7.pngwing.com/pngs/403/260/png-transparent-outer-space-sky-blue-night-star-purple-blue-other-thumbnail.png';
    Color? bgcolor = data['isDaytime'] ? Colors.blue : Colors.indigo[900];

    return Scaffold(
      backgroundColor: bgcolor,
        body: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('$bgimage'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 120.0, 0 , 0),
                   child: Column(
                  children: [
                    TextButton.icon(
                        onPressed: () async {
                         dynamic result = await Navigator.pushNamed(context, '/location');
                         setState(() {
                           data = {
                             'time': result['time'],
                             'location': result['location'],
                             'isDaytime': result['isDaytime'],
                             'flag': result['flag'],
                           };
                         });
                        },
                        icon: Icon(
                            Icons.edit_location,
                          color: Colors.grey[300],
                        ),
                        label: Text(
                            "Edit Location",
                          style: TextStyle(
                            color: Colors.grey[300],
                          ),
                        ),
                    ),
                    SizedBox(height: 20.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          data['location'],
                          style: TextStyle(
                            fontSize: 28.0,
                            letterSpacing: 1.5,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20.0,),
                    Text(
                      data['time'],
                      style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
     ),
    );
  }
}
