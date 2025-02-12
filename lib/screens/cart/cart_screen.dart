import 'package:flutter/material.dart';
import 'package:pocketplans/screens/cart/cart_widget.dart';
import 'package:pocketplans/services/assets_manager.dart';
import 'package:pocketplans/widgets/empty_bag.dart';
import 'package:pocketplans/widgets/title_text.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final bool isEmpty = false;
  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? Scaffold(
            appBar: AppBar(
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  AssetsManager.shoppingCart,
                ),
              ),
              title: const TitlesTextWidget(
                label: "Cart (6)",
              ),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.delete_forever_rounded))
              ],
            ),
            body: EmptyBagWidget(
                imagePath: AssetsManager.shoppingBasket,
                title: 'Your cart is empty',
                subtitle:
                    "Looks like your cart is empty add something and make me happy",
                buttonText: "Shop now"))
        : Scaffold(
            body: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, widget) {
                  return const CartWidget();
                }),
          );
  }
}
