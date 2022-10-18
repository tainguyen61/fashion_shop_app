import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_shop_app/states/userState.dart';
import 'package:fashion_shop_app/utils/colors.dart';
import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:fashion_shop_app/widget/big_text.dart';
import 'package:flutter/material.dart';

class UserUpdatePage extends StatelessWidget {
  String title;
  String content;
  String userData;
  UserUpdatePage({Key? key, required this.title,required this.content,required this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _contentController = TextEditingController();
    _contentController.text = userData;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_rounded)),
        title: BigText(text: title,size: Dimension.font18,color: AppColor.nearlyWhite,),
      ),
      body: Container(
        padding: EdgeInsets.all(Dimension.size16),
        color: AppColor.nearlyWhite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BigText(text: title,size: Dimension.font14,),
            TextFormField(
              controller: _contentController,
              decoration: InputDecoration(
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Địa chỉ không hợp lệ!";
                } else {
                  return null;
                }
              },
            ),
            SizedBox(height: Dimension.size16,),
            InkWell(
              onTap: () async {
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
                var information = await FirebaseFirestore.instance.collection('users').doc(userState.userInfo[0].id).collection('information').get();
                var id = information.docs[0].id;
                 FirebaseFirestore.instance.collection('users').doc(userState.userInfo[0].id).collection('information').doc(id).update(
                     {
                     '${content}' : _contentController.text,
                     }
                   );
                 userState.getUserInfo(userState.userInfo[0].id.toString());
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
                      content: Text('Cập nhật tài khoản thành công!'),
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
              },
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: Dimension.size40,
                decoration: BoxDecoration(
                  color: AppColor.nearlyBlue,
                  borderRadius: BorderRadius.circular(Dimension.radius5),
                ),
                child: BigText(text: 'Lưu thay đổi',color: AppColor.nearlyWhite,size: Dimension.font14,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
