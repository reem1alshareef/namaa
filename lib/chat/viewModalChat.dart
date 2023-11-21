// import 'package:namaagp/services/ChatGPTServices.dart';
// import 'package:stacked/stacked.dart';

// class viewModalChat extends BaseViewModel{
//   Future<void> getChatGPTAnswer(String question){
//     Future<void> answer = ChatGPTServices.askQuestion(question);
//     return  answer;
//   }

//   Future<void> getDatabaseAnswer(String question){
//     Future<void> answer = ChatGPTServices.askQuestion(question);
//     return  answer;
//   }
// }

import 'package:namaagp/services/ChatGPTServices.dart';
import 'package:stacked/stacked.dart';

class viewModalChat extends BaseViewModel {
  Future<String> getChatGPTAnswer(String question) async {
    // This is where you interact with the ChatGPT API
    // Replace this with your actual logic to send the question to the API and get the response
    String answer = await ChatGPTServices.askQuestion(question);
    return answer;
  }

  Future<void> startChat(Function(String) onReceiveResponse) async {
    // You may need to initialize your ChatGPT connection or setup here
    // ...
    // For demonstration purposes, let's simulate a response after initiating the chat
    onReceiveResponse('ChatGPT response for: 4');
  }

  void _receiveChatGPTResponse(String answer) {
    // Notify the UI with the received response
    notifyListeners();
  }
}
