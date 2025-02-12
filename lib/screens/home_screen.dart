import 'package:flutter/material.dart';
import 'package:pocketplans/services/assets_manager.dart';
import 'package:pocketplans/utils/menu_item.dart';
import 'package:pocketplans/widgets/app_name_text.dart';
import 'package:card_swiper/card_swiper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> bannerImages = [AssetsManager.banner1, AssetsManager.banner2];
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            AssetsManager.shoppingBasket,
          ),
        ),
        title: const AppNameTextWidget(fontSize: 20),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: size.height * 0.25,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Image.asset(
                  bannerImages[index],
                  fit: BoxFit.fill,
                );
              },
              itemCount: bannerImages.length,
              pagination: SwiperPagination(),
            ),
          ),
          const Text(
            "Categories",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(255, 255, 255, 1),
            ),
          ),
          const MyMenuItem(),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Events",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(255, 255, 255, 1),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          GridView.builder(
              itemCount: 8,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 0.9,
              ),
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.blueGrey.shade100,
                );
              }),
        ]),
      ),
    );
  }
}
