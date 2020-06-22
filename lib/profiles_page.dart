import 'package:flutter/material.dart';
// import '../../../../../../../flutter/packages/flutter/lib/cupertino.dart';
import 'responsive_widget.dart';
// import 'dart:html' as html;
// import 'domino_reveal.dart';
import 'package:url_launcher/url_launcher.dart';
import 'extensions/hover_extensions.dart';
import 'smallScreen/importts.dart';

class ProfilePage extends StatelessWidget {
  //const ProfilePage({Key key}) : super(key: key);

  final PageController controller = PageController(
    initialPage: _currentPage,
  );
  static int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
                centerTitle: true,
                title: _ds(context),
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                actions: <Widget>[
                  _navHeader(context),
                ],
              ),
        body: PageView(
          controller: controller,
          scrollDirection: Axis.vertical,
          children: <Widget>[
            _firstPage(context),
            _secondPage(context),
            _thirdPage(context),
            _Forth(),
            _fifthPage(context)
            // Last(),
          ],
          pageSnapping: false,
          physics: BouncingScrollPhysics(),
        ),
      ),
    );
  }

  AnimatedContainer _firstPage(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.1,
        bottom: MediaQuery.of(context).size.height * 0.05,
      ),
      child: ResponsiveWidget(
        largeScreen: Stack(
          children: <Widget>[
            AnimatedContainer(
              duration: Duration(seconds: 1),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              // color: Colors.yellow,
              // padding: EdgeInsets.only(
              //    left: MediaQuery.of(context).size.width * 0.05),
              child: Row(
                children: <Widget>[
                  Container(
                    //color: Colors.green,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width / 2 -
                        MediaQuery.of(context).size.width * 0.1,
                    child: _firstPageIntro(),
                  ),
                  DominoReveal(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                          color: Colors.orange[300],
                          image: DecorationImage(
                            alignment: Alignment.bottomCenter,
                            image: AssetImage("assets/images/qqq.png"),
                            fit: BoxFit.contain,
                          ),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.zero,
                              topRight: Radius.zero,
                              bottomLeft: Radius.circular(140),
                              bottomRight: Radius.circular(130))),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        // smallScreen: _firstPageIntro(),
        mediumScreen: Row(children: <Widget>[
          _firstPageIntro(),
          Spacer(flex: 1,),
           Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                //backgroundBlendMode: BlendMode.darken,
                image: DecorationImage(
                    image: AssetImage("assets/images/qqq.png"),
                    fit: BoxFit.contain,
                    repeat: ImageRepeat.noRepeat),
                shape: BoxShape.circle,
                border:
                    Border.all(color: Colors.yellow, width: 5),
                // color: Colors.blue,
              ),
            ),
        ],),
      ),
    );
  }

  ResponsiveWidget _navHeader(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Row(
        mainAxisAlignment: ResponsiveWidget.isSmallScreen(context)
            ? MainAxisAlignment.center
            : MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //    DS(),
          //  Spacer(),
          if (!ResponsiveWidget.isSmallScreen(context))
            Row(
              children: <Widget>[
                DNavButton(
                  text: "About me",
                  onPressed: () {
                    controller.animateToPage(1,
                        curve: Curves.easeIn, duration: Duration(seconds: 1));
                  },
                ).showCursorOnHover.moveUpOnHover,
                DNavButton(
                  text: "Work",
                  onPressed: () {
                    controller.animateToPage(2,
                        curve: Curves.easeIn, duration: Duration(seconds: 1));
                  },
                ).showCursorOnHover.moveUpOnHover,
                DNavButton(
                  text: "Portfolio",
                  onPressed: () {
                    controller.animateToPage(3,
                        curve: Curves.easeIn, duration: Duration(seconds: 1));
                  },
                ).showCursorOnHover.moveUpOnHover,
                DNavButton(
                  text: "Contact",
                  onPressed: () {
                    controller.animateToPage(4,
                        curve: Curves.easeIn, duration: Duration(seconds: 1));
                  },
                ).showCursorOnHover.moveUpOnHover,
                SizedBox(
                  width: 50,
                )
              ],
            ),
        ],
      ),
    );
  }

  GestureDetector _ds(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.animateToPage(0,
            curve: Curves.easeIn, duration: Duration(seconds: 1));
      },
      child: Row(
        children: <Widget>[
          Text(
            "Darsbir",
            style: TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontFamily: 'MeriendaOne',
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "Singh",
            style: TextStyle(
              fontSize: 24,
              color: Colors.orange[300],
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Container _fifthPage(BuildContext context) {
    var s_width = MediaQuery.of(context).size.width / 4;
    var s_height = MediaQuery.of(context).size.height / 3;
    return Container(
        //  padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height/3),
        width: MediaQuery.of(context).size.width,
        // height: 100,
        //height: MediaQuery.of(context).size.height/2,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.orange[600], Colors.amberAccent[100]],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ResponsiveWidget(
              largeScreen: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _pdetails(),
                  _myservices(s_height, s_width),
                  _mylinks(s_height, s_width),
                ],
              ),
            )
          ],
        ));
  }

