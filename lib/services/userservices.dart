import 'package:collectionapp/db_helper/repository.dart';
import 'package:collectionapp/models/user.dart';
import 'package:firebase_database/firebase_database.dart';

class UserService {
  late Repository _repository;

  UserService() {
    _repository = Repository();
  }

//Save User
  SaveUser(User user) async {
    return await _repository.insertData("users", user.userMap());
  }

  //Read Users
  readALlUSers() async {
    return await _repository.readData('users');
  }

  //Edit Users
  UpdateUser(User user) async {
    return await _repository.updateData('users', user.userMap());
  }

// Delete User
  deleteUser(userId) async {
    return await _repository.deleteDataById('users', userId);
  }

}

