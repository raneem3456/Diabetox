// lib/doctor/chat_screen.dart

import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String patientName;

  const ChatScreen({super.key, required this.patientName});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // للتحكم في حقل إدخال الرسائل
  final TextEditingController _messageController = TextEditingController();

  // قائمة وهمية للرسائل. 'isMe' تميز رسائل الطبيب.
  final List<Map<String, dynamic>> _messages = [
      {
  'text': 'Hello, how are you feeling today?',
  'isMe': true, // رسالة من الطبيب
  'time': '10:00 AM'
},
{
'text': 'Im feeling a bit better, thank you for asking.',
'isMe': false, // رسالة من المريض
'time': '10:02 AM'
},
{
'text': 'Thats great to hear! Remember to take your medication.',
'isMe': true,
'time': '10:05 AM'
},
];

void _sendMessage() {
  if (_messageController.text.isNotEmpty) {
    final String newMessage = _messageController.text;
    setState(() {
      _messages.add({
        'text': newMessage,
        'isMe': true,
        'time': TimeOfDay.now().format(context),
      });
    });
    _messageController.clear();
  }
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(widget.patientName),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.phone),
          onPressed: () {
            // TODO: إضافة منطق بدء مكالمة
          },
        ),
        IconButton(
          icon: const Icon(Icons.videocam),
          onPressed: () {
            // TODO: إضافة منطق بدء مكالمة فيديو
          },
        ),
      ],
    ),
    body: Column(
      children: [
        Expanded(
          child: ListView.builder(
            reverse: true, // لعرض أحدث الرسائل في الأسفل
            padding: const EdgeInsets.all(16.0),
            itemCount: _messages.length,
            itemBuilder: (context, index) {
              // الرسائل مرتبة من الأحدث إلى الأقدم، لذا نعرضها بالعكس
              final message = _messages[_messages.length - 1 - index];
              return _buildMessageBubble(
                message['text'],
                message['isMe'],
                message['time'],
              );
            },
          ),
        ),
        _buildMessageInput(),
      ],
    ),
  );
}

// --- بناء فقاعة الرسالة (Message Bubble) ---
Widget _buildMessageBubble(String text, bool isMe, String time) {
  return Align(
    alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: isMe ? Colors.blue.shade100 : Colors.grey.shade300,
        borderRadius: isMe
            ? const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        )
            : const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 4),
          Text(
            time,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    ),
  );
}

// --- بناء حقل إدخال الرسالة (Input Field) ---
Widget _buildMessageInput() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Expanded(
          child: TextField(
            controller: _messageController,
            decoration: InputDecoration(
              hintText: 'Type a message...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey.shade200,
              contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
            ),
          ),
        ),
        const SizedBox(width: 8),
        CircleAvatar(
          backgroundColor: Colors.blue,
          radius: 25,
          child: IconButton(
            icon: const Icon(Icons.send, color: Colors.white),
            onPressed: _sendMessage,
          ),
        ),
      ],
    ),
  );
}
}