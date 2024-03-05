import 'package:collectionapp/models/user.dart';
import 'package:collectionapp/navbar.dart';
import 'package:flutter/material.dart';
import 'package:collectionapp/screens/member/edituser.dart';
import '../../services/userservices.dart';
import 'adduser.dart';
import 'package:firebase_database/firebase_database.dart';

class viewuser extends StatefulWidget {
  final User user;
  viewuser({super.key, required this.user});

  @override
  State<viewuser> createState() => _viewuserState();
}

class _viewuserState extends State<viewuser> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        title: const Text(
          "Borrower Details",
        ),
        actions: [
          PopupMenuButton(itemBuilder: (context) {
            return [
              PopupMenuItem(
                child: const Text("     Home      "),
                onTap: () {},
              ),
              PopupMenuItem(
                child: const Text("     Edit User     "),
                onTap: () {},
              ),
              PopupMenuItem(
                child: const Text("     Settings      "),
                onTap: () {},
              )
            ];
          }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => edituser(user: User(),)));
        },
        child: const Icon(Icons.edit_note_rounded),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text('Name: ',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 20
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 40),
                  child: Text(widget.user.firstname?? '',
                  style: const TextStyle(
                    fontSize: 16
                  ),
                  )
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 5),
                  child: Text(widget.user.lastname?? '',
                  style: const TextStyle(
                    fontSize: 16
                  ),
                  )
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text('Contact: ',
                  style:TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 28),
                  child: Text(widget.user.contact?? '',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text('Address: ',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 20
                ),
                ),
                Padding(
                    padding:const EdgeInsets.only(left:23),
                  child: Text(widget.user.address??'',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),

            Row(
              children: [
                const Text('Area-name: ',
                style:TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 20,
                ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(widget.user.areaname?? '',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text('Pincode: ',
                style:TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 20,
                ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 30),
                  child: Text(widget.user.pincode?? '',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  getAllUSerDetails() {}
}
