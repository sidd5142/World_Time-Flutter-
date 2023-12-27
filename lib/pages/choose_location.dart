import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Asia/Kolkata', location: 'India', flag: 'https://e1.pxfuel.com/desktop-wallpaper/323/985/desktop-wallpaper-ind-flag-png-indian-flag-logo.jpg'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'https://www.flagcolorcodes.com/images/webp/athens.webp'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'https://w7.pngwing.com/pngs/378/762/png-transparent-flag-of-england-flag-of-the-united-kingdom-flag-of-the-city-of-london-england-angle-english-flag.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'https://w7.pngwing.com/pngs/692/343/png-transparent-flag-of-egypt-cairo-national-flag-flag-of-lebanon-indian-flag-miscellaneous-flag-text.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'https://www.shutterstock.com/image-vector/kenya-flag-260nw-425122402.jpg'),
    WorldTime(url: 'America/New_York', location: 'New_York', flag: 'https://upload.wikimedia.org/wikipedia/commons/a/a8/Flag_of_New_York.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'https://upload.wikimedia.org/wikipedia/commons/a/a8/Flag_of_New_York.png'),
    WorldTime(url: 'Asia/Jakarata', location: 'Jakarata', flag: 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c7/Jakarta_Flag.png/1280px-Jakarta_Flag.png'),
  ];

  @override
  Widget build(BuildContext context) {
    print("build function ran");
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: Text("Choose Location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 1.0 , horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  print(locations[index].location);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage('${locations[index].flag}'),
                ),
              ),
            ),
          );
      }
      ),
      );
  }
}
