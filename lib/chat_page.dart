import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dBlack,
      appBar: AppBar(
        backgroundColor: dBlack,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: dWhite, size: 23),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: dWhite, size: 23),
            onPressed: () => _showMoreOptions(context),
          ),
        ],
      ),
      body: const ChatingSection(),
      bottomNavigationBar: const BottomSection(),
    );
  }

  void _showMoreOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: dWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildOptionTile(Icons.person, "Profil"),
              _buildOptionTile(Icons.search, "Rechercher"),
              _buildOptionTile(Icons.notifications, "Notifications"),
              _buildOptionTile(Icons.block, "Bloquer"),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  Widget _buildOptionTile(IconData icon, String text) {
    return ListTile(
      leading: Icon(icon, color: dBlack),
      title: Text(text, style: GoogleFonts.inter()),
      onTap: () {},
    );
  }
}

class BottomSection extends StatefulWidget {
  const BottomSection({super.key});

  @override
  State<BottomSection> createState() => _BottomSectionState();
}

class _BottomSectionState extends State<BottomSection> {
  final TextEditingController _messageController = TextEditingController();
  bool _isTyping = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey.withOpacity(0.3), width: 0.5),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_isTyping)
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              alignment: Alignment.centerLeft,
              child: Text(
                "Sarah est en train d'écrire...",
                style: GoogleFonts.inter(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: dGreen,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        color: dWhite,
                        icon: const Icon(Icons.emoji_emotions_outlined),
                        onPressed: () {},
                      ),
                      Expanded(
                        child: TextField(
                          controller: _messageController,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Écrire un message...',
                            hintStyle: TextStyle(color: Colors.white70),
                          ),
                          onChanged: (text) {
                            setState(() {
                              _isTyping = text.isNotEmpty;
                            });
                          },
                        ),
                      ),
                      PopupMenuButton<String>(
                        icon: const Icon(Icons.attach_file, color: dWhite),
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            value: 'photo',
                            child: Text('Photo'),
                          ),
                          const PopupMenuItem(
                            value: 'camera',
                            child: Text('Prendre une photo'),
                          ),
                          const PopupMenuItem(
                            value: 'document',
                            child: Text('Document'),
                          ),
                        ],
                        onSelected: (value) {},
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  color: dGreen,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: Icon(
                    _messageController.text.isEmpty ? Icons.mic : Icons.send,
                    color: dWhite,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ChatingSection extends StatelessWidget {
  const ChatingSection({super.key});

  final List<Map<String, dynamic>> messages = const [
    {
      'isMe': false,
      'message': 'Salut, ça va ?',
      'time': '10:30',
      'type': 'text',
      'status': 'read'
    },
    {
      'isMe': true,
      'message': 'Oui super et toi ?',
      'time': '10:32',
      'type': 'text',
      'status': 'read'
    },
    {
      'isMe': false,
      'message': 'Je vais bien merci ! Tu as vu les dernières nouvelles ?',
      'time': '10:33',
      'type': 'text',
      'status': 'read'
    },
    {
      'isMe': true,
      'message': 'Non pas encore, raconte !',
      'time': '10:35',
      'type': 'text',
      'status': 'read'
    },
    {
      'isMe': false,
      'message': 'assets/images/2.png',
      'time': '10:36',
      'type': 'image',
      'status': 'read'
    },
    {
      'isMe': false,
      'message': 'Regarde cette photo de notre dernier voyage',
      'time': '10:36',
      'type': 'text',
      'status': 'read'
    },
    {
      'isMe': true,
      'message': 'Oh c\'était un super moment ! On devrait y retourner',
      'time': '10:38',
      'type': 'text',
      'status': 'read'
    },
    {
      'isMe': false,
      'message': 'Absolument ! J\'ai d\'autres photos à te montrer',
      'time': '10:40',
      'type': 'text',
      'status': 'read'
    },
    {
      'isMe': false,
      'message': 'assets/images/3.png',
      'time': '10:41',
      'type': 'image',
      'status': 'read'
    },
    {
      'isMe': false,
      'message': 'assets/images/4.jpg',
      'time': '10:41',
      'type': 'image',
      'status': 'read'
    },
    {
      'isMe': false,
      'message': 'assets/images/5.jpg',
      'time': '10:42',
      'type': 'image',
      'status': 'read'
    },
    {
      'isMe': true,
      'message': 'Magnifiques souvenirs ! Tu veux qu\'on organise un nouveau voyage ?',
      'time': '10:45',
      'type': 'text',
      'status': 'delivered'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          // En-tête de conversation
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ),
                const SizedBox(height: 10),
                Text(
                  "Walle Fred",
                  style: GoogleFonts.inter(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "En ligne il y a 1 heure",
                  style: GoogleFonts.inter(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          
          // Messages
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isMe = message['isMe'];
                final isSameSender = index > 0 && 
                    messages[index-1]['isMe'] == isMe;
                
                return Column(
                  children: [
                    if (!isSameSender)
                      const SizedBox(height: 15),
                    Align(
                      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.75,
                        ),
                        child: _buildMessageItem(message, isMe),
                      ),
                    ),
                    if (index == messages.length - 1)
                      const SizedBox(height: 20),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageItem(Map<String, dynamic> message, bool isMe) {
    switch (message['type']) {
      case 'image':
        return ConstrainedBox(
          constraints: BoxConstraints(
          ),
          child: _buildImageMessage(
            image: message['message'],
            time: message['time'],
            isMe: isMe,
            status: message['status'],
          ),
        );
      default:
        return _buildTextMessage(
          message: message['message'],
          time: message['time'],
          isMe: isMe,
          status: message['status'],
        );
    }
  }

  Widget _buildTextMessage({
    required String message,
    required String time,
    required bool isMe,
    required String status,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: isMe ? dGreen : Colors.grey[200],
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(20),
          topRight: const Radius.circular(20),
          bottomLeft: isMe ? const Radius.circular(20) : Radius.zero,
          bottomRight: isMe ? Radius.zero : const Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            message,
            style: TextStyle(
              color: isMe ? Colors.white : Colors.black87,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                time,
                style: TextStyle(
                  color: isMe ? Colors.white70 : Colors.grey,
                  fontSize: 10,
                ),
              ),
              if (isMe)
                const SizedBox(width: 5),
              if (isMe)
                Icon(
                  status == 'read' ? Icons.done_all : Icons.done,
                  size: 14,
                  color: status == 'read' ? Colors.blue : Colors.white70,
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildImageMessage({
    required String image,
    required String time,
    required bool isMe,
    required String status,
  }) {
    return Column(
      crossAxisAlignment: 
          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                time,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                ),
              ),
              if (isMe)
                const SizedBox(width: 5),
              if (isMe)
                Icon(
                  status == 'read' ? Icons.done_all : Icons.done,
                  size: 14,
                  color: status == 'read' ? Colors.blue : Colors.grey,
                ),
            ],
          ),
        ),
      ],
    );
  }
}