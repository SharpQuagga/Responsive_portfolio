import 'package:flutter/material.dart';
import 'domino_reveal.dart';
// import 'Bblue_painter.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'importts.dart';
// import 'package:responsive_site2/profiles_page.dart';
// import 'dart:html' as html;

_launchURL(url) async {
  // const url = 'https://flutter.dev';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class ContactMe extends StatefulWidget {

  @override
  _ContactMeState createState() => _ContactMeState();
}

class _ContactMeState extends State<ContactMe> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              //  SizedBox(height: MediaQuery.of(context).size.height/9,),
              Padding(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height / 15),
        child: Container(
          margin: EdgeInsets.only(right: 10),
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.topRight,
          child: Icon(Icons.mode_comment,size: 40,),
        ),
              ),
              Center(
          child: DominoReveal(
                          child: Text(
        "Contact Me",
        style: TextStyle(fontSize: 30,fontFamily: "MeriendaOne",fontWeight: FontWeight.bold),
              ),
          )),
              DominoReveal(
                  child: Container(
          //  margin: EdgeInsets.all(8),
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width /1.2,
          child: Image(image: AssetImage("assets/images/s.gif"),),
        ),
              ),
              //  Spacer(flex: 2,),
              Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
              ),
              DominoReveal(
                  child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            GestureDetector(
                onTap: () {
                  _launchURL("https://www.facebook.com/Darsbir.Singh");
                },
                child: Image(
                  image: AssetImage("assets/images/facebook.png"),
                  width: 35,
                )),
            SizedBox(
              width: 20,
            ),
            GestureDetector(
                onTap: () {
                  _launchURL("https://www.facebook.com/Darsbir.Singh");
                },
                child: Image(
                  image: AssetImage("assets/images/twitter.png"),
                  width: 35,
                )),
            SizedBox(
              width: 20,
            ),
            GestureDetector(
                onTap: () {
                  _launchURL("http://github.com/SharpQuagga");
                },
                child: Image(
                  image: AssetImage("assets/images/github.png"),
                  width: 35,
                )),
            SizedBox(
              width: 20,
            ),
            GestureDetector(
                onTap: () {
                  _launchURL("https://www.linkedin.com/in/darsbir-singh-b58a41127/");
                },
                child: Image(
                  image: AssetImage("assets/images/instagram.png"),
                  width: 35,
                )),
            SizedBox(
              width: 20,
            ),
            GestureDetector(
                onTap: () {
                  _launchURL("https://www.linkedin.com/in/darsbir-singh-b58a41127/");
                },
                child: Image(
                    image: AssetImage("assets/images/linkedin.png"),
                    width: 35)),
            SizedBox(
              width: MediaQuery.of(context).size.width / 8,
            ),
          ],
        ),
              ),
            ],
          ),
      ),
    );
  }
}
