import 'package:flutter/material.dart';
import 'package:b_store/widget/support_widget.dart';

class DetailPage extends StatefulWidget {
  final String image, name, price;
  const DetailPage({
    super.key,
    required this.image,
    required this.name,
    required this.price,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool medium = true, large = false, xlarge = false, xxlarge = false;
  bool blue = true, black = false, red = false, white = false;
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 20.0),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      widget.image,
                      height: MediaQuery.of(context).size.height / 1.7,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.name,
                          style: AppWidget.boldTextstyle(28, Colors.black),
                        ),
                        Text(
                          widget.price,
                          style: TextStyle(
                            color: Color.fromARGB(255, 116, 95, 82),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      "Details",
                      style: AppWidget.boldTextstyle(18, Colors.black),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "This is a premium product made with high-quality materials. It features a modern design that is perfect for any occasion. Comfortable, stylish, and durable.",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      "Select Size",
                      style: AppWidget.boldTextstyle(18, Colors.black),
                    ),
                    Container(
                      height: 50,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                medium = true;
                                large = false;
                                xlarge = false;
                                xxlarge = false;
                              });
                            },
                            child: medium
                                ? AppWidget.selectedone("M")
                                : AppWidget.nonSelected("M"),
                          ),
                          SizedBox(width: 20.0),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                medium = false;
                                large = true;
                                xlarge = false;
                                xxlarge = false;
                              });
                            },
                            child: large
                                ? AppWidget.selectedone("L")
                                : AppWidget.nonSelected("L"),
                          ),
                          SizedBox(width: 20.0),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                medium = false;
                                large = false;
                                xlarge = true;
                                xxlarge = false;
                              });
                            },
                            child: xlarge
                                ? AppWidget.selectedone("XL")
                                : AppWidget.nonSelected("XL"),
                          ),
                          SizedBox(width: 20.0),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                medium = false;
                                large = false;
                                xlarge = false;
                                xxlarge = true;
                              });
                            },
                            child: xxlarge
                                ? AppWidget.selectedone("XXL")
                                : AppWidget.nonSelected("XXL"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      "Select Color",
                      style: AppWidget.boldTextstyle(18, Colors.black),
                    ),
                    Container(
                      height: 50,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                blue = true;
                                black = false;
                                red = false;
                                white = false;
                              });
                            },
                            child: blue
                                ? AppWidget.selectedcolor("Blue")
                                : AppWidget.nonSelectedcolor("Blue"),
                          ),
                          SizedBox(width: 10.0),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                blue = false;
                                black = true;
                                red = false;
                                white = false;
                              });
                            },
                            child: black
                                ? AppWidget.selectedcolor("Black")
                                : AppWidget.nonSelectedcolor("Black"),
                          ),
                          SizedBox(width: 10.0),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                blue = false;
                                black = false;
                                red = true;
                                white = false;
                              });
                            },
                            child: red
                                ? AppWidget.selectedcolor("Red")
                                : AppWidget.nonSelectedcolor("Red"),
                          ),
                          SizedBox(width: 10.0),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                blue = false;
                                black = false;
                                red = false;
                                white = true;
                              });
                            },
                            child: white
                                ? AppWidget.selectedcolor("White")
                                : AppWidget.nonSelectedcolor("White"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      "Quantity",
                      style: AppWidget.boldTextstyle(18, Colors.black),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      height: 50,
                      width: 160,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black26),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (quantity > 1) {
                                setState(() {
                                  quantity--;
                                });
                              }
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 116, 95, 82),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Icon(Icons.remove, color: Colors.white),
                            ),
                          ),
                          Text(
                            quantity.toString(),
                            style: AppWidget.boldTextstyle(20, Colors.black),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                quantity++;
                              });
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 116, 95, 82),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Icon(Icons.add, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Price",
                          style: AppWidget.boldTextstyle(20, Colors.black),
                        ),
                        Text(
                          "\$${(int.parse(widget.price.replaceAll("\$", "")) * quantity).toString()}",
                          style: TextStyle(
                            color: Color.fromARGB(255, 116, 95, 82),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 116, 95, 82),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          "Buy Now",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
