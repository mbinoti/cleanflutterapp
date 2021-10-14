import 'package:meta/meta.dart';

import '../http/http.dart';
import '../../domain/usecases/usecases.dart';

class RemoteAuthentication {
  final HttpClient httpClient;
  final String url;

  RemoteAuthentication({@required this.httpClient, @required this.url});

  Future<void> auth(AuthenticationParams params) async {
    await httpClient.request(
      url: url,
      method: 'post',
      body: RemoteAuthenticationParams.fromDomains(params).toJon(),
    );
  }
}

class RemoteAuthenticationParams {
  final String email;
  final String password;
  RemoteAuthenticationParams({
    @required this.email,
    @required this.password,
  });

  factory RemoteAuthenticationParams.fromDomains(AuthenticationParams params) =>
      RemoteAuthenticationParams(email: params.email, password: params.secret);

  Map toJon() => {'email': email, 'password': password};
}
