import 'package:flutter/material.dart';
// import 'Bblue_painter.dart';
import 'importts.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:responsive_site2/profiles_page.dart';


_launchURL(url) async {
  // const url = 'https://flutter.dev';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}



class Prrjects extends StatefulWidget {
  @override
  _PrrjectsState createState() => _PrrjectsState();
}

class _PrrjectsState extends State<Prrjects> {
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
                  "Projects",
                  style: TextStyle(
                fontSize: 30,
                fontFamily: "MeriendaOne",
                // color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(
              vertical: wid * 0.02, horizontal: wid * 0.002),
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
                  _smallProject(
                    context,
                    "Flutter",
                    "Punjabi Ekta",
                    "Promotional App for Political Party",
                  ),
                  _smallProject(
                    context,
                    "Flutter",
                    "Bizz Code",
                    "An app to help small busnessmen generate BarCode/QRCode and also scan them.",
                  ),
            
                  _smallProject(
                    context,
                    "Flutter",
                    "Estate App",
                    "An app for real estate brokers",
                  ),
                   _smallProject(
                    context,
                    "assets/images/android.png",
                    "Palace Hunt",
                    "An Android App that let's the users book Palaces and Caterers in their city.",
                  ),
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

Container _smallProject(
    BuildContext context, String img, String head, String bdy) {
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
        color: Colors.cyan[100],
        boxShadow: [
          BoxShadow(
              color: Colors.brown, offset: Offset(10, 10), blurRadius: 10.0)
        ]),
    child: Row(
      children: <Widget>[
        Container(
          width: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 6),
              ),
              Text(
                head,
                softWrap: true,
                overflow: TextOverflow.fade,
                style: TextStyle(fontSize: 20,fontFamily: "MeriendaOne",color: Colors.black),
              ),
              SizedBox(
                width: 110,
                height: 4,
                child: Center(
                  child: Container(
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 6),
              ),
              Expanded(
                  // scrollDirection: Axis.vertical,
                  child: Text(
                bdy,
                softWrap: true,
                overflow: TextOverflow.fade,
                style: TextStyle(fontSize: 15,fontFamily: "MeriendaOne",color: Colors.black),
              )),
            ],
          ),
        ),
        Container(
          width: 150,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                color: Colors.transparent,
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    // Icon(Icons.web_asset,color: Colors.black87,size: 30,),
                    // Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
                    GestureDetector(
                      onTap: (){
                        _launchURL("https://github.com/SharpQuagga");
                      },
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage("assets/images/github.png"))
                        ),
                      ),
                      // child: Image(image: AssetImage("assets/images/github.png"),)
                     ) ],
                ),
              )),
              Padding(padding: EdgeInsets.symmetric(vertical: 20),),
            Center(
          child: img == "Flutter"
              ? FlutterLogo(
                  // colors: Colors.orange,
                  size: 70,
                )
              : Image(
                  image: AssetImage(img),
                  colorBlendMode: BlendMode.colorBurn,
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                  width:  70,
                  height: 70,
                ),
        ),
            ],
          ),
        ),
      ],
    ),
  );
}

// class _smallProject extends StatefulWidget {
//   const _smallProject({Key key,this.img1, this.txt1, this.txt2}) : super(key: key);

//   @override
//   __smallProjectState createState() => __smallProjectState();
//   final String img1, txt1,txt2;
// }

// class __smallProjectState extends State<_smallProject> {
//   @override
//   Widget build(BuildContext context) {
//     return DominoReveal(
//         child: Material(
//             shadowColor: Colors.yellow[900],
//             animationDuration: Duration(seconds: 3),
//             borderRadius: BorderRadius.all(Radius.circular(30)),
//             elevation: 20,
//             child: Container(
//               height: 200,
//               width: 300,
//               color: Colors.blue[300],
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.max,
//                 children: <Widget>[
//                   Padding(padding: EdgeInsets.only(top: 10,left: 10),),
//                 Container(
//                   width: 140,
//                   height: 160,
//                   child: Column(
//                     children: <Widget>[
//                     Text("${widget.txt1}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,decoration: TextDecoration.underline),),
//                     Padding(padding: EdgeInsets.symmetric(vertical: 7),),
//                     Container(
//                       height: 170,
//                       child: Text("${widget.txt2}",softWrap: true,style: TextStyle(color: Colors.black),))
//                   ],),
//                 ),
//                 // Padding(padding: EdgeInsets.symmetric(horizontal: 8),),
//                 Container(
//                   width: 140,
//                   height: 160,
//                   color: Colors.black,
//                   child: Column(
//                     children: <Widget>[
//                       Container(alignment: Alignment.topLeft,
//                       child: Row(
//                         children: <Widget>[
//                           Image(image: AssetImage("assets/images/qqq.png"),),
//                           Padding(padding: EdgeInsets.symmetric(horizontal: 8),),
//                           Image(image: AssetImage("assets/images/qqq.png"),),
//                           ],),
//                           ),
//                       Container(
//                         child: Image(image: AssetImage("assets/images/qqq.png"),),
//                       )

//                   ],),
//                 )
//               ],),

//             )));
//   }
// }
