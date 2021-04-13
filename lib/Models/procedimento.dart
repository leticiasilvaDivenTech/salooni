import 'dart:convert';
import 'funcionario.dart';

List<Procedimento> procedimentoFromJson(String str) => List<Procedimento>.from(json.decode(str).map((x) => Procedimento.fromJson(x)));

String procedimentoToJson(List<Procedimento> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Procedimento {
  String objectId;
  Object IdFuncFK;
  int Valor;
  String Nome;
  int Tempo;

  Procedimento({
    this.objectId,
    this.IdFuncFK,
    this.Valor,
    this.Nome,
    this.Tempo
  });

  factory Procedimento.fromJson(Map<String, dynamic> json) => Procedimento(
    objectId: json["objectId"],
    IdFuncFK: json["IdFuncFK"],
    Valor: json["Valor"],
    Nome: json["Nome"],
    Tempo: json["Tempo"],
  );

  Map<String, dynamic> toJson() => {
    "objectId": objectId,
    "IdFuncFK": IdFuncFK,
    "Valor": Valor,
    "Nome": Nome,
    "Tempo": Tempo,
  };
}
