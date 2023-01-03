import 'package:fashion_shop_app/pages/account/account.dart';
import 'package:fashion_shop_app/pages/chat/chat_page.dart';
import 'package:fashion_shop_app/pages/favorite/favorite_page.dart';
import 'package:fashion_shop_app/pages/home_page/home_page.dart';
import 'package:fashion_shop_app/states/favorite_state.dart';
import 'package:fashion_shop_app/utils/colors.dart';
import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:fashion_shop_app/widget/big_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'admin/admin_page.dart';

class HomePageController extends StatefulWidget {
  const HomePageController({Key? key}) : super(key: key);

  @override
  State<HomePageController> createState() => _HomePageControllerState();
}

class _HomePageControllerState extends State<HomePageController> {
  int navigatorBarIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> body = const[
      HomePage(),
      FavoritePage(),
      ChatPage(),
      AccountPage(),
      AdminPage(),
    ];
    return Scaffold(
      body: body[navigatorBarIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigatorBarIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        onTap: (int index){
          setState((){
            navigatorBarIndex = index;
          });
        },
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.home),
            label: 'Trang chủ',
            icon: Icon(Icons.home_outlined),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.favorite),
            label: 'Yêu thích',
            icon: Icon(Icons.favorite_border),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.chat_bubble),
            label: 'Chat',
            icon: Icon(Icons.chat_bubble_outline),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.person),
            label: 'Tài khoản',
            icon: Icon(Icons.perm_identity_sharp),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.person),
            label: 'Admin',
            icon: Icon(Icons.key),
          ),
        ],
      )
    );
  }
}
