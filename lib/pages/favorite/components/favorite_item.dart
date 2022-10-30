import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:fashion_shop_app/widget/big_text.dart';
import 'package:flutter/material.dart';

class FavoriteItem extends StatelessWidget {
  String id;
  String describle;
  String idcategory;
  List img;
  String name;
  int price;
  double rating;
  String sex;
  int sold;
  FavoriteItem({Key? key,required this.id,
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
                      image: NetworkImage(img[0]),
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
                      BigText(text: name,size: Dimension.font16,maxLine: 2,overflow: TextOverflow.ellipsis,),
                      BigText(text: price.toString(),fontWeight: FontWeight.w500,maxLine: 1,overflow: TextOverflow.ellipsis,),
                      BigText(text: rating.toString(),size: Dimension.font16,),
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
