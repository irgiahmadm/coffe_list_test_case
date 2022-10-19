import 'package:flutter/cupertino.dart';
import 'package:hot_coffee/data/coffee_data_source.dart';
import 'package:hot_coffee/models/coffee_model.dart';

class CoffeeProvider with ChangeNotifier {
  Future<List<CoffeeResponse>> getListCoffee() async {
    return await CoffeDataSource.getListCoffee();
  }
}
