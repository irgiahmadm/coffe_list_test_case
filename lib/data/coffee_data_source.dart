import 'package:dio/dio.dart';

import '../models/coffee_model.dart';
import '../network/dio_instance.dart';

class CoffeDataSource {
  static Future<List<CoffeeResponse>> getListCoffee() async {
    Response<String> response = await DioInstance.dio.get('coffee/hot');

    return coffeeResponseFromJson(response.data ?? "");
  }
}
