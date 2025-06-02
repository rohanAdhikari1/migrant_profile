import 'package:survey/data/enums.dart';
import 'package:survey/services/user_service.dart';
import 'package:dio/dio.dart';

class AuthService {
  final UserService _userService = UserService();

  static final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://gramthan.assolution.com.np/api/',
    connectTimeout: Duration(seconds: 5),
    receiveTimeout: Duration(seconds: 3),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  ));

  Future<Map<String,dynamic>> login(String username, String password) async {
    try {
      Response response = await _dio.post(
        'login',
        data: {
          'username': username,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        print(response.data);
        String token = response.data['token'];
        int id = response.data['user']?['id'];
        String firstName = response.data['user']?['first_name']??'';
        String middleName = response.data['user']?['middle_name']??'';
        String lastName = response.data['user']?['last_name']??'';
        String email = response.data['user']?['email']??'';
        String primaryPhone= response.data['user']?['primary_phone']??'';
        String secondaryPhone= response.data['user']?['secondary_phone']??'';
        String address= response.data['user']?['address']??'';
        await _userService.saveUserData(token,id,firstName,lastName,middleName,email,primaryPhone,secondaryPhone,address);
        return {
          'message': 'Login successful',
          'type': MessageType.success,
        };
      } else {
        return {
          'message': response.data['message'] ?? 'Login failed! Please check your credentials.',
          'type': MessageType.error,
        };
      }
    }  on DioException catch (e){
      print(e);
      return {
        'message': e.response?.data['message'] ??e,
        'type': MessageType.error,
      };
    }catch (e) {
      print(e);
      return {
        'message': 'An error occurred. Please try again later.',
        'type': MessageType.error,
      };
    }
  }
}
