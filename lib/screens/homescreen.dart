import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../firebase_options.dart';
import '../navbar.dart';
import 'accounts.dart';
import 'member/memberpage.dart';
import 'nousers/nouser2.dart';
import 'nousers/nousers.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class homescreen extends StatefulWidget {
  const homescreen({super.key, required user});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    var textController = TextEditingController();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(
              width: 10,
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                        const memberpage(
                          user: null,
                        )));
              },
              label: const Text(
                '             𝘽𝙤𝙧𝙧𝙤𝙬𝙚𝙧                      ',
                style: TextStyle(fontSize: 20),
              ),
              icon: const Icon(
                Icons.account_box_rounded,
              ),
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(color: Colors.blue)))),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                        const nouser2(
                          user: null,
                        )));
              },
              label: const Text(
                '               𝘾𝙧𝙚𝙙𝙞𝙩                           ',
                style: TextStyle(fontSize: 20),
              ),
              icon: const Icon(Icons.credit_score_rounded),
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(color: Colors.blue)))),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                        const nousers(
                          user: null,
                        )));
              },
              label: const Text(
                '              𝘾𝙤𝙡𝙡𝙚𝙘𝙩𝙞𝙤𝙣                    ',
                style: TextStyle(fontSize: 20),
              ),
              icon: const Icon(Icons.money_rounded),
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(color: Colors.blue)))),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            accounts(
                              user: null,
                            )));
              },
              label: const Text(
                '              𝘼𝙘𝙘𝙤𝙪𝙣𝙩                      ',
                style: TextStyle(fontSize: 20),
              ),
              icon: const Icon(Icons.account_balance_wallet_rounded),
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(color: Colors.blue)))),
            ),
          ],
        ),
      ),
      drawer: const navbar(),
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        title: const Text(
          "NNT FINANCE",
        ),
        actions: [
          AnimSearchBar(
            color: Colors.blue,
            searchIconColor: Colors.white,
            width: 300,
            rtl: true,
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
                child: const Text("Home"),
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
