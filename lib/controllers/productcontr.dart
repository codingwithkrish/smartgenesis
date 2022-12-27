import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:smartgenesis/model/productmodel.dart';
import 'package:smartgenesis/request/Request.dart';

class ProductController extends GetxController {
  List<ProductModels> productlist = [];
  TextEditingController sear = new TextEditingController();
  ProductController() {
    getdetails();
  }

  Future<void> getdetails() async {
    productlist.clear();
    List list = await Request().getrequest();

    list.forEach(
      (element) {
        print(element);
        productlist.add(ProductModels.fromMap(element));
      },
    );
    update();
    print(productlist.length);
  }

  search(String query) {
    if (query.isEmpty) {
      productlist.clear();
      update();
      getdetails();
    } else {
      final suggestion = productlist.where((element) {
        final title = element.title.toLowerCase();
        final input = query.toLowerCase();
        return title.contains(input);
      }).toList();
      productlist = suggestion;
      update();
    }
  }
}
