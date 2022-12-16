import 'package:flutter/material.dart';

BottomNavigationBar myBottomNavigatorBar(int selectedIndex,void Function(int)? onTapFunc) { 
    return BottomNavigationBar(
      iconSize: 30,
      showSelectedLabels: false,
showUnselectedLabels: false,
      backgroundColor: Colors.red,
      unselectedItemColor: Colors.black,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.house_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.task),
          label: 'Business',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.view_compact_alt),
          label: 'School',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.credit_card_outlined),
          label: 'Settings',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.man_outlined),
          label: 'Settings',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.green,
     onTap: onTapFunc,
    );
  }