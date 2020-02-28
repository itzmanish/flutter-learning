import 'package:flutter/material.dart';

class ScaffoldExample extends StatelessWidget {
  _eventButton() {
    debugPrint("Event button pressed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent.shade400,
        centerTitle: false,
        title: Text("Scaffold"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.email),
              onPressed: () => debugPrint("Email button pressed")),
          IconButton(icon: Icon(Icons.event), onPressed: _eventButton)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Container(
          child: Icon(
            Icons.add_shopping_cart,
            color: Colors.white,
          ),
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 1.0),
          ),
        ),
        onPressed: () => debugPrint("Floating action button pressed"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(icon: Icon(Icons.add), title: Text("Add")),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text("Account"))
        ],
        onTap: (int index) => debugPrint("tapped....$index"),
        backgroundColor: Colors.black26,
        selectedItemColor: Colors.amberAccent.shade400,
        unselectedItemColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomButton()
            // InkWell(
            //   child: Text(
            //     "Hello flutter",
            //     style: TextStyle(
            //         color: Colors.white,
            //         fontSize: 22,
            //         fontWeight: FontWeight.w500),
            //   ),
            //   onTap: () => debugPrint("tapped...."),
            // ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackbar = SnackBar(
          backgroundColor: Colors.amberAccent.shade400,
          content: Text("Hello again!"),
        );
        Scaffold.of(context).showSnackBar(snackbar);
      },
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade800,
          borderRadius: BorderRadius.zero,
        ),
        child: Text(
          "Click me.",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
