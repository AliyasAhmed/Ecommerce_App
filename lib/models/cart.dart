import 'package:app/models/shoe.dart';
import 'package:flutter/foundation.dart';

class Cart extends ChangeNotifier {
  // list of shoes for sale

  List shoeShop = [
    Shoe(
      name: " Zoom FREAK",
      price: "700",
      description: "This is the beast of Shoes",
      imagePath: "lib/images/nikeair.png",
    ),
    Shoe(
      name: "Air Jordan",
      price: "1200",
      description: "Air Jordan Famous High quality shoes",
      imagePath: "lib/images/airJordan.png",
    ),
    Shoe(
      name: "Jordan Leather",
      price: "500",
      description: "Air Jordan Leather Version",
      imagePath: "lib/images/Jordan.png",
    ),
    Shoe(
      name: "Jordan Art",
      price: "1500",
      description: "Air Jordan Art Version",
      imagePath: "lib/images/nikeAir2.png",
    ),
  ];
  // list of items in user cart
  List userCart = [];

  // get list of shoes for sale
  List getShoeList() { // used to display available shoes in the shop page.
    return shoeShop;
  }
  // get cart

  List getUserCart() { // used to display items in the cart page.
    return userCart;
  }

  // add items to cart
  void addItemToCart(Shoe shoe) { // used to add shoes to cart
    userCart.add(shoe);
    notifyListeners();
  }

  // remove items from cart
  void removeItemFromCart(Shoe shoe) { // used to remove shoes from cart
    userCart.remove(shoe);
    notifyListeners();
  }
}