_launchURL(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    print ('Could not launch $url');
  }
}

  DominoReveal _mylinks(s_height, s_width){
    return DominoReveal(
      child: SizedBox(
        width: s_width,
        height: s_height,
        child: FittedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  "Connect with me: ",
                  style: TextStyle(
                      // fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: GestureDetector(
                      onTap: () {
                        const fb = "https://www.facebook.com/Darsbir.Singh";
                        _launchURL(fb);
                        // html.window.open(
                        //     "https://www.facebook.com/Darsbir.Singh",
                        //     "Facebook");
                      },
                      child: Text(
                        "Facebook",
                        style: TextStyle(color: Colors.black),
                      ))),
              Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: GestureDetector(
                      onTap: () {
                        const fb = "https://github.com/SharpQuagga";
                        _launchURL(fb);
                      },
                      child: Text(
                        "Github",
                        style: TextStyle(color: Colors.black),
                      ))),
              Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: GestureDetector(
                      onTap: () {
                        const fb = "https://www.linkedin.com/in/darsbir-singh-b58a41127/";
                        _launchURL(fb);
                      },
                      child: Text("LinkedIn",
                          style:
                              TextStyle(color: Colors.black)))),
              Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: GestureDetector(
                      onTap: () {
                        const fb = "https://www.instagram.com/darsbir_singh/";
                        _launchURL(fb);
                      },
                      child: Text("Instagram",
                          style: TextStyle(
                              // fontSize: 17,
                              // fontFamily: 'Lato-Regular',
                              color: Colors.black)))),
            ],
          ),
        ),
      ),
    );
  }

  DominoReveal _myservices(s_height, s_width) {
    return DominoReveal(
      child: SizedBox(
        width: s_width,
        height: s_height,
        child: FittedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  "Services",
                  style: TextStyle(
                      // fontSize: 20,
                      // fontFamily: 'Lato-Bold',
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Android Apps",
                    style: TextStyle(
                        // fontSize: 17,
                        // fontFamily: 'Lato-Regular',
                        color: Colors.black),
                  )),
              Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "iOS Apps",
                    style: TextStyle(color: Colors.black),
                  )),
              Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text("Mobile Application",
                      style: TextStyle(color: Colors.black))),
              Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text("Web Development",
                      style: TextStyle(color: Colors.black))),
            ],
          ),
        ),
      ),
    );
  }
}

