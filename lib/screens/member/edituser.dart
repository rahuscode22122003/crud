import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/user.dart';
import '../../services/userservices.dart';
import 'package:firebase_database/firebase_database.dart';

enum SexTypeEnum { Male, Female, Others }

class edituser extends StatefulWidget {
  final User user;
  const edituser({super.key,  required this.user});

  @override
  State<edituser> createState() => _edituserState();
}

class _edituserState extends State<edituser> {
  _edituserState() {
    _selectedVal = _sexTypeList[0];
  }

  var _userFirstNameController = TextEditingController();
  var _userLastNameController = TextEditingController();
  var _selectedval = ValueKey('');
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


  @override
  void initState(){
    setState(() {
      _userFirstNameController.text = widget.user.firstname ??'';
      _userLastNameController.text = widget.user.lastname ??'';
      _userContactController.text = widget.user.contact ??'';
      _userAddressController.text = widget.user.address ??'';
      _userAreaNameController.text = widget.user.areaname ??'';
      _userPinCodeController.text = widget.user.pincode ?? '';
    });
    super.initState();
  }

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
          "Edit Borrower Details",
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
              const Text('Edit Borrower',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w500)),
              TextField(
                controller: _userFirstNameController,
                decoration: InputDecoration(
                  border: const  UnderlineInputBorder(),
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
                  Icons.arrow_drop_down_circle_outlined,
                  color: Colors.black,
                ),
                dropdownColor: Colors.blue[50],
                decoration: const InputDecoration(
                    labelText: "Sex",
                    prefixIcon: Icon(Icons.perm_identity_rounded),
                    border: UnderlineInputBorder()),
              ),TextField(
                controller: _userAddressController,
                decoration: InputDecoration(
                  border: const UnderlineInputBorder(),
                  hintText: 'Enter Address',
                  labelText: 'Address',
                  errorText: _validateAddress ? 'Please Enter Address' : null,
                ),
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
                        _userAddressController.text.isEmpty
                            ? _validateAddress = true
                            : _validateAddress = false;
                        _userContactController.text.isEmpty
                            ? _validateContact = true
                            : _validateContact = false;
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
                        var user = User();
                        user.firstname = _userFirstNameController.text;
                        user.contact = _userContactController.text;
                        var result = await _userservices.UpdateUser(user);
                        print(result);
                        Navigator.pop(context, result);
                      }
                    },
                    label: const Text('   Update'),
                    icon: const Icon(Icons.cloud_upload_rounded),
                    style: ButtonStyle(
                        foregroundColor:
                        MaterialStateProperty.all(Colors.white),
                        backgroundColor: MaterialStateProperty.all(Colors.teal),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(color: Colors.teal)))),
                  ),
                  const SizedBox(
                    width: 50,
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