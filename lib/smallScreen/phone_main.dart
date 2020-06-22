import 'package:flutter/material.dart';
import 'importts.dart';

class Activity extends StatefulWidget {
  @override
   _ActivityState createState() => _ActivityState();
}
class _ActivityState extends State<Activity> {

  int _selectedPage = 0;
  final pageOptions = [
          Introo(),
           Aboutt(),
           Servvices(),
           Prrjects(),
           ContactMe(),
  ];

   @override
   Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       home: Scaffold(
         bottomNavigationBar: BottomNavigationBar(
           currentIndex: _selectedPage,
          selectedLabelStyle: TextStyle(fontSize: 13),
           elevation: 30,
           unselectedItemColor: Colors.grey,
           selectedItemColor: Colors.deepOrange[300],
           selectedFontSize: 10,
           onTap: (int index){
             setState(() {
               _selectedPage = index;
             });
           },
           items: [
             BottomNavigationBarItem(
               icon: Icon(Icons.home),
               title: Text("Home"),
             ),
             BottomNavigationBarItem(
               icon: Icon(Icons.people),
               title: Text("About Me")
             ),
             BottomNavigationBarItem(
               icon: Icon(Icons.apps),
               title: Text("Services")
             ),
             BottomNavigationBarItem(
               icon: Icon(Icons.message),
               title: Text("Projects")
             ),
             BottomNavigationBarItem(
               icon: Icon(Icons.portrait),
               title: Text("Contact Me")
             ),
           ],
         ),
         body: pageOptions[_selectedPage]
       ),
    );
  }
} 

