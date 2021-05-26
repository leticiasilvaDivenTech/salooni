import 'dart:convert';
import 'package:http/http.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:salooni/Models/historico.dart';
import 'package:salooni/config.dart';


class HistoricoService {

  static final String _baseUrl = "https://parseapi.back4app.com/classes/";
  static final String apiUrl = _baseUrl + "Historico";

  static Future<Response> adicionarHistorico(Historico historico) async{
    Response response = await post(apiUrl,
      headers: {
        'X-Parse-Application-Id' : kParseApplicationId,
        'X-Parse-REST-API-Key' : kParseRestApiKey,
        'Content-Type' : 'application/json'
      },
      body: json.encode(historico.toJson()),
    );

    return response;
  }


  static Future carregarHistorico() async{
    Response response = await get(apiUrl, headers: {
      'X-Parse-Application-Id' : kParseApplicationId,
      'X-Parse-REST-API-Key' : kParseRestApiKey,
    });

     return response;
  }


  static Future atualizarHistorico(Historico historico) async{

    String apiUrl = _baseUrl + "Historico/${historico.objectId}";

    Response response = await put(apiUrl, headers: {
      'X-Parse-Application-Id' : kParseApplicationId,
      'X-Parse-REST-API-Key' : kParseRestApiKey,
      'Content-Type' : 'application/json',
    },
        body: json.encode(historico.toJson())
    );

    return response;
  }


  static Future deletarHistorico(String objectId) async{

    String apiUrl = _baseUrl + "Historico/$objectId";

    Response response = await delete(apiUrl, headers: {
      'X-Parse-Application-Id' : kParseApplicationId,
      'X-Parse-REST-API-Key' : kParseRestApiKey,
    });

    return response;
  }


  }
