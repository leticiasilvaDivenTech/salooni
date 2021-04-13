import 'dart:convert';
import 'package:salooni/models/salao.dart';

List<Funcionario> funcionarioFromJson(String str) => List<Funcionario>.from(json.decode(str).map((x) => Funcionario.fromJson(x)));

String funcionarioToJson(List<Funcionario> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Funcionario {
  String objectId;
  Salao IdSalaoFK;
  String TipoFunc;
  String Telefone;
  String Telefone2;
  String Nome;


  Funcionario({
    this.objectId,
    this.IdSalaoFK,
    this.TipoFunc,
    this.Telefone,
    this.Telefone2,
    this.Nome
  });

  factory Funcionario.fromJson(Map<String, dynamic> json) => Funcionario(
    objectId: json["objectId"],
    IdSalaoFK: json["IdSalaoFK"],
    TipoFunc: json["TipoFunc"],
    Telefone: json["Telefone"],
    Telefone2: json["Telefone2"],
    Nome: json["Nome"]
  );

  Map<String, dynamic> toJson() => {
    "objectId": objectId,
    "IdSalaoFK": IdSalaoFK,
    "TipoFunc": TipoFunc,
    "Telefone": Telefone,
    "Telefone2": Telefone2,
    "Nome": Nome
  };
}
