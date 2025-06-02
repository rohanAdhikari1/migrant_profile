import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserService {
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  Future<void> saveUserData(String token, int id, String firstName, String lastName,
      String middleName, String email, String primaryPhone, String secondaryPhone, String address) async {
    await _storage.write(key: 'token', value: token);
    await _storage.write(key: 'id', value: id.toString());
    await _storage.write(key: 'first_name', value: firstName);
    await _storage.write(key: 'middle_name', value: middleName);
    await _storage.write(key: 'last_name', value: lastName);
    await _storage.write(key: 'email', value: email);
    await _storage.write(key: 'primary_phone', value: primaryPhone);
    await _storage.write(key: 'secondary_phone', value: secondaryPhone);
    await _storage.write(key: 'address', value: address);
  }

  Future<Map<String, dynamic>> getUserData() async {
    String? token = await _storage.read(key: 'token');
    String? idString = await _storage.read(key: 'id');
    String? firstName = await _storage.read(key: 'first_name');
    String? middleName = await _storage.read(key: 'middle_name');
    String? lastName = await _storage.read(key: 'last_name');
    String? email = await _storage.read(key: 'email');
    String? primaryPhone = await _storage.read(key: 'primary_phone');
    String? secondaryPhone = await _storage.read(key: 'secondary_phone');
    String? address = await _storage.read(key: 'address');

    int id = idString != null ? int.parse(idString) : 0;

    return {
      'token': token ?? '',
      'id': id,
      'first_name': firstName ?? '',
      'middle_name':middleName??'',
      'last_name': lastName ?? '',
      'email':email??'',
      'primary_phone':primaryPhone??'',
      'secondary_phone':secondaryPhone??'',
      'address':address??'',
    };
  }

  Future<void> clearUserData() async {
    await _storage.delete(key: 'token');
    await _storage.delete(key: 'id');
    await _storage.delete(key: 'first_name');
    await _storage.delete(key: 'middle_name');
    await _storage.delete(key: 'last_name');
    await _storage.delete(key: 'email');
    await _storage.delete(key: 'primary_phone');
    await _storage.delete(key: 'secondary_phone');
    await _storage.delete(key: 'address');
  }
}
