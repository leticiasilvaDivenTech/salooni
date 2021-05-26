import 'dart:convert';
import 'cliente.dart';
import 'procedimento.dart';
import 'funcionario.dart';

List<Comissao> comissaoFromJson(String str) => List<Comissao>.from(json.decode(str).map((x) => Comissao.fromJson(x)));

String comissaoToJson(List<Comissao> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Comissao {
  String objectId;
  Procedimento IdProcFK;
  String ComissaoPorcentagem;
  int ComissaoValor;

  Comissao({
    this.objectId,
    this.IdProcFK,
    this.ComissaoPorcentagem,
    this.ComissaoValor,
  });

  factory Comissao.fromJson(Map<String, dynamic> json) => Comissao(
      objectId: json["objectId"],
      IdProcFK: json["IdProcFK"],
      ComissaoPorcentagem: json["ComissaoPorcentagem"],
      ComissaoValor: json["ComissaoValor"]
  );

  Map<String, dynamic> toJson() => {
    "objectId": objectId,
    "IdProcFK": IdProcFK,
    "ComissaoPorcentagem": ComissaoPorcentagem,
    "ComissaoValor": ComissaoValor
  };
}
