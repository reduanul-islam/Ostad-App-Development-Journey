import '../data/models/user_model.dart';
import '../data/service/api_service.dart';
import '../utils/urls.dart';

class AuthController {
  final ApiService apiService = ApiService();

  String? token;
  UserModel? user;

  Future<bool> registration(
    String email,
    String firstName,
    String lastName,
    String mobile,
    String password,
  ) async {
    final response = await apiService.postRequest(
      TMUrls.registration,
      {
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'mobile': mobile,
        'password': password,
      },
    );

    return response['status'] == 'success';
  }

  Future<bool> login(
    String email,
    String password,
  ) async {
    final response = await apiService.postRequest(
      TMUrls.login,
      {
        'email': email,
        'password': password,
      },
    );

    if (response['status'] == 'success') {
      token = response['token'];

      user = UserModel.fromJson(
        response['data'],
      );

      return true;
    }

    return false;
  }
}