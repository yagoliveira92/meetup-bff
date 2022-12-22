import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:http/http.dart' as http;

import '../models/activity_model.dart';
import '../models/age_model.dart';
import '../models/gender_model.dart';
import '../models/nation_model.dart';

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

    final resultAge = await http.get(urlAge);
    if (resultAge.statusCode > 300) {
      return Response(resultAge.statusCode, body: resultAge.body);
    }

    final resultGender = await http.get(urlGender);
    if (resultGender.statusCode > 300) {
      return Response(resultGender.statusCode, body: resultGender.body);
    }

    final resultNationalize = await http.get(urlNationalize);
    if (resultNationalize.statusCode > 300) {
      return Response(resultNationalize.statusCode,
          body: resultNationalize.body);
    }

    final resultActivity = await http.get(urlActivy);
    if (resultActivity.statusCode > 300) {
      return Response(resultActivity.statusCode, body: resultActivity.body);
    }

    final ageDecode = json.decode(resultAge.body);
    final genderDecode = json.decode(resultGender.body);
    final nationalizeDecode = json.decode(resultNationalize.body);
    final activityDecode = json.decode(resultActivity.body);

    final ageModel = AgeModel.fromJson(ageDecode);
    final genderModel = GenderModel.fromJson(genderDecode);
    final nationModel = NationModel.fromJson(nationalizeDecode);
    final activityModel = ActivityModel.fromJson(activityDecode);

    Map<String, dynamic> mapResponse = {
      'name': ageModel.name,
      'age': ageModel.age,
      'gender': genderModel.gender,
      'nationality': nationModel.country?[0].countryId,
      'suggestion_activity': activityModel.activity,
    };

    return Response(
      200,
      body: JsonEncoder.withIndent(' ').convert(mapResponse),
    );
  }
}
