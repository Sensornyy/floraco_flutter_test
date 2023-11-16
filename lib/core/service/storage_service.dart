import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  final FlutterSecureStorage storage;

  StorageService(this.storage);

  Future<void> setChoice(String choice) async {
    await storage.write(key: 'choice', value: choice);
  }

  Future<String?> getChoice() async {
    return await storage.read(key: 'choice');
  }

  Future<void> setDateOfBirth(String dateOfBirth) async {
    await storage.write(key: 'dateOfBirth', value: dateOfBirth);
  }

  Future<String?> getDateOfBirth() async {
    return await storage.read(key: 'dateOfBirth');
  }
}
