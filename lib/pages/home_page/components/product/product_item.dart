import 'package:fashion_shop_app/pages/product/product_page.dart';
import 'package:fashion_shop_app/utils/colors.dart';
import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:fashion_shop_app/widget/big_text.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ProductPage(),
          ),);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Dimension.radius5),
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.nearlyWhite,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: Dimension.size180,
                decoration: BoxDecoration(
                  color: AppColor.nearlyWhite,
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/images/img1.jpg',
                      ),
                      fit: BoxFit.fill),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(Dimension.size10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      text: '79.000đ',
                      size: Dimension.font16,
                      color: AppColor.red,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(
                      height: Dimension.size5,
                    ),
                    BigText(
                      text:
                      'Chai xịt bọt vệ sinh giày Snoker - hàng cao cấp 300 ml',
                      maxLine: 2,
                      size: Dimension.font12,
                      overflow: TextOverflow.ellipsis,
                      color: AppColor.darkerText,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        BigText(
                          text: '4.7',
                          size: Dimension.font12,
                          color: AppColor.lightText,
                        ),
                        Icon(
                          Icons.star_outlined,
                          size: Dimension.iconSize16,
                          color: AppColor.yellow,
                        ),
                        BigText(
                          text: ' | ',
                          size: Dimension.font10,
                          color: AppColor.lightText,
                        ),
                        BigText(
                          text: 'Đã bán 1242',
                          color: AppColor.lightText,
                          size: Dimension.font12,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
