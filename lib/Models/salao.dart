import 'dart:convert';

List<Salao> salaoFromJson(String str) => List<Salao>.from(json.decode(str).map((x) => Salao.fromJson(x)));

String salaoToJson(List<Salao> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Salao {
  String objectId;
  String Nome;
  String CNPJ;
  int QuantidadeFunc;

  Salao({
    this.objectId,
    this.Nome,
    this.CNPJ,
    this.QuantidadeFunc
  });

  factory Salao.fromJson(Map<String, dynamic> json) => Salao(
    objectId: json["objectId"],
    Nome: json["Nome"],
    CNPJ: json["CNPJ"],
    QuantidadeFunc: json["QuantidadeFunc"],
  );

  Map<String, dynamic> toJson() => {
    "objectId": objectId,
    "Nome": Nome,
    "CNPJ": CNPJ,
    "QuantidadeFunc": QuantidadeFunc,
  };
}
