import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent[100],
      appBar: AppBar(
        title: Text('Об авторе'),
        backgroundColor: Colors.black26,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 10,
                  left: 170,
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 100,
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 100,
                  child: Image.asset(
                    'assets/images/pn1.png',
                    width: 150,
                  ),
                ),
                Positioned(
                  top: 85,
                  right: 180,
                  child: Image.asset(
                    'assets/images/dash.png',
                    width: 150,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Container(
                alignment: Alignment.center,
                width: 310,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueGrey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(1, 3),
                    ),
                  ],
                ),
                child: Text(
                  "Приложение разработал - Цыганенко Дмитрий",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Image.asset(
                  'assets/images/im1.png',
                  width: 100,
                ),
                Image.asset(
                  'assets/images/im2.png',
                  width: 100,
                ),
                Image.asset(
                  'assets/images/im3.png',
                  width: 100,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
