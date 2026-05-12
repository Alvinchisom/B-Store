import 'package:b_store/widget/support_widget.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final List<String> categoryitem = ['Watch', 'Laptop', 'TV', 'Headphone'];
  String? value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 51, 30, 30),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(80),
                  bottomRight: Radius.circular(80),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50, left: 20),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(115, 237, 235, 235),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50, left: 10),
                    child: Text(
                      "Add Product",
                      style: AppWidget.boldTextstyle(20, Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Product Name",
                style: AppWidget.boldTextstyle(20, Colors.black),
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.only(left: 20),
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromARGB(255, 90, 11, 5)),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter product name",
                  hintStyle: AppWidget.semiBoldTextstyle(16, Colors.black54),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Product Price",
                style: AppWidget.boldTextstyle(20, Colors.black),
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.only(left: 20),
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromARGB(255, 90, 11, 5)),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter product price",
                  hintStyle: AppWidget.semiBoldTextstyle(16, Colors.black54),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Product Category",
                style: AppWidget.boldTextstyle(20, Colors.black),
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              margin: EdgeInsets.only(left: 20.0, right: 20.0),
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromARGB(255, 90, 11, 5)),
                borderRadius: BorderRadius.circular(20),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  items: categoryitem
                      .map(
                        (item) => DropdownMenuItem(
                          value: item,
                          child: Text(
                            item,
                            style: AppWidget.semiBoldTextstyle(
                              16,
                              Colors.black,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) => setState(() {
                    this.value = value;
                  }),
                  dropdownColor: Colors.white,
                  hint: Text(
                    "Select Category",
                    style: AppWidget.lightTextstyle(16, Colors.grey),
                  ),
                  iconSize: 36,
                  icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                  value: value,
                  isExpanded: true,
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Product Details",
                style: AppWidget.boldTextstyle(20, Colors.black),
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.only(left: 20),
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromARGB(255, 90, 11, 5)),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter product details",
                  hintStyle: AppWidget.semiBoldTextstyle(16, Colors.black54),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
