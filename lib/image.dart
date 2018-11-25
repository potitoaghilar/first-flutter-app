import 'package:flutter/material.dart';
import 'package:senseless_app/diagonalClipper.dart';
import 'package:url_launcher/url_launcher.dart';

class MainImage extends StatefulWidget {

  double _imageHeight = 256.0;
  MainImageState _mainImageState;
  MainImage(this._imageHeight);

  @override
  MainImageState createState() {
    _mainImageState = new MainImageState();
    return _mainImageState;
  }

  void showHide() => _mainImageState.showHide();

}

class MainImageState extends State<MainImage> with TickerProviderStateMixin<MainImage> {

  AnimationController _controller;
  Animation<double> _fade;
  bool opened = false;

  @override
  void initState() {
    super.initState();

    _controller = new AnimationController(vsync: this,duration: const Duration(milliseconds: 200));
    _fade = new CurvedAnimation(parent: _controller, curve: Curves.easeInOut)..addStatusListener((status) {
      /*if (status == AnimationStatus.completed) {
        showHide();
      } else if (status == AnimationStatus.dismissed) {
        showHide();
      }*/
    });
    _fade.addListener(() => setState(() {}));
    //_controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void showHide() {
    _fade.value == 0 ? _controller.forward() : _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[

        ClipPath(
          clipper: DiagonalClipper(widget._imageHeight, MediaQuery.of(context).size.height, _fade.value),
          child: Flex(
            direction: Axis.vertical,
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Color.fromARGB(255, 112, 138, 163),
                  child: Column(
                    children: <Widget>[

                      Image.asset(
                        //'assets/app-background-alt.jpg',
                        'assets/back2.jpg',
                        fit: BoxFit.fitHeight,
                        alignment: Alignment.topCenter,
                        height: widget._imageHeight,
                        colorBlendMode: BlendMode.srcOver,
                        //color: Color.fromARGB(120, 20, 10, 20),
                        color: Color.fromARGB(145, 20, 65, 108),
                      ),

                      Expanded(
                        child: Center(
                          child: Column(
                            children: <Widget>[

                              Text(
                                "Informations",
                                style: new TextStyle(
                                    fontSize: 22.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 30,
                                  right: 30,
                                ),
                                child: Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
                                  textAlign: TextAlign.justify,
                                  style: new TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: RaisedButton(
                                  color: Colors.black,
                                  textColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  onPressed: () async {

                                    if (await canLaunch("https://github.com/potitoaghilar")) {
                                      await launch("https://github.com/potitoaghilar");
                                    } else {}

                                  },
                                  child: Text("My GitHub",
                                    /*style: TextStyle(
                                      color: Colors.white,
                                    ),*/
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        Container(
          height: MediaQuery.of(context).size.width * 0.2,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xCA000000),
                const Color(0x00000000),
              ],
            ),
          ),
        ),

      ],
    );
  }
}
