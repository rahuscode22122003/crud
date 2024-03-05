import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_database/firebase_database.dart';

class nousers extends StatelessWidget {
  const nousers({super.key, required user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      centerTitle: true,
      foregroundColor: Colors.white,
      backgroundColor: Colors.blue,
      title: const Text(
        "Collection",
      ),
      actions: [
        PopupMenuButton(itemBuilder: (context) {
          return [
            PopupMenuItem(
              child: const Text("Home"),
              onTap: () {},
            ),
            PopupMenuItem(
              child: const Text("Edit User"),
              onTap: () {},
            ),
            PopupMenuItem(
              child: const Text("Settings"),
              onTap: () {},
            )
          ];
        }),
      ],
    ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  'No Collection Data Found',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const Spacer(),
                Image.asset("Assets/errorscreen/empty-folder_7486767.png"),
                const Spacer(),
                const Text(
                  "Woops! There's No Data Found at the moment,\ Please Add New Borrower to find a Data",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                const Spacer(flex: 2,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
