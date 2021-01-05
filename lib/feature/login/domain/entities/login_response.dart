import 'package:equatable/equatable.dart';

class LoginResponse extends Equatable{
  final int id;
  final String token;
  final String username;
  final String email;
  final String expires;
  final  String roleName;
  final  int employeeId;

  LoginResponse({this.id, this.token, this.username, this.email, this.expires, this.roleName, this.employeeId});


  @override
  // TODO: implement props
  List<Object> get props => [this.id, this.token, this.username, this.email, this.expires, this.roleName, this.employeeId];
  
}