import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/widgets/app_column.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/expandable_text_widget.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background image
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/image/food6.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
              )),
          //icon widget
          Positioned(
              top: 65,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(
                    icon: Icons.arrow_back_ios,
                  ),
                  AppIcon(icon: Icons.shopping_cart_outlined)
                ],
              )),
          //introduction text
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: 330,
              child: Container(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppColumn(text: "Biryani"),
                      SizedBox(
                        height: 20,
                      ),
                      BigText(text: "Introduce"),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: ExpandableTextWidget(
                              text:
                                  "Nasi biryani (Nasta'liq: بریانی; Hindi: बिरयानी; Arab: برياني) atau biriani, beriani, atau briyani adalah hidangan berupa nasi (biasanya dari beras basmati) yang dimasak dengan rempah-rempah lalu ditambah dengan sayuran, atau daging (ayam, kambing, ikan, udang atau sapi). Makanan ini berasal dari Asia Selatan (India dan Pakistan). Di Indonesia dan Malaysia, hidangan ini disebut dengan tambahan kata nasi (nasi biryani, nasi briyani, nasi briani, atau nasi beriani[1]). Nama hidangan ini (Biryani) berasal dari bahasa Persia, beryā(n) (بریان) yang berarti goreng atau panggang.[2] Pada zaman dulu, beras digoreng di dalam minyak samin sebelum direbus di dalam air bersama rempah-rempah hingga setengah matang."),
                        ),
                      )
                    ],
                  ))),
        ],
      ),
      bottomNavigationBar: Container(
          height: 120,
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 30, top: 30),
          decoration: BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20 * 2),
                  topRight: Radius.circular(20 * 2))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      Icon(Icons.remove, color: AppColors.signColor),
                      SizedBox(
                        width: 10 / 2,
                      ),
                      BigText(text: "0"),
                      SizedBox(
                        width: 10 / 2,
                      ),
                      Icon(Icons.add, color: AppColors.signColor)
                    ],
                  )),
              Container(
                padding:
                    EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
                child: BigText(
                  text: "65K | Add to cart",
                  color: Colors.white,
                ),
                decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(20)),
              )
            ],
          )),
    );
  }
}
