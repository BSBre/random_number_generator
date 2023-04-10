import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:random_number_generator/model/_model.dart';

class ApiPlatform extends http.BaseClient {
  ApiPlatform(String url)
      : _inner = http.Client(),
        _baseUrl = Uri.parse(url);

  ApiPlatform.forTesting(
    http.Client client,
  )   : _inner = client,
        _baseUrl = Uri();

  // final String url;
  final http.Client _inner;
  final Uri _baseUrl;

  static const Duration _timeout = Duration(seconds: 15);

  Future<RandomNumber> getNumber(
      String num, String min, String col, String max, String base) async {
    final response = await _basicRequest(
      get(
        _baseUrl.replace(
          path: '/integers',
          queryParameters: {
            'num': num,
            'min': min,
            'col': col,
            'max': max,
            'base': base,
            'format': 'plain',
            'rnd': 'new',
          },
        ),
      ),
    );

    return RandomNumber.fromJson(json.decode(response.body));
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers[HttpHeaders.contentTypeHeader] = 'application/json';

    return _inner.send(request);
  }

  Future<http.Response> _basicRequest(Future<http.Response> request) async {
    final response = await request.timeout(_timeout);

    if (response.statusCode != 200) {
      final message =
          'status_code: ${response.statusCode}, body: ${response.body}';
      return Future.error(message);
    }
    return response;
  }

  @override
  void close() {
    _inner.close();
  }
}
