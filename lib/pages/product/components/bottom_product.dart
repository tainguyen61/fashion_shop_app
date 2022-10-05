import 'package:fashion_shop_app/models/product_model.dart';
import 'package:fashion_shop_app/states/cart_state.dart';
import 'package:fashion_shop_app/utils/colors.dart';
import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:fashion_shop_app/widget/big_text.dart';
import 'package:flutter/material.dart';

class BottomProduct extends StatelessWidget {
  String id;
  String describle;
  String idcategory;
  String img;
  String name;
  int price;
  double rating;
  String sex;
  int sold;
  BottomProduct({Key? key,
    required this.id,
    required this.describle,
    required this.idcategory,
    required this.img,
    required this.name,
    required this.price,
    required this.rating,
    required this.sex,
    required this.sold}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimension.size80,
      padding: EdgeInsets.symmetric(
          horizontal: Dimension.size16, vertical: Dimension.size10),
      decoration: BoxDecoration(
          color: AppColor.nearlyWhite,
          border:
          Border(top: BorderSide(width: 2, color: AppColor.mediumGrey))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 2,
            child: Container(
              height: Dimension.size50,
              padding: EdgeInsets.symmetric(horizontal: Dimension.size10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimension.radius5),
                  border: Border.all(
                    color: AppColor.nearlyBlue,
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.chat_bubble_outline,
                    size: Dimension.iconSize16,
                    color: AppColor.nearlyBlue,
                  ),
                  BigText(
                    text: 'Chat',
                    size: Dimension.font14,
                    color: AppColor.nearlyBlue,
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              height: Dimension.size50,
              width: Dimension.size50,
              padding: EdgeInsets.symmetric(horizontal: Dimension.size10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimension.radius5),
                  border: Border.all(
                    color: AppColor.nearlyBlue,
                  )),
              child: Icon(
                Icons.favorite_border,
                size: Dimension.iconSize24,
                color: AppColor.nearlyBlue,
              ),
            ),
          ),
          Flexible(
            flex: 6,
            child: InkWell(
              onTap: (){
                cartState.addProduct(ProductModel(id: id, describle: describle, idcategory: idcategory, img: img, name: name, price: price, rating: rating, sex: sex, sold: sold),);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Sản phẩm đã được thêm vào giỏ hàng!"),
                ),);
                },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimension.radius5),
                  color: AppColor.red,
                ),
                height: Dimension.size50,
                width: double.maxFinite,
                alignment: Alignment.center,
                child: BigText(
                  text: 'Chọn mua',
                  size: Dimension.font18,
                  color: AppColor.nearlyWhite,
                  maxLine: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
