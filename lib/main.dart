import 'package:fashion_shop_app/models/product_model_test.dart';
import 'package:fashion_shop_app/states/panel_state.dart';
import 'package:fashion_shop_app/states/product_state.dart';
import 'package:fashion_shop_app/models/test_page.dart';
import 'package:fashion_shop_app/states/cart_state.dart';
import 'package:fashion_shop_app/states/category_state.dart';
import 'package:fashion_shop_app/states/userState.dart';
import 'package:fashion_shop_app/pages/home_page/home_page.dart';
import 'package:fashion_shop_app/pages/home_page_controller.dart';
import 'package:fashion_shop_app/pages/login/login_page.dart';
import 'package:fashion_shop_app/pages/register/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark
    );
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<CartState>(create: (context) => cartState),
            ChangeNotifierProvider<UserState>(create: (context) => userState),
            ChangeNotifierProvider<CategoryState>(create: (context) => categoryState),
            ChangeNotifierProvider<ProductState>(create: (context) => productState),
            ChangeNotifierProvider<PanelState>(create: (context) => panelState),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'fashion_shop_app',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const HomePageController(),
          ),
        );
      }
    );
  }
}
