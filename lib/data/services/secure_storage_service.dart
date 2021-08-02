import 'package:ecocrypt/providers/AuthViewModel.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureLocalStorage {
  static final _storage = FlutterSecureStorage();

  Future writeSecureData(String key, String value) async {
    var writeData = await _storage.write(key: key, value: value);
    //when this function runs, update auth status
    //it should keep the user logged in
    await AuthViewModel().updateAuthStatus();
    return writeData;
  }

  Future<String> readSecureData(String key) async {
    var readData = await _storage.read(key: key);
    return readData;
  }

  Future deleteSecureData(String key) async {
    var deleteData = await _storage.delete(key: key);
    //when this function runs, update auth status
    //it should log the user out
    await AuthViewModel().updateAuthStatus();
    return deleteData;
  }
}