class _firstPageIntro extends StatelessWidget {
  const _firstPageIntro({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print ('Could not launch $url');
    }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
        ),
        DominoReveal(
          child: Text(
            "Hello, I am",
            style: (TextStyle(
              fontSize: 20,
            )),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        DominoReveal(
          child: Text(
            "Darsbir Singh",
            style: (TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        DominoReveal(
          child: Text(
            "Android and Flutter Developer",
            style: (TextStyle(
              fontSize: 20,
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
              fontSize: 20,
            )),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        DominoReveal(
          child: Row(
            children: <Widget>[
              RaisedButton(
                elevation: 10,
                textColor: Colors.white,
                highlightColor: Colors.amber,
                hoverColor: Colors.orange[300],
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                color: Colors.orange[600],
                child: Text("Hire Me").showCursorOnHover.moveUpOnHover,
              ).showCursorOnHover.moveUpOnHover,
              Container(
                width: 17,
                color: Colors.transparent,
              ),
              GestureDetector(
                  onTap: () {
                    const url = "https://drive.google.com/open?id=1Cj5XrhtxBieWXA5_AP_MYrn0Y4NeNkSu";
                    _launchURL(url);
                            // html.window.open(
                    //     "https://drive.google.com/open?id=1Cj5XrhtxBieWXA5_AP_MYrn0Y4NeNkSu",
                    //     "resume");
                  },
                  child: Text("Resume",
                      style: TextStyle(
                          //fontFamily: "Blinker-Regular.ttf",
                          fontSize: 20,
                          color: Colors.black))).showCursorOnHover,
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.transparent,
          ),
        ),
        DominoReveal(
          child: Row(
            children: <Widget>[
              Text("Follow Me",
                  style: TextStyle(color: Colors.black, fontSize: 20)),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                  onTap: () {
                    const fb = "https://www.facebook.com/Darsbir.Singh";
                        _launchURL(fb);
                    // html.window.open(
                    //     "https://www.facebook.com/Darsbir.Singh", "Facebook");
                  },
                  child: Image(
                    image: AssetImage("assets/images/facebook.png"),
                    width: 25,
                  )).showCursorOnHover,
              SizedBox(
                width: 8,
              ),
              GestureDetector(
                  onTap: () {
                    const fb = "https://www.instagram.com/darsbir_singh/";
                      _launchURL(fb);
                    // html.window.open(
                    //     "https://www.linkedin.com/in/darsbir-singh-b58a41127/",
                    //     "Instagram");
                  },
                  child: Image(
                    image: AssetImage("assets/images/instagram.png"),
                    width: 25,
                  )).showCursorOnHover,
              SizedBox(
                width: 8,
              ),
              GestureDetector(
                  onTap: () {
                    const fb = "https://www.linkedin.com/in/darsbir-singh-b58a41127/";
                        _launchURL(fb);
                    // html.window.open(
                    //     "https://www.linkedin.com/in/darsbir-singh-b58a41127/",
                    //     "LinkedIn");
                  },
                  child: Image(
                      image: AssetImage("assets/images/linkedin.png"), width: 25)).showCursorOnHover,
            ],
          ),
        ),
        SizedBox(
          height: 30,
        )
      ],
    );
  }
}

class _pdetails extends StatelessWidget {
  const _pdetails({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DominoReveal(
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 4,
        height: MediaQuery.of(context).size.height / 2,
        child: FittedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    "Darsbir Singh",
                    style: TextStyle(
                        // fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
              Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Address:",
                    style: TextStyle(
                        // fontSize: 17,
                        // fontFamily: 'Lato-Regular',
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
              Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "I-Block, Sarabha Nagar",
                    style: TextStyle(
                        // fontSize: 17,
                        // fontFamily: 'Lato-Regular',
                        color: Colors.black),
                  )),
              Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    "Ludhiana",
                    style: TextStyle(
                        // fontSize: 17,
                        // fontFamily: 'Lato-Regular',
                        color: Colors.black),
                  )),
              Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text("Mobile: ",
                      style: TextStyle(
                          // fontSize: 17,
                          // fontFamily: 'Lato-Regular',
                          fontWeight: FontWeight.bold,
                          color: Colors.black))),
              Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "+91 85578 55866",
                    style: TextStyle(
                        // fontSize: 17,
                        // fontFamily: 'Lato-Regular',
                        color: Colors.black),
                  )),
              Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text("Email: ",
                      style: TextStyle(
                          // fontSize: 17,
                          // fontFamily: 'Lato-Regular',
                          fontWeight: FontWeight.bold,
                          color: Colors.black))),
              Text(
                "darsbiritten@gmail.com",
                style: TextStyle(
                    // fontSize: 17,
                    color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

AnimatedContainer _secondPage(BuildContext context) {

  
_launchURL(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    print ('Could not launch $url');
  }
}

  return AnimatedContainer(
    //  height: MediaQuery.of(context).size.height,
    //  width: MediaQuery.of(context).size.width,
    duration: Duration(seconds: 1),
    margin: EdgeInsets.only(
      top: MediaQuery.of(context).size.height * 0.1,
      left: MediaQuery.of(context).size.width * 0.1,
      // bottom: MediaQuery.of(context).size.height * 0.05,
    ),
    child: ResponsiveWidget(
      largeScreen: AnimatedContainer(
        duration: Duration(seconds: 1),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: <Widget>[
            DominoReveal(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width / 2 -
                    MediaQuery.of(context).size.width * 0.15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/qq.png"),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 7,
            ),
            Column(
              children: <Widget>[
                DominoReveal(
                  child: Text(
                    "About Me",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width / 4 + 50,
                  child: DominoReveal(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                        children: <TextSpan>[
                          TextSpan(text: "Hi! I am"),
                          TextSpan(
                              text: " Darsbir Singh.",
                              style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
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
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
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
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                    onPressed: () {
                      const fb = "https://www.linkedin.com/in/darsbir-singh-b58a41127/";
                        _launchURL(fb);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    color: Colors.orange[600],
                    child: Text("Read More"),
                  ).showCursorOnHover.moveUpOnHover,
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

AnimatedContainer _thirdPage(BuildContext context) {
  return AnimatedContainer(
  duration: Duration(seconds: 1),
  padding: EdgeInsets.only(
      //top: MediaQuery.of(context).size.height * 0.05,
      //bottom: MediaQuery.of(context).size.height * 0.1,
      ),
  child: ResponsiveWidget(
    largeScreen: AnimatedContainer(
      duration: Duration(seconds: 1),
      height: 1.25 * MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child:  Container(
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
        width:  MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical:  MediaQuery.of(context).size.width*0.02, horizontal:  MediaQuery.of(context).size.width*0.002),
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
    // smallScreen: Container(
    //   margin: EdgeInsets.only(top: 20),
    //   height: MediaQuery.of(context).size.height,
    //   width: MediaQuery.of(context).size.width,
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //     mainAxisSize: MainAxisSize.max,
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: <Widget>[
    //       DominoReveal(
    //         child: Text(
    //           "Services",
    //           style: TextStyle(
    //               fontSize: 30,
    //               color: Colors.black,
    //               fontWeight: FontWeight.bold),
    //         ),
    //       ),
    //       Container(
    //         padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    //         margin: EdgeInsets.symmetric(horizontal: 10),
    //         child: SingleChildScrollView(
    //           scrollDirection: Axis.horizontal,
    //           reverse: true,
    //           child: DominoReveal(
    //             child: Row(
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               mainAxisSize: MainAxisSize.max,
    //               children: <Widget>[
    //                 _dabbeMainDabba(
    //                     context,
    //                     "Android Development",
    //                     "Android software development is the process by which new applications are created for devices running the Android operating system.",
    //                     0,
    //                     "assets/images/android.png"),
    //                 Padding(
    //                   padding: EdgeInsets.symmetric(horizontal: 8),
    //                 ),
    //                 _dabbeMainDabba(
    //                     context,
    //                     "Flutter Development",
    //                     "Flutter is an open-source mobile application development framework created by Google to develop applications for Android and iOS.",
    //                     0,
    //                     "Flutter"),
    //                 Padding(
    //                   padding: EdgeInsets.symmetric(horizontal: 8),
    //                 ),
    //                 _dabbeMainDabba(
    //                     context,
    //                     "Web Development",
    //                     "Web development is the work involved in developing a web site for the Internet or an intranet.",
    //                     0,
    //                     "Flutter"),
    //                 Padding(
    //                   padding: EdgeInsets.symmetric(horizontal: 8),
    //                 ),
    //                 _dabbeMainDabba(
    //                     context,
    //                     "Data Science",
    //                     "Data science is a field that uses scientific processes, algorithms and systems to extract knowledge and insights from data.",
    //                     0,
    //                     "assets/images/python.png"),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // ),
  ),
    );
}

// RichText _serv(String head, String desc) {
//   return RichText(
//     text: TextSpan(
//       style: TextStyle(fontSize: 20, color: Colors.red),
//       text: head + " - ",
//       children: <TextSpan>[
//         TextSpan(
//           style: TextStyle(fontSize: 17, color: Colors.black87),
//           text: desc,
//         )
//       ],
//     ),
//   );
// }

class _Forth extends StatefulWidget {
  @override
  __ForthState createState() => __ForthState();
}

class __ForthState extends State<_Forth> {
  // static int _projectcurrentPage = 0;

  // final PageController _projectcontroller = PageController(
  //   initialPage: _projectcurrentPage,
  // );

  @override
  Widget build(BuildContext context){
    return Prrjects();
  }

  // ! It is the old style of the Project
  // @override
  // Widget build(BuildContext context) {
  //   return AnimatedContainer(
  //       duration: Duration(seconds: 1),
  //       padding: EdgeInsets.only(
  //         top: MediaQuery.of(context).size.height * 0.1,
  //         // bottom: MediaQuery.of(context).size.height * 0.1,
  //       ),
  //       child: ResponsiveWidget(
  //           largeScreen: AnimatedContainer(
  //             duration: Duration(seconds: 1),
  //             // height: 1.25 * MediaQuery.of(context).size.height,
  //             width: MediaQuery.of(context).size.width,
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               mainAxisSize: MainAxisSize.min,
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: <Widget>[
  //                 Padding(
  //                   padding: const EdgeInsets.only(bottom: 40.0),
  //                   child: DominoReveal(
  //                     child: Text(
  //                       "My Projects",
  //                       style: TextStyle(
  //                         color: Colors.black,
  //                         fontSize: 30,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 DominoReveal(
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     mainAxisSize: MainAxisSize.min,
  //                     children: <Widget>[
  //                       GestureDetector(
  //                         onTap: () {
  //                           _projectcurrentPage -= 1;
  //                           _projectcontroller.animateToPage(
  //                             _projectcurrentPage,
  //                             duration: Duration(seconds: 1),
  //                             curve: Curves.easeIn,
  //                           );
  //                         },
  //                         child: Container(
  //                           height: 50,
  //                           width: 50,
  //                           // alignment: Alignment(
  //                           //     MediaQuery.of(context).size.height / 2 - 20,
  //                           //     MediaQuery.of(context).size.width / 2),
  //                           decoration: BoxDecoration(
  //                             color: Colors.orange,
  //                             shape: BoxShape.circle,
  //                           ),
  //                           child: Center(
  //                             child: Icon(Icons.arrow_left),
  //                           ),
  //                         ),
  //                       ),
  //                       Container(
  //                         margin: EdgeInsets.only(
  //                             left: MediaQuery.of(context).size.width * 0.03,
  //                             right: MediaQuery.of(context).size.width * 0.03),
  //                         padding: EdgeInsets.only(
  //                           top: 50,
  //                         ),
  //                         width: MediaQuery.of(context).size.width / 1.5,
  //                         height: MediaQuery.of(context).size.height / 1.6,
  //                         alignment: Alignment.center,
  //                         child: DominoReveal(
  //                           child: PageView(
  //                             controller: _projectcontroller,
  //                             children: <Widget>[
  //                               if (!ResponsiveWidget.isSmallScreen(context))
  //                                 ProjectDecs(
  //                                   img1: "assets/project/11.png",
  //                                   img2: "assets/project/22.png",
  //                                   img3: "assets/project/33.png",
  //                                   txt1: "Palace",
  //                                   txt2: "Hunt",
  //                                 ),
  //                               ProjectDecs(
  //                                 img1: "assets/project/pho.png",
  //                                 img2: "assets/project/pm.png",
  //                                 img3: "assets/project/pp.png",
  //                                 txt1: "Punjabi",
  //                                 txt2: "Ekta",
  //                               ),
  //                         ProjectDecs(
  //                                 img1: "assets/project/bz1.png",
  //                                 img2: "assets/project/bz2.png",
  //                                 img3: "assets/project/bz3.png",
  //                                 txt1: "Bizz",
  //                                 txt2: "Code",
  //                               ),
  //                               ProjectDecs(
  //                                 img1: "assets/project/ea.jpeg",
  //                                 img2: "assets/project/eaa.jpeg",
  //                                 img3: "assets/project/33.png",
  //                                 txt1: "Estate",
  //                                 txt2: "App",
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                       ),
  //        GestureDetector(
  //                         onTap: () {
  //                           print("Tapp");
  //                           _projectcurrentPage += 1;
  //                           _projectcontroller.animateToPage(
  //                             _projectcurrentPage,
  //                             duration: Duration(seconds: 1),
  //                             curve: Curves.easeIn,
  //                           );
  //                         },
  //           child: Container(
  //                           height: 50,
  //                           width: 50,
  //                           // alignment: Alignment(
  //                           //     MediaQuery.of(context).size.height / 2 - 20,
  //                           //     MediaQuery.of(context).size.width / 2),
  //                           decoration: BoxDecoration(
  //                             color: Colors.orange,
  //                             shape: BoxShape.circle,
  //                           ),
  //                           child: Center(
  //                             child: Icon(Icons.arrow_right),
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           // smallScreen: AnimatedContainer(
  //           //   duration: Duration(seconds: 1),
  //           //   width: MediaQuery.of(context).size.width,
  //           //   child: Column(
  //           //       mainAxisAlignment: MainAxisAlignment.start,
  //           //       mainAxisSize: MainAxisSize.max,
  //           //       crossAxisAlignment: CrossAxisAlignment.center,
  //           //       children: <Widget>[
  //           //         Padding(
  //           //           padding: const EdgeInsets.only(bottom: 40.0),
  //           //           child: RichText(
  //           //             text: TextSpan(
  //           //                 style: TextStyle(
  //           //                   color: Colors.black,
  //           //                   fontSize: 30,
  //           //                   fontWeight: FontWeight.bold,
  //           //                 ),
  //           //                 text: "My Projects"),
  //           //           ),
  //           //         ),
  //           //         Container(
  //           //           color: Colors.transparent,
  //           //           margin: EdgeInsets.only(left: 10, right: 10),
  //           //           padding: EdgeInsets.only(
  //           //             top: 50,
  //           //           ),
  //           //           width: MediaQuery.of(context).size.width / 0.5,
  //           //           height: MediaQuery.of(context).size.height / 1.6,
  //           //           alignment: Alignment.center,
  //           //           child: SingleChildScrollView(
  //           //             scrollDirection: Axis.horizontal,
  //           //             padding:
  //           //                 EdgeInsets.symmetric(vertical: 5, horizontal: 5),
  //           //             child: DominoReveal(
  //           //               child: Row(
  //           //                 mainAxisAlignment: MainAxisAlignment.center,
  //           //                 crossAxisAlignment: CrossAxisAlignment.center,
  //           //                 mainAxisSize: MainAxisSize.max,
  //           //                 children: <Widget>[
  //           //                   _smallProjectDocs(
  //           //                     img1: "assets/project/11.png",
  //           //                     txt1: "Palace",
  //           //                     txt2: "Hunt",
  //           //                   ),
  //           //                   SizedBox(
  //           //                     width: 20,
  //           //                   ),
  //           //                   _smallProjectDocs(
  //           //                     img1: "assets/project/pho.png",
  //           //                     txt1: "Punjabi",
  //           //                     txt2: "Ekta",
  //           //                   ),
  //           //                   SizedBox(
  //           //                     width: 20,
  //           //                   ),
  //           //                   _smallProjectDocs(
  //           //                     img1: "assets/project/bz1.png",
  //           //                     txt1: "Bizz",
  //           //                     txt2: "Code",
  //           //                   ),
  //           //                   SizedBox(
  //           //                     width: 20,
  //           //                   ),
  //           //                   _smallProjectDocs(
  //           //                     img1: "assets/project/ea.jpeg",
  //           //                     txt1: "Estate",
  //           //                     txt2: "App",
  //           //                   ),
  //           //                 ],
  //           //               ),
  //           //             ),
  //           //           ),
  //           //         )
  //           //       ]),
  //           // )
  //           ));
  // }
}

Container _dabbeMainDabba(
    BuildContext context, String head, String bdy, int _size, String img) {
      var wid = MediaQuery.of(context).size.width;
  return Container(
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
    // width: MediaQuery.of(context).size.width / 1.5,
    // height: MediaQuery.of(context).size.height / 2.5,
    width: 330,
    height: 200,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.blueGrey[100],
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

class DNavButton extends StatelessWidget {
  final text;
  final onPressed;
  final Color color;

  const DNavButton(
      {Key key,
      @required this.text,
      @required this.onPressed,
      this.color = Colors.orange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        RaisedButton(
          color: Colors.white,
          elevation: 0.0,
          highlightColor: Colors.lime[100],
          hoverColor: Colors.yellowAccent[100],
          // hoverColor: Colors.orange[500],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Text(
            text,
            style: TextStyle(color: Colors.orange),
          ),
          // borderSide: BorderSide(
          //   color: color,
          // ),
          onPressed: onPressed,
          // highlightedBorderColor: color,
        ),
        SizedBox(
          width: 8,
        )
      ],
    );
  }
}

class NavButton extends StatelessWidget {
  final text;
  final onPressed;
  final Color color;

  const NavButton(
      {Key key,
      @required this.text,
      @required this.onPressed,
      this.color = Colors.orange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      child: Text(text),
      borderSide: BorderSide(
        color: color,
      ),
      onPressed: onPressed,
      highlightedBorderColor: color,
    );
  }
}

class ProjectDecs extends StatelessWidget {
  final String img1, img2, img3, txt1, txt2;

  const ProjectDecs(
      {Key key, this.img1, this.img2, this.img3, this.txt1, this.txt2});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.6,
      height: MediaQuery.of(context).size.height / 2,
      child: Stack(
        children: <Widget>[
          Material(
            shadowColor: Colors.yellow[900],
            animationDuration: Duration(seconds: 3),
            borderRadius: BorderRadius.all(Radius.circular(30)),
            elevation: 20,
            child: Container(
              height: 300,
              width: 800,
              color: Colors.blue[200],
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 50,
                  ),
                  RotationTransition(
                      turns: AlwaysStoppedAnimation(-10 / 360),
                      child: Material(
                        animationDuration: Duration(seconds: 3),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        elevation: 30,
                        shadowColor: Colors.black87,
                        child: Container(
                          width: 160,
                          height: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage(img1), fit: BoxFit.fill)),
                        ),
                      )),
                  SizedBox(
                    width: 50,
                  ),
                  RotationTransition(
                      turns: AlwaysStoppedAnimation(-10 / 360),
                      child: Material(
                        animationDuration: Duration(seconds: 3),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        elevation: 30,
                        shadowColor: Colors.black87,
                        child: Container(
                          width: 160,
                          height: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage(img2), fit: BoxFit.fill)),
                        ),
                      )),
                  SizedBox(
                    width: 50,
                  ),
                  RotationTransition(
                      turns: AlwaysStoppedAnimation(-10 / 360),
                      child: Material(
                        animationDuration: Duration(seconds: 3),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        elevation: 30,
                        shadowColor: Colors.black87,
                        child: Container(
                          width: 160,
                          height: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage(img3), fit: BoxFit.fill)),
                        ),
                      )),
                ],
              ),
            ),
          ),
          Positioned(
            left: 720,
            top: 80,
            child: Text(
              "$txt1\n$txt2",
              // "Palace\nHunt",
              style: TextStyle(
                  fontSize: 50,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
