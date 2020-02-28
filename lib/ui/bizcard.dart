import 'package:flutter/material.dart';

class BizCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BizCard"),
          backgroundColor: Colors.black,
        ),
        body: Container(
          color: Colors.black,
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[_getCard(), _getAvatar()],
          ),
        ));
  }

  Container _getCard() {
    return Container(
      width: 350,
      height: 200,
      margin: EdgeInsets.only(top: 50.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(14.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Manish",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          Text("App Developer"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.account_circle),
              Text(
                "manish@izmanish.online",
              )
            ],
          )
        ],
      ),
    );
  }

  Container _getAvatar() {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        border: Border.all(width: 1.2),
        borderRadius: BorderRadius.circular(50),
        image: DecorationImage(
            image: NetworkImage("https://picsum.photos/200/300"),
            fit: BoxFit.cover),
      ),
    );
  }
}
