import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shamo/models/product_model.dart';

class ProductService {
  String baseUrl = 'https://shamo-backend.buildwithangga.id/api';

  // buat function
  Future<List<ProductModel>> getProduct() async {
    var url = Uri.tryParse('$baseUrl/products');
    var headers = {'content-type': 'application/json'};

    var response = await http.get(url!, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<ProductModel> products = [];
      for (var item in data) {
        products.add(ProductModel.fromJson(item));
      }

      return products;
    } else {
      throw Exception('Gagal Get Product!');
    }
  }
}