import 'package:fashion_shop_app/utils/colors.dart';
import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:fashion_shop_app/widget/big_text.dart';
import 'package:flutter/material.dart';

class ProductDescribe extends StatelessWidget {
  const ProductDescribe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(Dimension.size16),
      decoration: BoxDecoration(
        color: AppColor.nearlyWhite,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText(
            text: 'Mô Tả Sản Phẩm',
            size: Dimension.font16,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(
            height: Dimension.size10,
          ),
          BigText(
            text:
            'Chúng tôi cam kết mang đển cho khách hàng những sản phẩm tốt nhất trong tâm giá so với thị trường, mang lại sự hài lòng tuyệt đối cho khách hàng đã tin tưởng mua sản phẩm. Chúng tôi cam kết mang đển cho khách hàng những sản phẩm tốt nhất trong tâm giá so với thị trường, mang lại sự hài lòng tuyệt đối cho khách hàng đã tin tưởng mua sản phẩm. Chúng tôi cam kết mang đển cho khách hàng những sản phẩm tốt nhất trong tâm giá so với thị trường, mang lại sự hài lòng tuyệt đối cho khách hàng đã tin tưởng mua sản phẩm.',
            size: Dimension.font14,
            overflow: TextOverflow.ellipsis,
            maxLine: 5,
          ),
        ],
      ),
    );
  }
}
