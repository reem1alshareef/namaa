import 'package:namaagp/services/ChatGPTServices.dart';
import 'package:stacked/stacked.dart';

class viewModalChat extends BaseViewModel{
  Future<String?> getChatGPTAnswer(String question){
    Future<String?> answer = ChatGPTServices.askQuestion(question);
    return  answer;
  }

  Future<String?> getDatabaseAnswer(String question){
    Future<String?> answer = ChatGPTServices.askQuestion(question);
    return  answer;
  }
}