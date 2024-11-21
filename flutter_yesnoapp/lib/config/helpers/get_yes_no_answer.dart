import 'package:dio/dio.dart';
import 'package:flutter_yesnoapp/domain/entities/message.dart';

class GetYesNoAnswer {
  final _dio = Dio();
  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');

    return Message(
    text: response.data['answer'], 
    fromwho: Fromwho.hers,
    imageUrl: response.data['image'], 
    );
  }
}
