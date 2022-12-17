import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sanalira_flutter_application_test/constants/bottom_navigator_constant.dart';

BottomNavigationBar myBottomNavigatorBar(int selectedIndex,void Function(int)? onTapFunc) { 
    return BottomNavigationBar(
      iconSize: 30,
      showSelectedLabels: false,
showUnselectedLabels: false,
      backgroundColor: BottomNavigatorConstant.backgroundColor,
      unselectedItemColor: BottomNavigatorConstant.unselectedItemColor,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          label: BottomNavigatorConstant.home,
          icon: SvgPicture.asset(BottomNavigatorConstant.homeIcon),
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(BottomNavigatorConstant.transactionIcon),
          label: BottomNavigatorConstant.transaction,
        ),
        BottomNavigationBarItem(
          icon: Stack(
            alignment: Alignment.center,
            children: [
            SvgPicture.asset(BottomNavigatorConstant.mainIcon),
            SvgPicture.asset(BottomNavigatorConstant.mainElementsIcon),
          ], ),
          label:BottomNavigatorConstant.main,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(BottomNavigatorConstant.creditCardIcon),
          label: BottomNavigatorConstant.creditCard,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(BottomNavigatorConstant.userIcon),
          label: BottomNavigatorConstant.user,
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: BottomNavigatorConstant.selectedItemColor,
     onTap: onTapFunc,
    );
  }