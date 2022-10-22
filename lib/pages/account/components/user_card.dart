import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_shop_app/states/userState.dart';
import 'package:fashion_shop_app/pages/login/login_page.dart';
import 'package:fashion_shop_app/utils/colors.dart';
import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:fashion_shop_app/widget/big_text.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'dart:io';

class UserCard extends StatefulWidget {
  const UserCard({Key? key}) : super(key: key);

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: OvalBottomBorderClipper(),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: Dimension.size100,
                color: AppColor.nearlyBlue,
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              left: Dimension.size16,
              right: Dimension.size16,
              top: Dimension.size20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimension.radius10),
            color: AppColor.nearlyWhite,
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5,
              )
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(Dimension.size10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: Dimension.size80,
                  width: Dimension.size80,
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return Container(
                            decoration: BoxDecoration(
                                color: AppColor.nearlyWhite,
                                borderRadius: BorderRadius.only(
                                    topRight:
                                        Radius.circular(Dimension.radius20),
                                    topLeft:
                                        Radius.circular(Dimension.radius20))),
                            height: 200,
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: Dimension.size10),
                                  alignment: Alignment.center,
                                  child: BigText(
                                    text: 'Cài ảnh đại diện',
                                    size: Dimension.font18,
                                  ),
                                ),
                                Divider(
                                  color: AppColor.backgroundGrey,
                                  thickness: 1,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                content: Container(
                                                  height: 100.sp,
                                                  alignment: Alignment.center,
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                              );
                                            },
                                          );
                                          PlatformFile? pickedFile;
                                          UploadTask? uploadTask;
                                          print(
                                              'userImage: ${userState.userInfo[0].image}');
                                          var idInfor = await userState
                                              .getIdInformation();
                                          final result = await FilePicker
                                              .platform
                                              .pickFiles();
                                          if (result == null) {
                                            return;
                                          } else {
                                            pickedFile = result.files.first;
                                          }
                                          if (pickedFile != null) {
                                            var now = DateTime.now();
                                            var formatterDate =
                                                DateFormat('ddMMyyyykkmmss');
                                            final name =
                                                '${formatterDate.format(now)}${pickedFile.name}';
                                            final path =
                                                'files/imageUsers/${name}';
                                            final file = File(pickedFile.path!);

                                            final ref = FirebaseStorage.instance
                                                .ref()
                                                .child(path);
                                            final uploadTask =
                                                ref.putFile(file);

                                            uploadTask.snapshotEvents.listen(
                                                (TaskSnapshot taskSnapshot) {
                                              switch (taskSnapshot.state) {
                                                case TaskState.running:
                                                  final progress = 100.0 *
                                                      (taskSnapshot
                                                              .bytesTransferred /
                                                          taskSnapshot
                                                              .totalBytes);
                                                  print(
                                                      "Upload is $progress% complete.");
                                                  break;
                                                case TaskState.paused:
                                                  print("Upload is paused.");
                                                  break;
                                                case TaskState.canceled:
                                                  print("Upload was canceled");
                                                  break;
                                                case TaskState.error:
                                                  Navigator.pop(context);
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        title:
                                                            Text('Thông báo!'),
                                                        content: Text(
                                                            'Cập nhật ảnh đại diện thất bại!'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: const Text(
                                                                'Ok'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                  print("Upload error");
                                                  // Handle unsuccessful uploads
                                                  break;
                                                case TaskState.success:
                                                  Navigator.pop(context);
                                                  FirebaseFirestore.instance
                                                      .collection('users')
                                                      .doc(userState
                                                          .userInfo[0].id)
                                                      .collection('information')
                                                      .doc(idInfor)
                                                      .update({
                                                    'image': name,
                                                  });
                                                  userState.getUserInfo(
                                                      userState.userInfo[0].id
                                                          .toString());
                                                  userState.getImageUser();
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        title:
                                                            Text('Thông báo!'),
                                                        content: Text(
                                                            'Cập nhật ảnh đại diện thành công!'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: const Text(
                                                                'Ok'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                  print("Upload success");
                                                  // Handle successful uploads on complete
                                                  // ...
                                                  break;
                                              }
                                            });
                                          }
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: Dimension.size16),
                                          padding: EdgeInsets.symmetric(
                                              vertical: Dimension.size5),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimension.radius5),
                                              color: AppColor.nearlyBlue),
                                          child: BigText(
                                            text: 'Cập nhật ảnh đại diện',
                                            color: AppColor.nearlyWhite,
                                            size: Dimension.font16,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: Dimension.size10,
                                      ),
                                      Container(
                                        width: double.infinity,
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: Dimension.size16),
                                        padding: EdgeInsets.symmetric(
                                            vertical: Dimension.size5),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                Dimension.radius5),
                                            color: AppColor.nearlyWhite,
                                            border: Border.all(
                                                width: 1,
                                                color: AppColor.nearlyBlue)),
                                        child: BigText(
                                          text: 'Xóa ảnh đại diện',
                                          color: AppColor.nearlyBlue,
                                          size: Dimension.font16,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Consumer<UserState>(
                      builder: (context, value, child) {
                        return userState.userInfo.isEmpty
                            ? CircleAvatar(
                                backgroundImage: AssetImage(
                                  'assets/images/img_user.png',
                              ))
                            : StreamBuilder<QuerySnapshot>(
                                stream: userState.getImageUser(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return CircleAvatar(
                                        backgroundImage: AssetImage(
                                      'assets/images/img_user.png',
                                    ));
                                  } else if (snapshot.hasData) {
                                    return CircleAvatar(
                                        backgroundImage: AssetImage(
                                        'assets/images/img_user.png',
                                    ));
                                  } else {
                                    return CircleAvatar(
                                        backgroundImage: NetworkImage(
                                      userState.userImage,
                                    ));
                                  }
                                },
                              );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: Dimension.size5,
                ),
                Consumer<UserState>(
                  builder: (context, value, child) {
                    return Flexible(
                        child: userState.userInfo.isEmpty
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BigText(
                                    text: 'Chào mừng bạn đến với FShop!',
                                    size: Dimension.font16,
                                    maxLine: 2,
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  SizedBox(
                                    height: Dimension.size5,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      await Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginPage(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(Dimension.size10),
                                      decoration: BoxDecoration(
                                        color: AppColor.nearlyWhite,
                                        border: Border.all(
                                          width: 1,
                                          color: AppColor.nearlyBlue,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            Dimension.radius5),
                                      ),
                                      child: BigText(
                                        text: 'Đăng nhập/tạo tài khoản',
                                        size: Dimension.font14,
                                        color: AppColor.nearlyBlue,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BigText(
                                    text: userState.userInfo[0].name,
                                    size: Dimension.font18,
                                    maxLine: 2,
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  SizedBox(
                                    height: Dimension.size5,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: Dimension.size5,
                                      vertical: Dimension.size3,
                                    ),
                                    decoration: BoxDecoration(
                                        color: AppColor.violet,
                                        borderRadius: BorderRadius.circular(
                                            Dimension.radius30)),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.ac_unit,
                                          color: AppColor.nearlyBlue,
                                          size: Dimension.iconSize16,
                                        ),
                                        BigText(
                                          text: 'Thành viên',
                                          size: Dimension.font12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: Dimension.size4,
                                  ),
                                  BigText(
                                    text:
                                        'Địa chỉ: ${userState.userInfo[0].address}',
                                    size: Dimension.font12,
                                    maxLine: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ));
                  },
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class OvalBottomBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height,
        size.width, size.height - 40);
    path.lineTo(size.width, 0.0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
