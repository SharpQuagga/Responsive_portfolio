import 'package:flutter/material.dart';
import 'domino_reveal.dart';
import 'package:url_launcher/url_launcher.dart';

_launchURL(url) async {
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
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
              child: DominoReveal(
            child: Text(
              "Contact Me",
              style: TextStyle(
                  fontSize: 30,
                  fontFamily: "MeriendaOne",
                  fontWeight: FontWeight.bold),
            ),
          )),
          DominoReveal(
            child: Container(
              //  margin: EdgeInsets.all(8),
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width / 1.2,
              child: Image(
                image: AssetImage("assets/images/s.gif"),
              ),
            ),
          ),
          //  Spacer(flex: 2,),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
          ),
          Container(
            child: Text(
              'Would 💕 to hear from you',
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: "MeriendaOne",
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
          ),
          DominoReveal(
            child: Container(
              alignment: Alignment.center,
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
                        _launchURL(
                            "https://www.linkedin.com/in/darsbir-singh-b58a41127/");
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
                        _launchURL(
                            "https://www.linkedin.com/in/darsbir-singh-b58a41127/");
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
          ),
        ],
      ),
    );
  }
}
