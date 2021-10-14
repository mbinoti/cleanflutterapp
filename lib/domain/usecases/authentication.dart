import 'package:meta/meta.dart';

import '../entities/account_entity.dart';

abstract class Authentication {
  Future<AccounEntity> auth(AuthenticationParams params);
}

class AuthenticationParams {
  final String email;
  final String secret;
  AuthenticationParams({
    @required this.email,
    @required this.secret,
  });

  Map toJon() => {'email': email, 'password': secret};
}
