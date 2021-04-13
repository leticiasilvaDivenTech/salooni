import 'dart:convert';

import 'package:http/http.dart';
import 'package:salooni/Models/usuario.dart';
import 'package:salooni/config.dart';


class UsuarioService {

  static final String _baseUrl = "https://parseapi.back4app.com/classes/";
  static final String apiUrl = _baseUrl + "Usuario";

  static Future<Response> adicionarUsuario(Usuario usuario) async {
    Response response = await post(apiUrl,
      headers: {
        'X-Parse-Application-Id': kParseApplicationId,
        'X-Parse-REST-API-Key': kParseRestApiKey,
        'Content-Type': 'application/json'
      },
      body: json.encode(usuario.toJson()),
    );

    return response;
  }


  static Future carregarUsuarios() async {
    Response response = await get(apiUrl, headers: {
      'X-Parse-Application-Id': kParseApplicationId,
      'X-Parse-REST-API-Key': kParseRestApiKey,
    });

    return response;
  }


  static Future atualizarUsuario(Usuario usuario) async {
    String apiUrl = _baseUrl + "Usuario/${usuario.objectId}";

    Response response = await put(apiUrl, headers: {
      'X-Parse-Application-Id': kParseApplicationId,
      'X-Parse-REST-API-Key': kParseRestApiKey,
      'Content-Type': 'application/json',
    },
        body: json.encode(usuario.toJson())
    );

    return response;
  }


  static Future deletarUsuario(String objectId) async {
    String apiUrl = _baseUrl + "Usuario/$objectId";

    Response response = await delete(apiUrl, headers: {
      'X-Parse-Application-Id': kParseApplicationId,
      'X-Parse-REST-API-Key': kParseRestApiKey,
    });

    return response;
  }

  static Future carregarUsuarioByFuncId(String objectId) async {
    String apiUrl = _baseUrl + "Usuario/$objectId";

    Response response = await get(apiUrl, headers: {
      'X-Parse-Application-Id': kParseApplicationId,
      'X-Parse-REST-API-Key': kParseRestApiKey,
    });

    return response;
  }
}
