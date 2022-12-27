import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class ProductDetails extends StatefulWidget {
  String title;
  String price;
  String description;
  String category;
  String imagelink;
  String rate;
  String count;
  ProductDetails(
      {Key? key,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.imagelink,
      required this.rate,
      required this.count})
      : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back_ios_sharp)),
        title: Container(
          color: Colors.white,
          margin: EdgeInsets.all(2),
          child: TextField(
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
          Padding(padding: EdgeInsets.only(right: 10), child: Icon(Icons.mic))
        ],
      ),
      body: SafeArea(
          child: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
              padding: EdgeInsets.all(10),
              child: Text(
                widget.title,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w800),
              )),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(10),
            child: Image.network(
              widget.imagelink,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Category : ${widget.category}",
                style: TextStyle(color: Colors.black87, fontSize: 17),
              )),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text(
                  "₹",
                  style: TextStyle(fontSize: 50),
                ),
                Text(
                  widget.price,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text("Customer reviews insight",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600))),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              children: [
                RatingBar.builder(
                    direction: Axis.horizontal,
                    wrapAlignment: WrapAlignment.start,
                    itemSize: 25,
                    initialRating: double.parse(widget.rate),
                    allowHalfRating: true,
                    ignoreGestures: true,
                    minRating: double.parse(widget.rate),
                    maxRating: double.parse(widget.rate),
                    itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 2,
                        ),
                    onRatingUpdate: (rat) {
                      print(rat);
                    }),
                Text("  ${widget.rate} out of 5 star",
                    style: TextStyle(color: Colors.black87, fontSize: 17))
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text("${widget.count} ratings",
                  style: TextStyle(color: Colors.black87, fontSize: 18))),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text("Proceed to CheckOut",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600)),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text("Total:",
                    style: TextStyle(color: Colors.black87, fontSize: 18)),
                Text(
                  "  ₹",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                Text(widget.price,
                    style: TextStyle(color: Colors.black, fontSize: 20))
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text("Free delivery till Wednesday ,30 December",
                style: TextStyle(color: Colors.black87, fontSize: 18)),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text("OR Get it by tommorow in premimum",
                style: TextStyle(color: Colors.black87, fontSize: 18)),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Icon(Icons.location_pin),
                Text(
                  "Deliver to Krish - Pune 41108",
                  style: TextStyle(color: Colors.black87, fontSize: 18),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50),
            padding: EdgeInsets.symmetric(vertical: 25),
            decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(30)),
            alignment: Alignment.center,
            child: Text(
              "Add to Cart",
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50),
            padding: EdgeInsets.symmetric(vertical: 25),
            decoration: BoxDecoration(
                color: Colors.blueGrey.shade300,
                borderRadius: BorderRadius.circular(30)),
            alignment: Alignment.center,
            child: Text(
              "Buy Now",
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      )),
    );
  }
}
