import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_database/firebase_database.dart';


class credit extends StatelessWidget {
  credit({super.key, required user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        title: const Text(
          "Credit",
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
    );
  }
}
