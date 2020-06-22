import 'package:flutter/material.dart';
import 'importts.dart';
import 'package:url_launcher/url_launcher.dart';

_launchURL(url) async {
  // const url = 'https://flutter.dev';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class Introo extends StatefulWidget {
  @override
  _IntrooState createState() => _IntrooState();
}

class _IntrooState extends State<Introo> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical, child: _firstPageIntro()));
  }
}

class _firstPageIntro extends StatefulWidget {
  const _firstPageIntro({
    Key key,
  }) : super(key: key);

  @override
  __firstPageIntroState createState() => __firstPageIntroState();
}

class __firstPageIntroState extends State<_firstPageIntro>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var wid = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // SizedBox(
          //   height: MediaQuery.of(context).size.height * 0.03,
          // ),
          Center(
            child: DominoReveal(
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/qq.png'),),
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: Colors.orange[300],
                      style: BorderStyle.solid,
                      width: 3),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.brown,
                        offset: Offset(10, 10),
                        blurRadius: 10.0)
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          DominoReveal(
            child: Text(
              "Hello, I am",
              style: (TextStyle(
                fontFamily: "MeriendaOne",
                fontSize: 15,
              )),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          DominoReveal(
            child: Text(
              "Darsbir Singh",
              style: (TextStyle(
                  fontSize: 19,
                  fontFamily: "MeriendaOne",
                  fontWeight: FontWeight.bold)),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          DominoReveal(
            child: Text(
              "Android and Flutter Developer",
              style: (TextStyle(
                fontSize: 15,
                fontFamily: "MeriendaOne",
              )),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          DominoReveal(
            child: Text(
              "Aspiring Data Scientist",
              style: (TextStyle(
                fontSize: 15,
                fontFamily: "MeriendaOne",
              )),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          DominoReveal(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  elevation: 10,
                  textColor: Colors.white,
                  highlightColor: Colors.amber,
                  hoverColor: Colors.orange[300],
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                  onPressed: () {
                    _launchURL('https://www.linkedin.com/in/darsbir-singh-b58a41127/');
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  color: Colors.orange[600],
                  child: Text(
                    "Hire Me",
                    style: TextStyle(
                      fontFamily: "MeriendaOne",
                    ),
                  ),
                ),
                Container(
                  width: 17,
                  color: Colors.transparent,
                ),
                GestureDetector(
                    onTap: () {
                      _launchURL(
                          "https://drive.google.com/open?id=1Cj5XrhtxBieWXA5_AP_MYrn0Y4NeNkSu");
                    },
                    child: Text("Resume",
                        style: TextStyle(
                          fontFamily: "MeriendaOne",
                          fontSize: 15,
                          // color: Colors.black
                        ))),
                // Expanded(flex: 2,child: Container(color: Colors.transparent,),)
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          DominoReveal(
            child: Row(
              children: <Widget>[
                Text("Connect With Me",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: "MeriendaOne",
                    )),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                    onTap: () {
                      _launchURL("https://www.facebook.com/Darsbir.Singh");
                    },
                    child: Image(
                      image: AssetImage("assets/images/facebook.png"),
                      width: wid * 0.05,
                    )),
                SizedBox(
                  width: 8,
                ),
                GestureDetector(
                    onTap: () {
                      _launchURL(
                          "https://www.linkedin.com/in/darsbir-singh-b58a41127/");
                    },
                    child: Image(
                      image: AssetImage("assets/images/instagram.png"),
                      width: wid * 0.05,
                    )),
                SizedBox(
                  width: 8,
                ),
                GestureDetector(
                    onTap: () {
                      _launchURL(
                          "https://www.linkedin.com/in/darsbir-singh-b58a41127/");
                    },
                    child: Image(
                      image: AssetImage("assets/images/linkedin.png"),
                      width: wid * 0.05,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
