import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
//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
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<String> _messages = [];
  final String _apiKey =
      'akeuhwajhdkajhsxkjanskadbsawd wad'; // Replace with a secure way to handle API keys

  bool _isLoading = false;

  void _sendMessage() {
    final message = _messageController.text;
    if (message.isNotEmpty) {
      setState(() {
        _messages.add('You: $message');
        _messageController.clear();
        _isLoading = true;
      });
      _getBotResponse(message);
    }
  }

  Future<void> _getBotResponse(String userMessage) async {
    try {
      final response = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Authorization': 'Bearer $_apiKey',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'model': 'gpt-3.5-turbo', // Use 'gpt-4' if you have access
          'messages': [
            {
              'role': 'system',
              'content':
                  'You are a helpful assistant specialized in vegetables. Answer all questions related to vegetables and provide information about them.'
            },
            {'role': 'user', 'content': userMessage}
          ],
          'max_tokens': 100,
        }),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final botResponse = data['choices'][0]['message']['content'].trim();
        setState(() {
          _messages.add('Bot: $botResponse');
        });
      } else {
        setState(() {
          _messages.add('Bot: Sorry, something went wrong.');
        });
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        _messages.add('Bot: An error occurred.');
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat with Vegetable Expert'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_messages[index]),
                );
              },
            ),
          ),
          if (_isLoading)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(child: CircularProgressIndicator()),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: 'Ask about vegetables...',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
