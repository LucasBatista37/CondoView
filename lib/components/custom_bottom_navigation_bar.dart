import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor: Colors.grey[200], 
      selectedItemColor: Colors.black, 
      unselectedItemColor: Colors
          .black54, 
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Início',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Procurar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Condomínio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.location_city),
          label: 'Vizinhança',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message),
          label: 'Conversas',
        ),
      ],
    );
  }
}
