import 'package:flutter/material.dart';
import 'package:flutter_yesnoapp/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  
  List<Message> messageList = [
    Message(text: 'como estas?', fromwho: Fromwho.me),
    Message(text: 'te puedo ver hoy?', fromwho: Fromwho.me),
  ];
 Future<void>  sendMessage(String text) async{

  }
}
