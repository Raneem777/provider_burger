
import 'package:flutter/material.dart';
import 'package:provider_burger/model/fake_data(burger).dart';
import 'package:provider_burger/model/model.dart';

class Controller extends ChangeNotifier {
  ModelData model = ModelData.fromJson(fakeData);
  List<Data?>? cartList = [];

  addTocart(Data? value) {
    cartList!.contains(value) ? null : cartList?.add(value);
   notifyListeners();
  }

  removeTocart(Data? value) {
    cartList?.remove(value);
   notifyListeners();
  }

  increament(Data? burgerData) {
    burgerData!.quantity = burgerData.quantity! + 1;
   notifyListeners();
  }

  decreament(Data? value) {
    if (value!.quantity == 0) {
    } else {
      value.quantity = value.quantity! - 1;
    }
   notifyListeners();
  }
}
