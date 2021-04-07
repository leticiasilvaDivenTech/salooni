import 'dart:convert';
import 'funcionario.dart';

List<Usuario> usuarioFromJson(String str) => List<Usuario>.from(json.decode(str).map((x) => Usuario.fromJson(x)));

String usuarioToJson(List<Usuario> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Usuario {
  String objectId;
  Funcionario IdFuncFK;
  bool Ativo;
  String Senha;
  String Email;


  Usuario({
    this.objectId,
    this.IdFuncFK,
    this.Ativo,
    this.Senha,
    this.Email
  });

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
    objectId: json["objectId"],
    IdFuncFK: json["IdFuncFK"],
    Ativo: json["Ativo"],
    Senha: json["Senha"],
    Email: json["Email"],
  );

  Map<String, dynamic> toJson() => {
    "objectId": objectId,
    "IdFuncFK": IdFuncFK,
    "Ativo": Ativo,
    "Senha": Senha,
    "Email": Email,
  };
}
