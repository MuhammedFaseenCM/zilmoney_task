
import 'package:hive/hive.dart';

part 'login_model.g.dart';
@HiveType(typeId: 1)
class LoginModel {

  @HiveField(0)
 final String username;

  @HiveField(1)
  final String password;

  LoginModel({required this.username,required this.password});
}
