import 'package:fashion_shop_app/pages/account/account.dart';
import 'package:fashion_shop_app/pages/chat/chat_page.dart';
import 'package:fashion_shop_app/pages/favorite/favorite_page.dart';
import 'package:fashion_shop_app/pages/home_page/home_page.dart';
import 'package:fashion_shop_app/utils/colors.dart';
import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:fashion_shop_app/widget/big_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    ];
    return Scaffold(
      body: body[navigatorBarIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigatorBarIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        onTap: (int index){
          print(index.toString());
          setState((){
            navigatorBarIndex = index;
          });
        },
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            label: 'Trang chủ',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Yêu thích',
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            label: 'Chat',
            icon: Icon(Icons.chat_bubble_outline),
          ),
          BottomNavigationBarItem(
            label: 'Tài khoản',
            icon: Icon(Icons.perm_identity_sharp),
          ),
        ],
      )
    );
  }
}
