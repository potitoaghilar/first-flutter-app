import 'package:flutter/material.dart';
import 'package:senseless_app/image.dart';

class Header extends StatelessWidget {

  MainImage _mainImage;
  Header(this._mainImage);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 32.0),
      child: Row(
        children: <Widget>[
          InkWell(
              onTap: () {

                //Scaffold.of(context).openDrawer();
                _mainImage.showHide();

              },
              child: Icon(Icons.menu, size: 32.0, color: Colors.white)
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "TODO",
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
          InkWell(
              onTap: () => Scaffold.of(context).showSnackBar(
                  SnackBar(
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Made with ❤ with Flutter.\nSpecial thanks to GDG-Bari!")
                        ],
                      )
                  )
              ),
              child: Icon(Icons.info_outline, color: Colors.white)
          ),
        ],
      ),
    );

  }

}
