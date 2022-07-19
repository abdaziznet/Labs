import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/big_text.dart';

class RecommendedFoodDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyStaTefullWidget();
  }
}

class MyStaTefullWidget extends StatefulWidget {
  @override
  State<MyStaTefullWidget> createState() => _MyStaTefullWidgetState();
}

class _MyStaTefullWidgetState extends State<MyStaTefullWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 80,
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(icon: Icons.clear),
                  AppIcon(icon: Icons.shopping_cart_outlined)
                ]),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                child: Center(
                  child: BigText(
                    text: "Biryani Turkey",
                    size: 26,
                  ),
                ),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.mainColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
              "assets/image/food0.jpg",
              width: double.maxFinite,
              fit: BoxFit.cover,
            )),
          ),
          SliverToBoxAdapter(
              child: BigText(
            text:
                "Nasi biryani (Nasta'liq: بریانی; Hindi: बिरयानी; Arab: برياني) atau biriani, beriani, atau briyani adalah hidangan berupa nasi (biasanya dari beras basmati) yang dimasak dengan rempah-rempah lalu ditambah dengan sayuran, atau daging (ayam, kambing, ikan, udang atau sapi). Makanan ini berasal dari Asia Selatan (India dan Pakistan). Di Indonesia dan Malaysia, hidangan ini disebut dengan tambahan kata nasi (nasi biryani, nasi briyani, nasi briani, atau nasi beriani[1]). Nama hidangan ini (Biryani) berasal dari bahasa Persia, beryā(n) (بریان) yang berarti goreng atau panggang.[2] Pada zaman dulu, beras digoreng di dalam minyak samin sebelum direbus di dalam air bersama rempah-rempah hingga setengah matang.Biryani dibuat dari beras yang sudah direbus di panci terpisah. Setelah beras setengah matang, beras dicampur dengan kaldu berbumbu, ditutup rapat di dalam panci, dan dimasak hingga matang sampai kaldu terserap ke dalam nasi. Biryani berbeda dengan pullao dalam cara memasak. Kalau memasak pullao, beras digoreng bersama rempah-rempah di dalam minyak samin, dan langsung dimasak hingga matang.Pelancong dan pedagang dari bangsa Persia memperkenalkan cara memasak biryani kepada orang India dan Pakistan. Hidangan ini tidak hanya populer di India dan Pakistan; melainkan juga di Irak, Iran, Afganistan, Bangladesh, dan kalangan penduduk muslim Sri Lanka.",
          ))
        ],
      ),
    );
  }
}
