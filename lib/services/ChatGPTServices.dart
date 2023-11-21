// import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

// class ChatGPTServices {
//   static Future<void> askQuestion(String question) async {
//   final openAI = OpenAI.instance.build(token: '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',baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 5)),enableLog: true);
//   final request = CompleteText(prompt:'What is human life expectancy in the United States?',
//                 model: TextDavinci3Model(), maxTokens: 200);

//  final response = await openAI.onCompletion(request:request);
//  //final request = ChatCompleteText(messages: [
//   // final request = ChatCompleteText(messages: [
//   //   Map.of({'role': "user", 'content': 'Hello!'})
//   // ], maxToken: 200, model: GptTurboChatModel());

//   // openAI.onChatCompletionSSE(request: request).listen((it) {
//   //   print(it.choices?.last.message?.content);
//   // });

//  print('hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh');
//  print(response?.choices.last.text);
//  print('ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd');
//   }

// }

import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

class ChatGPTServices {
  static Future<String> askQuestion(String question) async {
    final openAI = OpenAI.instance.build(
      token: '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',
      baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 5)),
      enableLog: true,
    );

    final request = CompleteText(
      prompt: question,
      model: TextDavinci3Model(),
      maxTokens: 200,
    );

    final response = await openAI.onCompletion(request: request);

    if (response != null && response.choices.isNotEmpty) {
      return response.choices.last.text;
    } else {
      // Handle the case when the response is null or empty
      return 'Failed to get a valid response from the ChatGPT API';
    }
  }
}

