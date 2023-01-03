import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:fashion_shop_app/utils/colors.dart';
import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:fashion_shop_app/widget/big_text.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class AdminProductAdd extends StatefulWidget {
  const AdminProductAdd({Key? key}) : super(key: key);

  @override
  State<AdminProductAdd> createState() => _AdminProductAddState();
}

class _AdminProductAddState extends State<AdminProductAdd> {
  final ImagePicker imagePicker = ImagePicker();
  List<XFile> imageFileList = [];
  List<String> color = [];
  List<String> colorList = [];
  List<Color> pickerColor = [];
  List<String> urlImage = [];
  Color currentColor = const Color(0xff2196f3);

  void changeColor(List<Color> color) {
    setState(() {
      pickerColor = color;
    });
  }

  void selectImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    setState(() {});
  }

  List<String> listItem = ['loai 1', 'loai 2'];
  List<String> listSex = ['Nam','Nữ','Không'];
  String valueChoose = 'loai 1';
  String sexChoose = 'Nam';
  List<String> listSize = [];
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    String productName;
    String productCategory;
    int productPrice;
    String productDescribe;
    String productSex;
    String productSize;

    final TextEditingController _productName = TextEditingController();
    final TextEditingController _productPrice = TextEditingController();
    final TextEditingController _productDescribe = TextEditingController();
    final TextEditingController _productSex = TextEditingController();
    final TextEditingController _productSize = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: BigText(
          text: 'Thêm sản phẩm',
          color: AppColor.nearlyWhite,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: imageFileList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    imageFileList.removeAt(index);
                    setState(() {});
                  },
                  child: Image.file(
                    File(imageFileList[index].path),
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                  // backgroundColor: Colors.white,// background
                  side: BorderSide(color: AppColor.grey), // foreground border
                ),
                onPressed: () { selectImages(); },
                child: BigText(text: 'Chọn hình ảnh',size: Dimension.font14,)
            ),
            Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimension.size32),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _productName,
                      decoration: InputDecoration(
                        labelText: "Tên sản phẩm",
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
                    Row(
                      children: [
                        BigText(text: 'Loại sản phẩm: ',size: Dimension.size16,color: AppColor.nearlyBlack,),
                        SizedBox(width: Dimension.size10,),
                        DropdownButton(
                          value: valueChoose, //implement initial value or selected value
                          onChanged: (value){
                            setState(() { //set state will update UI and State of your App
                              valueChoose = value.toString(); //change selectval to new value
                            });
                          },
                          items: listItem.map((itemone){
                            return DropdownMenuItem(
                                value: itemone,
                                child: BigText(text: itemone,size: Dimension.font16,)
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimension.size5,
                    ),
                    Row(
                      children: [
                        BigText(text: 'Giới tính: ',size: Dimension.size16,color: AppColor.nearlyBlack,),
                        SizedBox(width: Dimension.size10,),
                        DropdownButton(
                          value: sexChoose, //implement initial value or selected value
                          onChanged: (value){
                            setState(() { //set state will update UI and State of your App
                              sexChoose = value.toString(); //change selectval to new value
                            });
                          },
                          items: listSex.map((itemone){
                            return DropdownMenuItem(
                                value: itemone,
                                child: BigText(text: itemone,size: Dimension.font16,)
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimension.size5,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          // backgroundColor: Colors.white,// background
                          side: BorderSide(color: AppColor.grey), // foreground border
                        ),
                        onPressed: () { colorPickerDialog(); },
                        child: BigText(text: 'Chọn màu',size: Dimension.font14,)
                      ),
                    ),
                    SizedBox(height: Dimension.size5,),
                    colorList.isEmpty ? Container() : GridView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        crossAxisCount: 9,
                      ),
                      itemCount: colorList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            colorList.removeAt(index);
                            pickerColor.removeAt(index);
                            setState(() {});
                          },
                          child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  // border: Border.all(
                                  //   width: 1,
                                  //   color: AppColor.nearlyBlack,
                                  // ),
                                color: Color(int.parse('0x${colorList[index]}')),
                                  borderRadius: BorderRadius.circular(50),
                              ),),
                        );
                      },
                    ),
                    SizedBox(height: Dimension.size5,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Container(
                            child: TextFormField(
                              controller: _productSize,
                              decoration: InputDecoration(
                                labelText: "Size",
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Họ tên không hợp lệ!";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                // backgroundColor: Colors.white,// background
                                side: BorderSide(color: AppColor.grey), // foreground border
                              ),
                              onPressed: () {
                                listSize.clear();
                                String size = _productSize.text;
                                if(size.isNotEmpty){
                                  listSize = size.split(',');
                                  setState(() {

                                  });
                                }
                                setState(() {

                                });
                              },
                              child: BigText(text: 'Add',size: Dimension.font14,)
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: Dimension.size5,),
                    listSize.isEmpty ? Container(): GridView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        crossAxisCount: 5,
                        childAspectRatio: 2,
                      ),
                      itemCount: listSize.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            listSize.removeAt(index);
                            setState(() {});
                          },
                          child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: AppColor.nearlyBlack,
                                  ),
                                  borderRadius: BorderRadius.circular(Dimension.radius5)
                              ),
                              child: BigText(text: '${listSize[index]}',size: Dimension.font14,)),
                        );
                      },
                    ),
                    SizedBox(
                      height: Dimension.size5,
                    ),
                    TextFormField(
                      controller: _productPrice,
                      decoration: InputDecoration(
                        labelText: "Giá",
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
                      controller: _productDescribe,
                      decoration: InputDecoration(
                        labelText: "Mô tả",
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
                      height: Dimension.size50,
                    ),
                    InkWell(
                      onTap: () async {
                        colorList.clear();
                        pickerColor.forEach((element) {
                          colorList.add(element.value.toRadixString(16));
                        });
                        String colorJson = json.encode(colorList);
                        print(colorJson);
                        print(await uploadListFile(0));
                        // if (formKey.currentState!.validate()) {
                        //   try {
                        //     productName = _productName.text;
                        //     productCategory = _productCategory.text;
                        //     productPrice = int.parse(_productPrice.text);
                        //     productDescribe = _productDescribe.text;
                        //     productSex = _productSex.text;
                        //     showDialog(
                        //       context: context,
                        //       builder: (context) {
                        //         return AlertDialog(
                        //           content: Container(
                        //             height: 100.sp,
                        //             alignment: Alignment.center,
                        //             child: CircularProgressIndicator(),
                        //           ),
                        //         );
                        //       },
                        //     );
                        //
                        //     await FirebaseFirestore.instance
                        //         .collection('products')
                        //         .add({
                        //           'describle': productDescribe,
                        //           'idcategory': productCategory,
                        //           'rating': null,
                        //           'name': productName,
                        //           'price': productPrice,
                        //           'img':
                        //               "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png",
                        //           'sex': productSex,
                        //           'sold': null,
                        //         })
                        //         .then((value) => {
                        //               print('Product Added'),
                        //             })
                        //         .catchError((error) =>
                        //             print("Failed to add user: $error"));
                        //     Navigator.pop(context);
                        //     showDialog(
                        //       context: context,
                        //       builder: (context) {
                        //         return AlertDialog(
                        //           title: BigText(
                        //             text: 'Thông báo',
                        //             size: Dimension.size16,
                        //             color: AppColor.nearlyBlack,
                        //           ),
                        //           content: Text('thêm sản phẩm thành công!'),
                        //           actions: [
                        //             TextButton(
                        //                 onPressed: () {
                        //                   Navigator.pop(context);
                        //                 },
                        //                 child: const Text('Ok')),
                        //           ],
                        //         );
                        //       },
                        //     );
                        //   } catch (ex) {
                        //     print('error');
                        //   }
                        // }
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
                            text: 'Thêm',
                            color: AppColor.nearlyWhite,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dimension.size50,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future colorPickerDialog() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
        content: SingleChildScrollView(
          child: MultipleChoiceBlockPicker(
            pickerColors: pickerColor,
            onColorsChanged: changeColor,
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {
                colorList.clear();
                if(pickerColor.isNotEmpty){
                  pickerColor.forEach((element) {colorList.add(element.value.toRadixString(16));});
                  setState(() {
                    
                  });
                }
                setState(() {
                  
                });
                Navigator.pop(context);
              },
              child: BigText(text: 'CLOSE')),
        ],
      ),
    );
  }

  Future<List<String>> uploadListFile(int i) async {
    if (i < imageFileList.length) {
      await uploadFile(File(imageFileList[i].path));
      return uploadListFile(i + 1);
    } else {
      return urlImage;
    }
    // imageFileList.forEach((element) async {await uploadFile(File(element.path));});
  }

  Future uploadFile(File file) async {
    int time = DateTime.now().microsecondsSinceEpoch;
    // urlImage.add(value)
    final ref =
        FirebaseStorage.instance.ref().child('files/imageProducts/${time}.jpg');
    final uploadTask = ref.putFile(file);
    await uploadTask.whenComplete(() async {
      String url = await uploadTask.snapshot.ref.getDownloadURL();
      urlImage.add(url);
    });
    // urlImage.add(await stackSnapshot.ref.getDownloadURL());
  }
}
