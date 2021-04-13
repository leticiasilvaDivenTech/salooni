import 'dart:convert';
import 'package:http/http.dart';
import 'package:salooni/Models/agendamento.dart';
import 'package:salooni/config.dart';

class AgendamentoServices{
  static final String _baseUrl = "https://parseapi.back4app.com/classes/";
  static final String apiUrl = _baseUrl + "Agendamento";

  static Future<Response> adicionarAgenadmento(Agendamento agendamento) async{
    Response response = await post(apiUrl,
      headers: {
        'X-Parse-Application-Id' : kParseApplicationId,
        'X-Parse-REST-API-Key' : kParseRestApiKey,
        'Content-Type' : 'application/json'
      },
      body: json.encode(agendamento.toJson()),
    );
    return response;
  }

  static Future carregarAgendamentos() async{
    Response response = await get(apiUrl, headers: {
      'X-Parse-Application-Id' : kParseApplicationId,
      'X-Parse-REST-API-Key' : kParseRestApiKey,
    });

    return response;
  }

  static Future atualizarAgendamento(Agendamento agendamento) async{

    String apiUrl = _baseUrl + "Cliente/${agendamento.objectId}";

    Response response = await put(apiUrl, headers: {
      'X-Parse-Application-Id' : kParseApplicationId,
      'X-Parse-REST-API-Key' : kParseRestApiKey,
      'Content-Type' : 'application/json',
    },
        body: json.encode(agendamento.toJson())
    );

    return response;
  }
  static Future deletarAgendamento(String objectId) async{

    String apiUrl = _baseUrl + "Agendamento/$objectId";

    Response response = await delete(apiUrl, headers: {
      'X-Parse-Application-Id' : kParseApplicationId,
      'X-Parse-REST-API-Key' : kParseRestApiKey,
    });

    return response;
  }

}