import 'package:flutter/material.dart';
import 'package:condoview/components/custom_bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
    //funcionalidade de navegação aqui
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage('assets/images/logo.png'),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/user.jpeg'),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Bem-vinda, Ana você tem três novas notificações!',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildNotificationCard('Conversas', 'Oi Ana!', 'De: Mario'),
              _buildNotificationCard(
                  'Manutenção',
                  'Manutenção da piscina dia 25 de julho das 8h às 12h',
                  'De: João'),
              _buildNotificationCard(
                  'Avisos',
                  'Não haverá coleta de lixo no feriado de 15 de agosto!',
                  'De: João'),
              const SizedBox(height: 32),
              const Text(
                'Menu completo',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildMenuGrid(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
      ),
    );
  }

  Widget _buildNotificationCard(String title, String message, String sender) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(message),
        trailing: Text(sender),
      ),
    );
  }

  Widget _buildMenuGrid() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: [
        _buildMenuItem(Icons.person, 'Visitante'),
        _buildMenuItem(Icons.notifications, 'Avisos'),
        _buildMenuItem(Icons.calendar_today, 'Reservas'),
        _buildMenuItem(Icons.build, 'Manutenção'),
        _buildMenuItem(Icons.attach_money, 'Despesas'),
        _buildMenuItem(Icons.chat, 'Chat'),
        _buildMenuItem(Icons.assignment, 'Assembleias'),
        _buildMenuItem(Icons.local_shipping, 'Correspondência'),
        _buildMenuItem(Icons.warning, 'Ocorrências'),
      ],
    );
  }

  Widget _buildMenuItem(IconData icon, String label) {
    return GestureDetector(
      onTap: () {
        
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1), 
          borderRadius: BorderRadius.circular(8.0), 
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40),
            const SizedBox(height: 8),
            Text(label, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
