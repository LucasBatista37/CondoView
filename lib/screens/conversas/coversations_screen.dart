// screens/conversations_screen.dart
import 'package:condoview/screens/conversas/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:condoview/components/custom_bottom_navigation_bar.dart';

class ConversationsScreen extends StatefulWidget {
  const ConversationsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ConversationsScreenState createState() => _ConversationsScreenState();
}

class _ConversationsScreenState extends State<ConversationsScreen> {
  int _currentIndex = 4;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
      // Navegue para a tela apropriada com base no índice
      switch (_currentIndex) {
        case 0:
          Navigator.pushNamed(context, '/home');
          break;
        case 1:
          Navigator.pushNamed(context, '/procurar');
          break;
        case 2:
          Navigator.pushNamed(context, '/condominio');
          break;
        case 3:
          Navigator.pushNamed(context, '/vizinhança');
          break;
        case 4:
          Navigator.pushNamed(context, '/conversas');
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conversas'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: const [
          CircleAvatar(
            backgroundImage: NetworkImage(
                'https://via.placeholder.com/150'), // Placeholder image
          ),
          SizedBox(width: 16),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Meus Vizinhos',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(5, (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(
                                  'https://via.placeholder.com/150'), // Placeholder image
                            ),
                            SizedBox(height: 4),
                            Text('Nome $index'),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Últimas conversas',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://via.placeholder.com/150'), // Placeholder image
                      ),
                      title: Text('Nome $index'),
                      subtitle: Text('Última mensagem...'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ChatScreen(name: 'Nome $index')),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
      ),
    );
  }
}
