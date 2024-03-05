import 'package:flutter/material.dart';
import 'accounts.dart';
import 'package:firebase_database/firebase_database.dart';

class Report extends StatelessWidget {
  const Report({super.key, required user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      centerTitle: true,
      foregroundColor: Colors.white,
      backgroundColor: Colors.blue,
      title: const Text(
        "Report",
      ),
      actions: [
        PopupMenuButton(
            itemBuilder: (context) {
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
            }
        ),
      ],
    ),
    );
  }
}
