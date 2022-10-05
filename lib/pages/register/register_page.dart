import 'package:email_validator/email_validator.dart';
import 'package:fashion_shop_app/components/custom_appbar.dart';
import 'package:fashion_shop_app/utils/colors.dart';
import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:fashion_shop_app/widget/big_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _obscureText = true;
  final formKey = GlobalKey<FormState>();

  late CollectionReference users;
  String? idUser = "";
  String name = "";
  String phone = "";
  String email = "";
  String password = "";
  String address = "";

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    users = FirebaseFirestore.instance.collection('users');

    return Scaffold(
      backgroundColor: AppColor.nearlyWhite,
      appBar: CustomAppBar(
        title: BigText(
          text: 'Đăng ký',
          color: AppColor.nearlyBlack,
        ),
        backgroundColor: AppColor.nearlyWhite,
        elevation: 1,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back),color: AppColor.nearlyBlack,),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: Dimension.size160,
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
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: "Họ & tên",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Họ tên không hợp lệ!";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: Dimension.size5,
                    ),
                    TextFormField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                        labelText: "Số điện thoại",
                      ),
                      validator: (value) {
                        if (value!.length != 10 ||
                            !RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)')
                                .hasMatch(value)) {
                          return "Số điện thoại không hợp lệ!";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: Dimension.size5,
                    ),
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
                    SizedBox(
                      height: Dimension.size5,
                    ),
                    TextFormField(
                      controller: _addressController,
                      decoration: InputDecoration(
                        labelText: "Địa chỉ",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Địa chỉ không hợp lệ!";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: Dimension.size50,
                    ),
                    InkWell(
                      onTap: () async {
                        name = _nameController.text;
                        phone = _phoneController.text;
                        email = _emailController.text;
                        password = _passwordController.text;
                        address = _addressController.text;

                        if (formKey.currentState!.validate()) {
                          try {
                            UserCredential userCredential = await FirebaseAuth
                                .instance
                                .createUserWithEmailAndPassword(
                                    email: email, password: password,);
                            idUser =userCredential.user?.uid;
                            print(
                                'UserCredential ${userCredential.user?.uid}');
                            await users.doc(userCredential.user?.uid).collection('information').add({
                                  'name':name,
                              'phone':phone,
                              'email':email,
                              'address':address
                                }).then((value) => print("User Added"))
                                .catchError((error) => print("Failed to add user: $error"));
      
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: BigText(
                                    text: 'Thông báo',
                                    size: Dimension.size16,
                                    color: AppColor.nearlyBlack,
                                  ),
                                  content: Text('Đăng ký tài khoản thành công!'),
                                  actions: [
                                    TextButton(onPressed: (){
                                      Navigator.pop(context);
                                    }, child: const Text('Ok')),
                                  ],
                                );
                              },
                            );
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              print('The password provided is too weak.');
                            } else if (e.code == 'email-already-in-use') {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: BigText(
                                      text: 'Thông báo',
                                      size: Dimension.size16,
                                      color: AppColor.nearlyBlack,
                                    ),
                                    content: Text('Tài khoản này đã có người sử dụng!'),
                                    actions: [
                                      TextButton(onPressed: (){
                                        Navigator.pop(context);
                                      }, child: const Text('Ok')),
                                    ],
                                  );
                                },
                              );
                            }
                          } catch (e) {
                            print(e);
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
                            text: 'Đăng ký',
                            color: AppColor.nearlyWhite,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dimension.size40,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
