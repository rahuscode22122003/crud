
import 'package:flutter/material.dart';

class searchbar extends StatefulWidget {
  const searchbar({ Key? key }) : super(key: key);

  @override
  _searchbarState createState() => _searchbarState();
}

class _searchbarState extends State<searchbar> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Column(
        children: [
          AnimatedOpacity(
            opacity: _visible ? 1 : 0,
            duration: Duration(milliseconds: 500),
            child: Container(
              width: 200,
              height: 100,
              color: Colors.orangeAccent,
            ),
          ),
          SizedBox(height: 40),
          BorderedButton(text: "Show/Hide", onPress: () {
            setState(() {
              _visible = !_visible;
            });
          })
        ],
      ),
    );
  }
}

BorderedButton({required String text, required Null Function() onPress}) {
}
