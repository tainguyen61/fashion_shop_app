import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:fashion_shop_app/widget/big_text.dart';
import 'package:flutter/material.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        margin: EdgeInsets.only(top: Dimension.size10),
        child: Container(
          decoration: BoxDecoration(
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: Dimension.size140,
                width: Dimension.size140,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/img1.jpg'),
                    )),
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: Container(
                  width: double.maxFinite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      BigText(text: 'Tên sản phẩm',size: Dimension.font16,maxLine: 2,overflow: TextOverflow.ellipsis,),
                      BigText(text: '2.750.000đ',fontWeight: FontWeight.w500,maxLine: 1,overflow: TextOverflow.ellipsis,),
                      BigText(text: 'rating',size: Dimension.font16,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
