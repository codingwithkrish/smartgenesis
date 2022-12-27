import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartgenesis/controllers/productcontr.dart';
import 'package:smartgenesis/ui/Products/productdetail.dart';
import 'package:smartgenesis/ui/login/register.dart';

import '../../request/Request.dart';

class ProductList extends StatefulWidget {
  ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      init: ProductController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
                onTap: () async {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setBool('login', false);
                  Get.offAll(Register());
                },
                child: Icon(Icons.logout)),
            title: Container(
              color: Colors.white,
              margin: EdgeInsets.all(2),
              child: TextField(
                controller: controller.sear,
                onChanged: (value) {
                  controller.search(controller.sear.text);
                },
                decoration: InputDecoration(
                  enabled: true,
                  fillColor: Colors.white,
                  focusColor: Colors.white,
                  hoverColor: Colors.white,
                  hintText: "Search",
                ),
              ),
            ),
            actions: [
              Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: GestureDetector(
                      onTap: () {
                        controller.search(controller.sear.text);
                      },
                      child: Icon(Icons.search)))
            ],
            //centerTitle: true,
          ),
          body: SafeArea(
              child: Column(
            children: [
              Expanded(
                child: controller.productlist.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                        ),
                      )
                    : RefreshIndicator(
                        onRefresh: () {
                          return controller.getdetails();
                        },
                        child: ListView.builder(
                            itemCount: controller.productlist.length,
                            itemBuilder: (context, i) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(ProductDetails(
                                    title: controller.productlist[i].title,
                                    description:
                                        controller.productlist[i].description,
                                    price: controller.productlist[i].price,
                                    imagelink:
                                        controller.productlist[i].imagelink,
                                    category:
                                        controller.productlist[i].category,
                                    count: controller.productlist[i].count,
                                    rate: controller.productlist[i].rate,
                                  ));
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            width: 2.0,
                                            color: Colors.blueGrey)),
                                    margin: EdgeInsets.all(5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(),
                                            child: Image.network(controller
                                                .productlist[i].imagelink),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 8,
                                          child: Container(
                                            padding: EdgeInsets.all(2),
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    controller
                                                        .productlist[i].title,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 20)),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    RatingBar.builder(
                                                        direction:
                                                            Axis.horizontal,
                                                        wrapAlignment:
                                                            WrapAlignment.start,
                                                        itemSize: 25,
                                                        initialRating: double
                                                            .parse(controller
                                                                .productlist[i]
                                                                .rate),
                                                        allowHalfRating: true,
                                                        ignoreGestures: true,
                                                        minRating: double.parse(
                                                            controller
                                                                .productlist[i]
                                                                .rate),
                                                        maxRating: double.parse(
                                                            controller
                                                                .productlist[i]
                                                                .rate),
                                                        itemBuilder: (context,
                                                                _) =>
                                                            Icon(
                                                              Icons.star,
                                                              color:
                                                                  Colors.amber,
                                                              size: 2,
                                                            ),
                                                        onRatingUpdate: (rat) {
                                                          print(rat);
                                                        }),
                                                    Text(
                                                        controller
                                                            .productlist[i]
                                                            .count,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black87,
                                                            fontSize: 14))
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                    "₹ ${controller.productlist[i].price}",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 18)),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                    "Get it by tommorow , 30 December*")
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    )),
                              );
                            }),
                      ),
              ),
            ],
          )),
        );
      },
    );
  }
}
