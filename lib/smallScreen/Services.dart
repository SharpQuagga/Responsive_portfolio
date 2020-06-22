import 'package:flutter/material.dart';
import 'importts.dart';
// import 'package:responsive_site2/profiles_page.dart';
// import 'Bblue_painter.dart';
class Servvices extends StatefulWidget {
  @override
   _ServvicesState createState() => _ServvicesState();
}
class _ServvicesState extends State<Servvices> {
   @override
   Widget build(BuildContext context) {
    var wid = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 20),
            // height: MediaQuery.of(context).size.height,
            // width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                DominoReveal(
        child: Text(
          "Services Offered",
          style: TextStyle(
              fontSize: 30,
              // color: Colors.black,
              fontFamily: "MeriendaOne",
              fontWeight: FontWeight.bold),
        ),
                ),
                Container(
        width: wid,
        padding: EdgeInsets.symmetric(vertical: wid*0.02, horizontal: wid*0.002),
        // margin: EdgeInsets.symmetric(horizontal: 10),
        color: Colors.transparent,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          reverse: true,
          child: DominoReveal(
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.center,
              spacing: 10,
              children: <Widget>[
                _dabbeMainDabba(
                    context,
                    "Android Development",
                    "Android software development is the process by which new applications are created for devices running the Android operating system.",
                    0,
                    "assets/images/android.png"),
                _dabbeMainDabba(
                    context,
                    "Flutter Development",
                    "Flutter is an open-source mobile application development framework created by Google to develop applications for Android and iOS.",
                    0,
                    "Flutter"),
                _dabbeMainDabba(
                    context,
                    "Web Development",
                    "Web development is the work involved in developing a web site for the Internet or an intranet.",
                    0,
                    "Flutter"),
                _dabbeMainDabba(
                    context,
                    "Data Science",
                    "Data science is a field that uses scientific processes, algorithms and systems to extract knowledge and insights from data.",
                    0,
                    "assets/images/python.png"),
              ],
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


Container _dabbeMainDabba(
    BuildContext context, String head, String bdy, int _size, String img) {
  return Container(
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
    // width: MediaQuery.of(context).size.width / 1.5,
    // height: MediaQuery.of(context).size.height / 2.5,
    width: 330,
    height: 200,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.orange[300],
        boxShadow: [
          BoxShadow(
              color: Colors.brown, offset: Offset(10, 10), blurRadius: 10.0)
        ]),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
        width:  50,
        height: 50,
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(5),
        child: Center(
          child: img == "Flutter"
              ? FlutterLogo(
                  // colors: Colors.orange,
                  size: 30,
                )
              : Image(
                  image: AssetImage(img),
                  colorBlendMode: BlendMode.colorBurn,
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                  width:  30,
                  height: 30,
                ),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        ),
          ),
        SizedBox(
          height: 20,
        ),
        Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Text(
            head,
            softWrap: true,
            overflow: TextOverflow.fade,
            style: TextStyle(
                // color: Colors.white,
                fontSize: 20,
                fontFamily: "MeriendaOne",
                // fontSize: wid * 0.04,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 5,
        ),
       Flexible(
         flex: 2,
         fit: FlexFit.tight,
            child: SingleChildScrollView(
                          child: Text(
                bdy,
                softWrap: true,
                overflow: TextOverflow.fade,
                // maxLines: 5,
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "MeriendaOne",
                    // fontSize: wid*0.03,
                    // color: Colors.white,
                    ),
              ),
            ),
          ),
      ],
    ),
  );
    }