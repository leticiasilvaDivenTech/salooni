import 'dart:convert';

import 'package:http/http.dart';
import 'package:salooni/Models/procedimento.dart';
import 'package:salooni/config.dart';

class ProcedimentoService {
  static final String _baseUrl = "https://parseapi.back4app.com/classes/";
  static final String apiUrl = _baseUrl + "Procedimento";

  static Future<Response> adicionarProcedimento(
      Procedimento procedimento) async {
    Response response = await post(
      apiUrl,
      headers: {
        'X-Parse-Application-Id': kParseApplicationId,
        'X-Parse-REST-API-Key': kParseRestApiKey,
        'Content-Type': 'application/json'
      },
      body: json.encode(procedimento.toJson()),
    );

    return response;
  }

  static Future carregarProcedimentos() async {
    Response response = await get(apiUrl, headers: {
      'X-Parse-Application-Id': kParseApplicationId,
      'X-Parse-REST-API-Key': kParseRestApiKey,
    });

    return response;
  }

  static Future carregarProcedimento(String objectId) async {
    String apiUrl = _baseUrl + "Procedimento/$objectId";

    Response response = await get(apiUrl, headers: {
      'X-Parse-Application-Id': kParseApplicationId,
      'X-Parse-REST-API-Key': kParseRestApiKey,
    });

    return response;
  }

  static Future atualizarProcedimento(Procedimento procedimento) async {
    String apiUrl = _baseUrl + "Procedimento/${procedimento.objectId}";

    Response response = await put(apiUrl,
        headers: {
          'X-Parse-Application-Id': kParseApplicationId,
          'X-Parse-REST-API-Key': kParseRestApiKey,
          'Content-Type': 'application/json',
        },
        body: json.encode(procedimento.toJson()));

    return response;
  }

  static Future deletarProcedimento(String objectId) async {
    String apiUrl = _baseUrl + "Procedimento/$objectId";

    Response response = await delete(apiUrl, headers: {
      'X-Parse-Application-Id': kParseApplicationId,
      'X-Parse-REST-API-Key': kParseRestApiKey,
    });

    return response;
  }
}
