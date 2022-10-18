import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:fashion_shop_app/components/custom_appbar.dart';
import 'package:fashion_shop_app/pages/account/account.dart';
import 'package:fashion_shop_app/states/userState.dart';
import 'package:fashion_shop_app/pages/home_page/home_page.dart';
import 'package:fashion_shop_app/pages/home_page_controller.dart';
import 'package:fashion_shop_app/pages/register/register_page.dart';
import 'package:fashion_shop_app/utils/colors.dart';
import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:fashion_shop_app/widget/big_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  String email = "";
  String password = "";
  late CollectionReference users;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
     users = FirebaseFirestore.instance.collection('users');
    return Scaffold(
      backgroundColor: AppColor.nearlyWhite,
      appBar: CustomAppBar(
        title: BigText(
          text: 'Đăng nhập',
          color: AppColor.nearlyBlack,
        ),
        backgroundColor: AppColor.nearlyWhite,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: Dimension.size180,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/images/logo.png'),
              )),
            ),
            Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimension.size32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                      ),
                      validator: (value) {
                        return EmailValidator.validate(value!)
                            ? null
                            : "Email không hợp lệ!";
                      },
                    ),
                    SizedBox(
                      height: Dimension.size5,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                          labelText: "Mật khẩu",
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText;
                                print(_obscureText);
                              });
                            },
                            child: Icon(
                              _obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          )),
                      validator: (value) {
                        if (value!.isEmpty || value.length < 6) {
                          return "Địa chỉ không hợp lệ!";
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('Quên mật khẩu?'),
                    ),
                    SizedBox(
                      height: Dimension.size40,
                    ),
                    InkWell(
                      onTap: () async {
                        email = _emailController.text;
                        password = _passwordController.text;

                        if (formKey.currentState!.validate()) {
                          try {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Container(
                                    height: Dimension.size100,
                                    alignment: Alignment.center,
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              },
                            );
                            UserCredential userCredential = await FirebaseAuth
                                .instance
                                .signInWithEmailAndPassword(
                                    email: email, password: password);
                            String? userId = userCredential.user?.uid.toString();

                            // YDRwGEXmr9gnWjsATiOSN3ZuwuC2
                            print('id: ${userId}');
                            print(
                                'Sign in successfully - UserCredential ${userCredential.user?.email}');
                            userState.getUserInfo(userId!);
                            userState.login();
                            Navigator.pop(context);
                            Navigator.pop(context);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              Navigator.pop(context);
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: BigText(
                                      text: 'Thông báo',
                                      size: Dimension.size16,
                                      color: AppColor.nearlyBlack,
                                    ),
                                    content: Text('Tài khoản không tồn tại!'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Ok')),
                                    ],
                                  );
                                },
                              );
                            } else if (e.code == 'wrong-password') {
                              Navigator.pop(context);
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: BigText(
                                      text: 'Thông báo',
                                      size: Dimension.size16,
                                      color: AppColor.nearlyBlack,
                                    ),
                                    content: Text('Mật khẩu không chính xác!'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Ok')),
                                    ],
                                  );
                                },
                              );
                            }

                            // await FirebaseCrashlytics.instance.recordError(
                            //     'error',
                            //     null,
                            //     reason: 'a fatal error',
                            //     // Pass in 'fatal' argument
                            //     fatal: true
                            // );
                          }
                        }
                      },
                      child: SizedBox(
                        width: double.infinity,
                        height: Dimension.size50,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimension.radius5),
                            color: AppColor.nearlyBlue,
                          ),
                          alignment: Alignment.center,
                          child: BigText(
                            text: 'Đăng nhập',
                            color: AppColor.nearlyWhite,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dimension.size40,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Bạn chưa có tài khoản? '),
                          InkWell(
                            onTap: (){
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const RegisterPage(),
                                ),
                              );
                            },
                            child: BigText(
                              text: 'Đăng ký',
                              color: AppColor.nearlyBlue,
                              size: Dimension.font14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
