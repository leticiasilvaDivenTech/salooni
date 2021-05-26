import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:salooni/config.dart';
import 'UI/Inicial/home_page.dart';
import 'UI/Menu/menuLateral.dart';

void main() async  {
  runApp(MaterialApp(
    home: HomePage(),
    //home:MenuLateral(),
  ));

  await Parse().initialize(kParseApplicationId, kParseServerUrl,
      clientKey: kParseClienteKey, autoSendSessionId: true);
}
