import 'package:collectionapp/screens/accounts.dart';
import 'package:collectionapp/screens/collection.dart';
import 'package:collectionapp/screens/credit.dart';
import 'package:collectionapp/screens/member/memberpage.dart';
import 'package:flutter/material.dart';

class navbar extends StatelessWidget {
  const navbar ({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('NNT Finance'),
            accountEmail: const Text('nntfinance@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://w7.pngwing.com/pngs/292/680/png-transparent-add-person-add-person-icon-thumbnail.png',
                  width: 90,
                  height: 90,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            decoration: const BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    image: NetworkImage(
                      'https://wallpapers.com/images/hd/blue-color-background-8gve05jfkbwo5dx9.jpg',
                    ),
                    fit: BoxFit.cover)),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.account_box_rounded),
            title: const Text('Borrowers'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const memberpage(
                            user: null,
                          )));
            },
          ),
          ListTile(
            leading: const Icon(Icons.credit_score_rounded),
            title: const Text('Credit'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => credit(
                        user: null,
                      )));
            },
          ),
          ListTile(
            leading: const Icon(Icons.money_rounded),
            title: const Text('Collection'),
            onTap: () {Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => collection(
                      user: null,
                    )));},
          ),
          ListTile(
            leading: const Icon(Icons.account_balance_wallet_rounded),
            title: const Text('Account'),
            onTap: (){Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => accounts(
                      user: null,
                    )));},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.file_download),
            title: const Text('Download Data'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text('Share Data'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Exit'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
