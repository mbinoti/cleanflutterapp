import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:cleanflutterapp/domain/usecases/usecases.dart';

import 'package:cleanflutterapp/data/http/http.dart';

import 'package:cleanflutterapp/data/usecases/usecases.dart';

class HttpClientSpy extends Mock implements HttpClient {}

void main() {
  HttpClientSpy httpClient;
  String url;
  RemoteAuthentication sut;

  setUp(() {
    httpClient = HttpClientSpy();
    url = faker.internet.httpUrl();
    sut = RemoteAuthentication(httpClient: httpClient, url: url);
  });

  test('Should call HttpClient with corret method', () async {
    final params = AuthenticationParams(
        email: faker.internet.email(), secret: faker.internet.password());
    await sut.auth(params);
    verify(httpClient.request(
        url: url,
        method: 'post',
        body: {'email': params.email, 'password': params.secret}));
  });
}
