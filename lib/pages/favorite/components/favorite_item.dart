import 'package:fashion_shop_app/states/favorite_state.dart';
import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:fashion_shop_app/widget/big_text.dart';
import 'package:flutter/material.dart';

class FavoriteItem extends StatelessWidget {
  String id;
  String describle;
  String img;
  String name;
  int price;
  FavoriteItem({Key? key,required this.id,
    required this.describle,
    required this.img,
    required this.name,
    required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        favoriteState.sqLiteController.deleteStudent(id);
      },
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
                      BigText(text: name,size: Dimension.font16,maxLine: 2,overflow: TextOverflow.ellipsis,),
                      BigText(text: price.toString(),fontWeight: FontWeight.w500,maxLine: 1,overflow: TextOverflow.ellipsis,),
                      // BigText(text: rating.toString(),size: Dimension.font16,),
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
