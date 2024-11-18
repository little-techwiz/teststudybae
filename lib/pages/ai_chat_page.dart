import 'package:flutter/material.dart';

class AiChatPage extends StatefulWidget {
  const AiChatPage({Key? key}) : super(key: key);

  @override
  AiChatPageState createState() => AiChatPageState();
}

class AiChatPageState extends State<AiChatPage> {
  final List<Map<String, String>> _messages = [];
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Assistant'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Implement navigation to chat settings
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildChatHistory(),
          ),
          _buildQuickActions(),
          _buildChatInput(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildChatHistory() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: _messages.length,
      itemBuilder: (context, index) {
        final message = _messages[index];
        final isUserMessage = message['sender'] == 'user';
        return Align(
          alignment: isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: isUserMessage ? Colors.green[100] : Colors.grey[200],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(message['text'] ?? ''),
          ),
        );
      },
    );
  }

  Widget _buildQuickActions() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          _buildQuickActionChip('How to study effectively?'),
          _buildQuickActionChip('Show me my schedule'),
          _buildQuickActionChip('Find study resources'),
        ],
      ),
    );
  }

  Widget _buildQuickActionChip(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: GestureDetector(
        onTap: () {
          // Handle quick action chip press
          _handleQuickAction(text);
        },
        child: Chip(
          label: Text(text),
        ),
      ),
    );
  }

  void _handleQuickAction(String text) {
    setState(() {
      _messages.add({'sender': 'user', 'text': text});
      // Simulate AI response
      _messages.add({'sender': 'ai', 'text': 'Here is the information on "$text".'});
    });
  }

  Widget _buildChatInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Type a message...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.mic),
            onPressed: () {
              // Implement voice input
            },
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              _sendMessage(_controller.text);
            },
          ),
        ],
      ),
    );
  }

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;

    setState(() {
      _messages.add({'sender': 'user', 'text': text});
      // Simulate AI response
      _messages.add({'sender': 'ai', 'text': 'I have received your message: "$text".'});
      _controller.clear();
    });
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
        BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Study & Exams'),
        BottomNavigationBarItem(icon: Icon(Icons.show_chart), label: 'Progress'),
        BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'AI Assistant'),
      ],
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushNamed(context, '/home');
            break;
          case 1:
            Navigator.pushNamed(context, '/dashboard');
            break;
          case 2:
            showModalBottomSheet(
              context: context,
              builder: (context) => _buildStudyExamsSelection(context),
            );
            break;
          case 3:
            Navigator.pushNamed(context, '/progress');
            break;
          case 4:
            Navigator.pushNamed(context, '/ai-chat');
            break;
        }
      },
    );
  }

  Widget _buildStudyExamsSelection(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        ListTile(
          title: const Text('Study Materials'),
          onTap: () {
            Navigator.pushNamed(context, '/study-materials');
          },
        ),
        ListTile(
          title: const Text('Past Exams & CATs'),
          onTap: () {
            Navigator.pushNamed(context, '/past-exams');
          },
        ),
      ],
    );
  }
}
