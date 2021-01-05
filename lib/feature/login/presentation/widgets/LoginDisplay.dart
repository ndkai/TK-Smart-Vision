import 'package:fai_kul/feature/login/domain/entities/login_response.dart';
import 'package:flutter/material.dart';

class LoginDisplay extends StatelessWidget {
  final LoginResponse loginResponse;

  const LoginDisplay({
    Key key,
    @required this.loginResponse,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 20,
      child: Column(
        children: <Widget>[
          Text(
            loginResponse.email.toString(),
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
