// import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'importts.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class Activity extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return ActivityState();
  }
}

class ActivityState extends State<Activity> with SingleTickerProviderStateMixin{
  String lifeCycle = "";
  TabController tabController;
  int photoIndex=0;

  final PageController controller = PageController(
    initialPage: _currentPage,
  );
  static int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4,vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
        controller: controller,
        scrollDirection: Axis.vertical,
        pageSnapping: false,
        physics: BouncingScrollPhysics(),
        children: <Widget>[
           Introo(),
           Aboutt(),
           Servvices(),
           Prrjects(),
           ContactMe(),
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
   selectedIndex: _currentPage,
   showElevation: true, 
   backgroundColor: Colors.transparent,
   onItemSelected: (index) => setState(() {
              _currentPage = index;
              controller.animateToPage(index,
                  duration: Duration(milliseconds: 300), curve: Curves.ease);
              }),
            items: [
              BottomNavyBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
                activeColor: Colors.deepOrange[300],
              ),
              BottomNavyBarItem(
                icon: Icon(Icons.people),
                title: Text('About'),
                activeColor: Colors.deepOrange[300],
              ),
              BottomNavyBarItem(
                  icon: Icon(Icons.apps),
                  title: Text('Services'),
                  activeColor: Colors.deepOrange[300],
              ),
              BottomNavyBarItem(
                  icon: Icon(Icons.message),
                  title: Text('Projects'),
                  activeColor: Colors.deepOrange[300],
              ),
              BottomNavyBarItem(
                  icon: Icon(Icons.account_circle),
                  title: Text('Contact Me'),
                  activeColor: Colors.deepOrange[300],
              ),
            ],
          ),
              );
            }
          }


          