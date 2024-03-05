import 'package:collectionapp/models/user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../firebase_options.dart';
import '../../main.dart';
import '../../services/userservices.dart';
import 'package:firebase_database/firebase_database.dart';

enum SexTypeEnum { Male, Female, Others }


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class adduser extends StatefulWidget {
    adduser({super.key});

  @override
  State<adduser> createState() => _adduserState();
}

class _adduserState extends State<adduser> {
  _adduserState() {
    late DatabaseReference ref;
    TextEditingController _userFirstNameController = TextEditingController();
    TextEditingController _userLastNameController = TextEditingController();
    TextEditingController _userAddressController = TextEditingController();
    TextEditingController _userAreaNameController = TextEditingController();
    TextEditingController _userContactController = TextEditingController();
    TextEditingController _userPinCodeController = TextEditingController();
    _selectedVal = _sexTypeList[0];
  }
  var _userFirstNameController = TextEditingController();
  var _userLastNameController = TextEditingController();
  var _userAddressController = TextEditingController();
  var _userAreaNameController = TextEditingController();
  var _userContactController = TextEditingController();
  var _userPinCodeController = TextEditingController();
  var _userservices = UserService();
  bool _validateFirstName = false;
  bool _validateLastName = false;
  bool _validatesexTypeList = false;
  bool _validateContact = false;
  bool _validateAddress = false;
  bool _validateAreaName = false;
  bool _validatePincode = false;
  SexTypeEnum? _sexTypeEnum;


  final _sexTypeList = ['Male', 'Female', 'Others'];
  String? _selectedVal = "";

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
        child: Container(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              const Text('Add Borrower',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w500)),
              TextField(
                controller: _userFirstNameController,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'Enter First Name',
                  labelText: 'First Name',
                  errorText:
                      _validateFirstName ? 'Please Enter First Name' : null,
                ),
              ),
              TextField(
                controller: _userLastNameController,
                decoration: InputDecoration(
                  border: const UnderlineInputBorder(),
                  hintText: 'Enter Last Name',
                  labelText: 'Last Name',
                  errorText:
                      _validateLastName ? 'Please Enter Last Name' : null,
                ),
              ),
              DropdownButtonFormField(
                value: _selectedVal,
                items: _sexTypeList.map(
                  (e) {
                    return DropdownMenuItem(
                      child: Text(e),
                      value: e,
                    );
                  },
                ).toList(),
                onChanged: (val) {
                  setState(() {
                    _selectedVal = val as String;
                  });
                },
                icon: const Icon(
                  Icons.arrow_circle_down_rounded,
                  color: Colors.black,
                ),
                dropdownColor: Colors.blue[50],
                decoration: const InputDecoration(
                    labelText: "Sex",
                    prefixIcon: Icon(Icons.perm_identity_rounded),
                    border: UnderlineInputBorder()),
              ),
              TextField(
                controller: _userContactController,
                decoration: InputDecoration(
                  border: const UnderlineInputBorder(),
                  hintText: 'Enter Number',
                  labelText: 'Contact',
                  errorText:
                  _validateContact ? 'Please Enter Contact Number' : null,
                ),
              ),
              TextField(
                controller: _userAddressController,
                decoration: InputDecoration(
                  border: const UnderlineInputBorder(),
                  hintText: 'Enter Address',
                  labelText: 'Address',
                  errorText: _validateAddress ? 'Please Enter Address' : null,
                ),
              ),
              TextField(
                controller: _userAreaNameController,
                decoration: InputDecoration(
                  border: const UnderlineInputBorder(),
                  hintText: 'Enter Area Name',
                  labelText: 'Area Name',
                  errorText:
                      _validateAreaName ? 'Please Enter Area Name' : null,
                ),
              ),
              TextField(
                controller: _userPinCodeController,
                decoration: InputDecoration(
                  border: const UnderlineInputBorder(),
                  hintText: 'Enter Pin Code',
                  labelText: 'Pin Code',
                  errorText: _validatePincode ? 'Please Enter Pin Code' : null,
                ),
              ),
              const SizedBox(
                height: 130,
              ),
              Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: () async {
                      setState(() {
                        _userFirstNameController.text.isEmpty
                            ? _validateFirstName = true
                            : _validateFirstName = false;
                        _userLastNameController.text.isEmpty
                            ? _validateLastName = true
                            : _validateLastName = false;
                        _userContactController.text.isEmpty
                            ? _validateContact = true
                            : _validateContact = false;
                        _userAddressController.text.isEmpty
                            ? _validateAddress = true
                            : _validateAddress = false;
                        _userAreaNameController.text.isEmpty
                            ? _validateAreaName = true
                            : _validateAreaName = false;
                        _userContactController.text.isEmpty
                            ? _validatePincode = true
                            : _validatePincode = false;
                      });
                      if (_validateFirstName == false &&
                          _validateLastName == false &&
                          _validateAddress == false &&
                          _validateContact == false &&
                          _validateAreaName == false &&
                          _validatePincode == false) ;
                      {
                        //print('Good Data Can Save');
                        var _user = User();
                        _user.firstname = _userFirstNameController.text;
                        _user.lastname = _userLastNameController.text;
                        _user.sex = _userAreaNameController.text;
                        _user.address = _userAddressController.text;
                        _user.areaname = _userAreaNameController.text;
                        _user.pincode = _userPinCodeController.text;
                        _user.contact = _userContactController.text;
                        var result = await _userservices.SaveUser(_user);
                        //print(result);
                        Navigator.pop(context, result);
                      }
                    },
                    label: const Text('   Save'),
                    icon: const Icon(Icons.save_rounded),
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        backgroundColor: MaterialStateProperty.all(Colors.teal),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(color: Colors.teal)))),
                  ),
                  const SizedBox(
                    width: 65,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      _userFirstNameController.text = '';
                      _userLastNameController.text = '';
                      _userAddressController.text = '';
                      _userAreaNameController.text = '';
                      _userContactController.text = '';
                      _userPinCodeController.text = '';
                    },
                    label: const Text('  Delete'),
                    icon: const Icon(
                      Icons.delete_rounded,
                    ),
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.redAccent),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(color: Colors.red)))),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
