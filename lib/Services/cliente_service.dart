import 'dart:convert';

import 'package:http/http.dart';
import 'package:salooni/Models/cliente.dart';
import 'package:salooni/config.dart';


class ClienteService {

  static final String _baseUrl = "https://parseapi.back4app.com/classes/";
  static final String apiUrl = _baseUrl + "Cliente";

  static Future<Response> adicionarCliente(Cliente cliente) async{
    Response response = await post(apiUrl,
      headers: {
        'X-Parse-Application-Id' : kParseApplicationId,
        'X-Parse-REST-API-Key' : kParseRestApiKey,
        'Content-Type' : 'application/json'
      },
      body: json.encode(cliente.toJson()),
    );

    return response;
  }


  static Future carregarClientes() async{
    Response response = await get(apiUrl, headers: {
      'X-Parse-Application-Id' : kParseApplicationId,
      'X-Parse-REST-API-Key' : kParseRestApiKey,
    });

    return response;
  }


  static Future atualizarCliente(Cliente cliente) async{

    String apiUrl = _baseUrl + "Cliente/${cliente.objectId}";

    Response response = await put(apiUrl, headers: {
      'X-Parse-Application-Id' : kParseApplicationId,
      'X-Parse-REST-API-Key' : kParseRestApiKey,
      'Content-Type' : 'application/json',
    },
        body: json.encode(cliente.toJson())
    );

    return response;
  }


  static Future deletarCliente(String objectId) async{

    String apiUrl = _baseUrl + "Cliente/$objectId";

    Response response = await delete(apiUrl, headers: {
      'X-Parse-Application-Id' : kParseApplicationId,
      'X-Parse-REST-API-Key' : kParseRestApiKey,
    });

    return response;
  }
}