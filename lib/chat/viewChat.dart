import 'package:flutter/material.dart';
import 'package:namaagp/Identity%20Elements/mainHeader.dart';

class viewChat extends StatefulWidget {
  @override
  _viewChatState createState() => _viewChatState();
}

class _viewChatState extends State<viewChat> {
  final List<Message> messages = [
    Message(
      text:
          'أهلا \nأنا نماء متواجد لمساعدتك \n أدخل رقم السؤال المراد الإجابة عنه : \n 1- لاستفسار عن الخدمات المقدمة من نماء\n 2-  للاستفسار عن الرصيد الحالي \n 3- للإستفسار عن مصاريفك \n 4- للمزيد',
      isUser: false,
      time: DateTime.now().add(Duration(minutes: 1)),
    ),
  ];

  final TextEditingController _messageController = TextEditingController();
  final List<String> choices = ['4', '3', '2', '1'];

  DateTime? lastDisplayedDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        mainHeader(title: 'تحدث مع نمى'),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFF352D68),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: ListView.builder(
              itemCount: messages.length,
              reverse: true,
              itemBuilder: (context, index) {
                final message = messages[index];
                bool displayDate = shouldDisplayDate(message.time);
                return Column(
                  children: [
                    if (displayDate) _DateHeader(message.time),
                    _MessageBubble(
                      text: message.text,
                      isUser: message.isUser,
                      time: message.time,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        _MessageInput(
          controller: _messageController,
          onSend: _sendMessage,
        ),
      ],
    );
  }

  bool shouldDisplayDate(DateTime dateTime) {
    if (lastDisplayedDate == null) {
      lastDisplayedDate = dateTime;
      return true;
    }

    bool isSameDay =
        lastDisplayedDate!.year == dateTime.year &&
            lastDisplayedDate!.month == dateTime.month &&
            lastDisplayedDate!.day == dateTime.day;

    if (!isSameDay) {
      lastDisplayedDate = dateTime;
      return true;
    }

    return false;
  }

  void _sendMessage(String text) {
    setState(() {
      DateTime now = DateTime.now();
      messages.insert(0, Message(text: text, isUser: true, time: now));
      if (choices.contains(text)) {
        // User selected a choice, generate a specific response
        String response = generateResponse(text);
        messages.insert(0, Message(text: response, isUser: false, time: now));
      } else {
        // User entered something other than choices
        String errorMessage = 'الرجاء إدخال رقم صحيح من الخيارات المتاحة';
        messages.insert(0, Message(text: errorMessage, isUser: false, time: now));
      }
    });

    _messageController.clear();
  }

  String generateResponse(String choice) {
    // You can customize the responses based on the user's choice
    switch (choice) {
      case '1':
        return 'إجابة  1 ';
      case '2':
        return 'إجابة 2';
      case '3':
        return 'إجابة 3 ';
      case '4':
        return 'إجابة 4 ';
      default:
        return 'شكرًا على رسالتك!';
    }
  }
}

class _DateHeader extends StatelessWidget {
  final DateTime dateTime;

  _DateHeader(this.dateTime);

  @override
  Widget build(BuildContext context) {
    String formattedDate = "${dateTime.day}/${dateTime.month}/${dateTime.year}";

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            formattedDate,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class _MessageBubble extends StatelessWidget {
  final String text;
  final bool isUser;
  final DateTime time;

  _MessageBubble({required this.text, required this.isUser, required this.time});

  @override
  Widget build(BuildContext context) {
    String formattedTime = "${time.hour}:${time.minute}";

    return Column(
      crossAxisAlignment: isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            if (!isUser)
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Image.asset(
                  'assets/chatbot (1).png',
                  height: 40,
                  width: 40,
                ),
              ),
            Flexible(
              fit: FlexFit.loose,
              child: Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isUser ? Color.fromARGB(255, 157, 151, 196) : Color.fromARGB(255, 198, 167, 193),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                    ),
                    SizedBox(height: 4),
                    Text(
                      formattedTime,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _MessageInput extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSend;

  _MessageInput({required this.controller, required this.onSend});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: '...اكتب رسالتك',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Color.fromARGB(122, 114, 98, 220),
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                alignLabelWithHint: true,
              ),
              textAlign: TextAlign.right,
            ),
          ),
          SizedBox(width: 16),
          GestureDetector(
            onTap: () {
              final message = controller.text.trim();
              if (message.isNotEmpty) {
                onSend(message);
              }
            },
            child: Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF352D68),
              ),
              child: Icon(
                Icons.send_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Message {
  final String text;
  final bool isUser;
  final DateTime time;

  Message({required this.text, required this.isUser, required this.time});
}
