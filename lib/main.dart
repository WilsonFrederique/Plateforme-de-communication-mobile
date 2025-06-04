import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; 
import 'chat_page.dart';

const dGreen = Color(0xFF2ac0a6);
const dWhite = Colors.white;
const dBlack = Colors.black;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RESABE',
      home: const HomePage(),
    );
  }
}

// Home Page 
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dBlack,

        leading: IconButton(
          onPressed: () {}, 
          icon: Icon(
            Icons.menu, 
            color: dWhite,
            size: 30,
          ),
        ),

        actions: [
          IconButton(
            onPressed: () {}, 
            icon: Icon(
              Icons.search_rounded, 
              color: dWhite,
              size: 30,
            ),
          ),
        ],

      ),

      body: Column(
        children: [
          MenuSection(),
          // Container(
          //   height: 100,
          //   color: Colors.blue,
          // ),
          FavoriteSection(),
          // Container(
          //   height: 100,
          //   color: Colors.red,
          // ),
          Expanded(
            child: MessageSection(),
          ),
          // Expanded(
          //   child: Container(
          //   color: Colors.green,
          //   ),
          // ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: dGreen,
        child: Icon(
          Icons.edit,
          color: dBlack,
        ),
      ),

    );
  }
}


// Menu Section 
class MenuSection extends StatelessWidget {
  final List<String> menuItems = const ["Message", "Online", "Groups", "Calls"];

  const MenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: dBlack,
      height: 100,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: menuItems.map((item) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  item, 
                  style: const TextStyle(color: Colors.white60, fontSize: 17),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}


// Favorite Contacts 
class FavoriteSection extends StatelessWidget {
  const FavoriteSection({super.key});

  final List favoriteContacts = const [
    {'name': "Wils", 'profil': "assets/images/9.png"},
    {'name': "Koto", 'profil': "assets/images/2.png"},
    {'name': "Robert", 'profil': "assets/images/3.png"},
    {'name': "Nomena", 'profil': "assets/images/10.png"},
    {'name': "Yvon", 'profil': "assets/images/3.png"},
    {'name': "Zoh", 'profil': "assets/images/2.png"},
    {'name': "Lanto", 'profil': "assets/images/3.png"}
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: dBlack,
      child: Container(
        padding: const EdgeInsets.only(top: 15),
        decoration: const BoxDecoration(
          color: dGreen,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          )
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Favorite contacts",
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_horiz, color: Colors.white, size: 20),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5), // Ajout d'un espace
            SizedBox(
              height: 110, // Hauteur légèrement augmentée
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15), // Padding ajouté en bas
                  child: Row(
                    children: favoriteContacts.map((favorite) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(4),
                              height: 70,
                              width: 70,
                              decoration: const BoxDecoration(
                                color: dWhite,
                                shape: BoxShape.circle,
                              ),
                              child: CircleAvatar(
                                radius: 20, 
                                backgroundImage: AssetImage(favorite['profil']),
                              ),
                            ),
                            const SizedBox(height: 5),
                            SizedBox(
                              width: 70, // Largeur fixe pour le texte
                              child: Text(
                                favorite['name'],
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 12, // Taille de police réduite
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// Message Section 
class MessageSection extends StatelessWidget {
  const MessageSection({super.key});

  final List messages = const [
    {
      'senderProfil': 'assets/images/9.png',
      'senderName': 'Sarah',
      'message': 'Tu as fini le rapport ?',
      'unRead': 2,
      'date': '10:30',
    },
    {
      'senderProfil': 'assets/images/10.png',
      'senderName': 'Mike',
      'message': 'Réunion à 15h en salle B Réunion à 15h en salle B Réunion à 15h en salle B ',
      'unRead': 1,
      'date': '13:47',
    },
    {
      'senderProfil': 'assets/images/3.png',
      'senderName': 'Emma',
      'message': 'Merci pour ton aide hier !',
      'unRead': 5,
      'date': '13:47',
    },
    {
      'senderProfil': 'assets/images/2.png',
      'senderName': 'Thomas',
      'message': 'On déjeune ensemble demain ?',
      'unRead': 1,
      'date': 'Lundi',
    },
    {
      'senderProfil': 'assets/images/9.png',
      'senderName': 'Sophie',
      'message': 'J\'ai envoyé les documents',
      'unRead': 1,
      'date': 'Lundi',
    },
    {
      'senderProfil': 'assets/images/10.png',
      'senderName': 'David',
      'message': 'Tu as vu le match hier soir ?',
      'unRead': 3,
      'date': '13:47',
    },
    {
      'senderProfil': 'assets/images/3.png',
      'senderName': 'Laura',
      'message': 'Je serai en retard ce matin',
      'unRead': 2,
      'date': '13:47',
    },
    {
      'senderProfil': 'assets/images/2.png',
      'senderName': 'Nicolas',
      'message': 'Bon week-end ! ☀️',
      'unRead': 1,
      'date': '13:47',
    },
    {
      'senderProfil': 'assets/images/9.png',
      'senderName': 'Julie',
      'message': 'Tu peux m\'envoyer le fichier ?',
      'unRead': 1,
      'date': '13:47',
    },
    {
      'senderProfil': 'assets/images/10.png',
      'senderName': 'Pierre',
      'message': 'On se voit à 19h au resto',
      'unRead': 3,
      'date': '13:47',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 15),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => ChatPage()
              ),
            );
          },
          splashColor: dGreen,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              children: [
                Container(
                  width: 62,
                  height: 62,
                  margin: const EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(
                    color: dGreen,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(message['senderProfil']),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              message['senderName'],
                              style: GoogleFonts.inter(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              message['date'],
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              message['message'],
                              style: GoogleFonts.inter(
                                color: Colors.black87,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (message['unRead'] > 0)
                            Container(
                              margin: const EdgeInsets.only(left: 8),
                              padding: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                color: dGreen,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                message['unRead'].toString(),
                                style: const TextStyle(
                                  color: dWhite,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      const Divider(height: 1, color: Color.fromARGB(197, 229, 226, 226)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

