import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:http/http.dart' as http;

class NameDetailsController {
  static nameDetailsController(Request request) async {
    Map<String, dynamic> requestBody =
        json.decode(await request.readAsString());
    // final allParams = request.requestedUri.queryParameters;

    final urlAge = Uri.https('api.agify.io', '', {'name': requestBody['name']});

    final urlGender =
        Uri.https('api.genderize.io', '', {'name': requestBody['name']});

    final urlNationalize =
        Uri.https('api.nationalize.io', '', {'name': requestBody['name']});

    final urlActivy = Uri.https('boredapi.com', '/api/activity');

    return Response(
      200,
      body: JsonEncoder.withIndent(' ').convert({}),
    );
  }
}
