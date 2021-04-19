import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:salooni/Models/funcionario.dart';
import 'package:salooni/config.dart';



class FuncionarioService {

  static final String _baseUrl = "https://parseapi.back4app.com/classes/";
  static final String apiUrl = _baseUrl + "Funcionario";

  static Future<Response> adicionarFuncionario(Funcionario funcionario) async{
    Response response = await post(apiUrl,
      headers: {
        'X-Parse-Application-Id' : kParseApplicationId,
        'X-Parse-REST-API-Key' : kParseRestApiKey,
        'Content-Type' : 'application/json'
      },
      body: json.encode(funcionario.toJson()),
    );

    return response;
  }


  static Future carregarFuncionarios() async{
    Response response = await get(apiUrl, headers: {
      'X-Parse-Application-Id' : kParseApplicationId,
      'X-Parse-REST-API-Key' : kParseRestApiKey,
    });

    return response;
  }


  static Future atualizarFuncionario(Funcionario funcionario) async{

    String apiUrl = _baseUrl + "Funcionario/${funcionario.objectId}";

    Response response = await put(apiUrl, headers: {
      'X-Parse-Application-Id' : kParseApplicationId,
      'X-Parse-REST-API-Key' : kParseRestApiKey,
      'Content-Type' : 'application/json',
    },
        body: json.encode(funcionario.toJson())
    );

    return response;
  }


  static Future deletarFuncionario(String objectId) async{

    String apiUrl = _baseUrl + "Funcionario/$objectId";

    Response response = await delete(apiUrl, headers: {
      'X-Parse-Application-Id' : kParseApplicationId,
      'X-Parse-REST-API-Key' : kParseRestApiKey,
    });

    return response;
  }

  static Future carregarParceiros() async{
    Response response = await get(apiUrl, headers: {
      'X-Parse-Application-Id' : kParseApplicationId,
      'X-Parse-REST-API-Key' : kParseRestApiKey,
    });

    return response;
  }

}