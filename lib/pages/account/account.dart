import 'package:fashion_shop_app/components/custom_appbar.dart';
import 'package:fashion_shop_app/utils/colors.dart';
import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:fashion_shop_app/widget/big_text.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.yellow,
      appBar: CustomAppBar(
        backgroundColor: AppColor.nearlyBlue,
        elevation: 0,
        statusBarColor: AppColor.nearlyBlue,
        action: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart_outlined,
            ),
          ),
        ],
      ),
      body: Container(
        height: Dimension.size120,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: ClipPath(
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
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: Dimension.size16),
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
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/images/img1.jpg'),
                        ),
                      ),
                      SizedBox(width: Dimension.size5,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BigText(text: 'Nguyễn Phát Tài',size: Dimension.font18,),
                          BigText(text: 'Thành viên',size: Dimension.font14,),
                          BigText(text: 'Địa chỉ: Vĩnh Long',size: Dimension.font12,),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
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
