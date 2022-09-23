import 'package:fashion_shop_app/components/custom_appbar.dart';
import 'package:fashion_shop_app/utils/colors.dart';
import 'package:fashion_shop_app/utils/dimension.dart';
import 'package:fashion_shop_app/widget/big_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundGrey,
      appBar: CustomAppBar(
        statusBarColor: AppColor.yellow,
        elevation: 0,
        backgroundColor: AppColor.yellow,
        action: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart_outlined,
            ),
          ),
        ],
        title: ClipRRect(
          borderRadius: BorderRadius.circular(Dimension.radius5),
          child: Container(
            height: Dimension.size45,
            color: Colors.white,
            child: TextField(
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: Dimension.size10),
                prefixIcon: const Icon(
                  Icons.search_outlined,
                  color: AppColor.grey,
                ),
                border: InputBorder.none,
                hintText: 'Bạn tìm gì hôm nay?',
                // hintStyle: TextStyle(color: Colors.grey.shade400,fontSize: 12),
                // contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
              ),
            ),
          ),
        ),
      ),

      // AppBar(
      //     systemOverlayStyle: SystemUiOverlayStyle(
      //         statusBarColor: AppColor.yellow
      //     ),
      //     elevation: 0,
      //     backgroundColor: AppColor.yellow,
      //     actions: [
      //       IconButton(
      //         onPressed: () {},
      //         icon: const Icon(
      //           Icons.notifications_none,
      //         ),
      //       ),
      //       IconButton(
      //         onPressed: () {},
      //         icon: const Icon(
      //           Icons.shopping_cart_outlined,
      //         ),
      //       ),
      //     ],
      //     title: ClipRRect(
      //       borderRadius: BorderRadius.circular(Dimension.radius5),
      //       child: Container(
      //         height: Dimension.size45,
      //         color: Colors.white,
      //         child: TextField(
      //           decoration: InputDecoration(
      //             contentPadding:
      //             EdgeInsets.symmetric(vertical: Dimension.size10),
      //             prefixIcon: const Icon(
      //               Icons.search_outlined,
      //               color: AppColor.grey,
      //             ),
      //             border: InputBorder.none,
      //             hintText: 'Bạn tìm gì hôm nay?',
      //             // hintStyle: TextStyle(color: Colors.grey.shade400,fontSize: 12),
      //             // contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
      //           ),
      //         ),
      //       ),
      //     )
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: AppColor.nearlyWhite,
              child: SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                            vertical: Dimension.size10,
                            horizontal: Dimension.size10),
                        child: BigText(
                          text: 'Thời trang nam',
                          size: Dimension.font14,
                        ));
                  },
                ),
              ),
            ),
            SizedBox(
              height: Dimension.size10,
            ),
            Container(
              color: AppColor.nearlyWhite,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(Dimension.size10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(Dimension.radius10),
                      child: Container(
                        color: Colors.yellow,
                        height: Dimension.panel120,
                        child: PageView.builder(
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(right: 10),
                              color: Colors.red,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Dimension.size10,
            ),
            Container(
              width: double.infinity,
              height: Dimension.panel200,
              decoration: const BoxDecoration(
                color: AppColor.nearlyWhite,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(Dimension.size10),
                    child: BigText(
                      text: 'Deal Hot',
                      size: Dimension.font18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: Dimension.size10),
                    child: SizedBox(
                      height: 160,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 120,
                                width: 120,
                                margin:
                                    EdgeInsets.only(right: Dimension.size10),
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.circular(Dimension.radius10),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    right: Dimension.size10,
                                    top: Dimension.size5),
                                child: BigText(
                                  text: 'Mua ngay',
                                  size: Dimension.font14,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: Dimension.size10,
            ),
            Container(
              padding: EdgeInsets.all(Dimension.size15),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColor.nearlyWhite,
                // border: Border(
                //   bottom: BorderSide(
                //     color: AppColor.backgroundGrey,
                //     width: 2,
                //   ),
                // ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BigText(
                    text: 'Phổ biến',
                    size: Dimension.font14,
                    fontWeight: FontWeight.w500,
                    color: AppColor.nearlyBlue,
                  ),
                  BigText(
                    text: 'Bán chạy',
                    size: Dimension.font14,
                    fontWeight: FontWeight.w500,
                  ),
                  BigText(
                    text: 'Hàng mới',
                    size: Dimension.font14,
                    fontWeight: FontWeight.w500,
                  ),
                  BigText(
                    text: 'Giá',
                    size: Dimension.font14,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(Dimension.size10),
              decoration: BoxDecoration(
                color: AppColor.backgroundGrey,
              ),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: Dimension.size300,
                  crossAxisSpacing: Dimension.size10,
                  mainAxisSpacing: Dimension.size10,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return ClipRRect(
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
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
