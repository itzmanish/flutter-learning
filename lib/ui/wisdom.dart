import 'package:flutter/material.dart';

class Wisdom extends StatefulWidget {
  @override
  _WisdomState createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {
  int _index = 0;
  List<String> _quotes = [
    "Get busy living or get busy dying.",
    "The first step toward success is taken when you refuse to be a captive of the environment in which you first find yourself.",
    "When one door of happiness closes, another opens; but often we look so long at the closed door that we do not see the one which has been opened for us.",
    "Twenty years from now you will be more disappointed by the things that you didn’t do than by the ones you did do.",
    "When I dare to be powerful – to use my strength in the service of my vision, then it becomes less and less important whether I am afraid."
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 300,
              height: 300,
              margin: EdgeInsets.all(3.0),
              child: Center(
                child: Text(
                  _quotes[_index],
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: FlatButton(
                onPressed: _showQuote,
                child: Text(
                  "Inspire me!",
                  style: TextStyle(color: Colors.black),
                ),
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showQuote() {
    setState(() {
      if (_index == _quotes.length - 1)
        _index = 0;
      else
        _index++;
    });
  }
}
