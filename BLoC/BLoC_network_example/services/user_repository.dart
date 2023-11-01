import 'package:bloc_example/model/user.dart';
import 'package:bloc_example/services/user_api_provider.dart';

class UserRepository {
  final UserProvider _userProvider = UserProvider();
  Future<List<User>> getAllUsers() => _userProvider.getUsers();
}