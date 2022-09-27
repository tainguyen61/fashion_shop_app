import 'package:fashion_shop_app/utils/colors.dart';
import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:fashion_shop_app/widget/big_text.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key? key}) : super(key: key);

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
          margin: EdgeInsets.only(left: Dimension.size16,right: Dimension.size16,top: Dimension.size20),
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
                    backgroundImage:
                    AssetImage('assets/images/img1.jpg'),
                  ),
                ),
                SizedBox(
                  width: Dimension.size5,
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(
                        text: 'Nguyễn Phát Tài ',
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
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                        text: 'Địa chỉ: Vĩnh Long',
                        size: Dimension.font12,
                        maxLine: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
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