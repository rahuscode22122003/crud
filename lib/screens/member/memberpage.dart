import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:collectionapp/screens/member/adduser.dart';
import 'package:collectionapp/screens/member/edituser.dart';
import 'package:flutter/material.dart';
import 'package:collectionapp/screens/member/viewuser.dart';
import '../../models/user.dart';
import '../../services/userservices.dart';
import 'package:firebase_database/firebase_database.dart';

import '../homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CollectionApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const memberpage(
        user: null,
      ),
    );
  }
}

class memberpage extends StatefulWidget {
  const memberpage({super.key, required user});

  @override
  State<memberpage> createState() => _memberpageState();
}

class _memberpageState extends State<memberpage> {
  late List<User> _userList;
  final _userService = UserService();

  getAllUSerDetails() async {
    var users = await _userService.readALlUSers();
    _userList = <User>[];

    users.forEach((user) {
      setState(() {
        var userModel = User();
        userModel.id = user['id'];
        userModel.firstname = user['firstname'];
        userModel.lastname = user['lastname'];
        userModel.address = user['address'];
        userModel.areaname = user['areaname'];
        userModel.contact = user['contact'];
        userModel.pincode = user['pincode'];
        _userList.add(userModel);
      });
    });
  }

  @override
  void initState() {
    getAllUSerDetails();
    super.initState();
  }

  _showSuccessBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  _deleteFormDialog(BuildContext context, userId) {
    return showDialog(
        context: context,
        builder: (param) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: const Text('Are You sure Want to Delete ?',
                style: TextStyle(color: Colors.black, fontSize: 20)),
            actions: [
              ElevatedButton.icon(
                onPressed: () async {
                  var result = await _userService.deleteUser(userId);
                  if (result != null) {
                    Navigator.pop(context);
                    getAllUSerDetails();
                    _showSuccessBar('Borrower Details Deleted Successfully');
                  }
                },
                label: const Text('  Delete'),
                icon: const Icon(Icons.delete_rounded),
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.redAccent),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(color: Colors.red)))),
              ),
              const SizedBox(
                width: 90,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green[500]),
                icon: const Icon(Icons.cancel_outlined),
                label: const Text('Cancel',
                style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var textController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        title: const Text(
          "Borrowers",
        ),
        actions: [
          AnimSearchBar(
            color: Colors.blue,
            searchIconColor: Colors.white,
            width: 300,
            rtl: true,
            helpText: AutofillHints.name,
            autoFocus: true,
            boxShadow: true,
            textController: textController = TextEditingController(),
            onSuffixTap: () {
              setState(() {
                textController.clear();
              });
            },
            onSubmitted: (string) {},
          ),
          PopupMenuButton(itemBuilder: (context) {
            return [
              PopupMenuItem(
                child: const Text("     Home      "),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) =>
                          const homescreen(
                            user: null,
                          )));
                },
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
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: _userList.length,
        itemBuilder: (context, index) {
          return Card(
              color: Colors.blue[100],
              child: ListTile(
                onTap: () {
                  showModalBottomSheet(context: context, builder: (context) => viewuser(
                    user: _userList[index],
                  ));
                },
                leading: const Icon(Icons.person_rounded),
                title: Text(_userList[index].firstname ?? ''),
                subtitle: Text(_userList[index].contact ?? ''),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => edituser(
                                        user: _userList[index],
                                      ))).then((data) => {
                                if (data != null)
                                  {
                                    getAllUSerDetails(),
                                    _showSuccessBar(
                                        'Borrower Details Updated Successfully'),
                                  }
                              });
                        },
                        icon: const Icon(Icons.edit_note_rounded)),
                    IconButton(
                        onPressed: () {
                          _deleteFormDialog(context, _userList[index].id);
                        },
                        icon: const Icon(Icons.delete_rounded))
                  ],
                ),
              ));
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => adduser()))
              .then((data) => {
                    if (data != null)
                      {
                        getAllUSerDetails(),
                        _showSuccessBar('Borrower Added Successfully'),
                      }
                  });
        },
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        label: const Text('  Add New Borrower',
        style: TextStyle(fontSize: 20),),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        icon:  const Icon(Icons.person_add),
      ),
    );
  }
}
