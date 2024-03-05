import 'package:collectionapp/screens/report.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:firebase_database/firebase_database.dart';

class accounts extends StatelessWidget {
  accounts({super.key, required user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        title: const Text(
          "Accounts",
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(
              height: 570,
              width: 500,
            ),
            ElevatedButton.icon(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(Colors.blue)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Report(user: null)));
                },
                icon: const Icon(Icons.sticky_note_2_rounded),
                label: const Text('              Remark              ')),
            ElevatedButton.icon(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(Colors.blue)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Report(user: null)));
                },
                icon: const Icon(Ionicons.file_tray),
                label: const Text('              Report                ')),
          ],
        ),
      ),
    );
  }
}
