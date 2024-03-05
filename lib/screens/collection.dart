import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';


enum AccountTypeEnum{DailyCollection,WeeklyCollection,MonthlyCollection}

class collection extends StatelessWidget {
  collection ({super.key, required user});

  AccountTypeEnum? _accountTypeEnum;

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
      body: SingleChildScrollView(
        child: Row(
          children: [
            Expanded(
              child: RadioListTile<AccountTypeEnum>(
                  contentPadding: const EdgeInsets.all(0.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  value: AccountTypeEnum.DailyCollection,
                  groupValue: _accountTypeEnum,
                  tileColor: Colors.blue.shade100,
                  dense: true,
                  title: Text(AccountTypeEnum.DailyCollection.name),
                  onChanged: (val) {
                    setState(() {
                      _accountTypeEnum = val;
                    });
                  }),
            ),
            const SizedBox(width: 5.0),
            Expanded(
              child: RadioListTile<AccountTypeEnum>(
                  contentPadding: const EdgeInsets.all(0.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  value: AccountTypeEnum.WeeklyCollection,
                  groupValue: _accountTypeEnum,
                  tileColor: Colors.blue.shade100,
                  dense: true,
                  title: Text(
                    AccountTypeEnum.WeeklyCollection.name,
                  ),
                  onChanged: (val) {
                    setState(() {
                      _accountTypeEnum = val;
                    });
                  }),
            ),
            const SizedBox(
              width: 5.0,
            ),
            Expanded(
              child: RadioListTile<AccountTypeEnum>(
                  contentPadding: const EdgeInsets.all(0.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  value: AccountTypeEnum.MonthlyCollection,
                  groupValue: _accountTypeEnum,
                  tileColor: Colors.blue.shade100,
                  dense: true,
                  title: Text(
                    AccountTypeEnum.MonthlyCollection.name,
                  ),
                  onChanged: (val) {
                    setState(() {
                      _accountTypeEnum = val;
                    });
                  }),
            ),
          ],
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}

