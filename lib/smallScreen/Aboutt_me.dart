import 'package:flutter/material.dart';
import 'importts.dart';
import 'package:url_launcher/url_launcher.dart';

_launchURL(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class Aboutt extends StatefulWidget {
  @override
  _AbouttState createState() => _AbouttState();
}

class _AbouttState extends State<Aboutt> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: 20),
            // height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                ),
                DominoReveal(
                  child: Text(
                    "About Me",
                    style: TextStyle(
                        fontFamily: "MeriendaOne",
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 16),
                ),
                DominoReveal(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    height: MediaQuery.of(context).size.height / 2.5,
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(40),
                      // border: Border.all(
                      //     color: Colors.orange[300],
                      //     style: BorderStyle.solid,
                      //     width: 3),
                      // boxShadow: [
                      //   BoxShadow(
                      //       color: Colors.brown,
                      //       offset: Offset(10, 10),
                      //       blurRadius: 10.0)
                      // ],
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/images/qw.png"),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 6.5,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 12),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: DominoReveal(
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontFamily: "MeriendaOne",
                              color: Colors.black,
                              fontSize: 15,
                            ),
                            children: <TextSpan>[
                              TextSpan(text: "Hi! I am"),
                              TextSpan(
                                  text: " Darsbir Singh.",
                                  style: TextStyle(
                                    fontFamily: "MeriendaOne",
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  )),
                              TextSpan(
                                  text:
                                      " I am a Mobile and Web Developer with experience in developing real world applications.I have the necessary skills and knowledge to manage a project. I like to code and I am very passionate about Flutter."),
                              TextSpan(
                                  text:
                                      " I am 20 years old and currently studying Computer science and engineering from"),
                              TextSpan(
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontFamily: "MeriendaOne",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                  text:
                                      " Guru Nanak Dev Engineering College, Ludhiana."),
                              TextSpan(
                                  text:
                                      " I like to read books and I am keen to learn new things.")
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 12),
                    ),
                    DominoReveal(
                      child: RaisedButton(
                        elevation: 10,
                        textColor: Colors.white,
                        highlightColor: Colors.amber,
                        hoverColor: Colors.orange[300],
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                        onPressed: () {
                          _launchURL(
                              'https://www.linkedin.com/in/darsbir-singh-b58a41127/');
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        color: Colors.orange[600],
                        child: Text(
                          "Read More",
                          style: TextStyle(
                            fontFamily: "MeriendaOne",
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
      ),
    );
  }
}
