import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:b_store/services/database.dart';
import 'package:b_store/widget/support_widget.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  bool isLoading = false;

  TextEditingController productnamecontroller = TextEditingController();
  TextEditingController productpricecontroller = TextEditingController();
  TextEditingController productdetailcontroller = TextEditingController();
  TextEditingController productimagecontroller = TextEditingController();
  final List<String> categoryitem = ['T-Shirt', 'Pant', 'Shoes', 'Jacket'];
  String? value;

  Future<void> uploadItem() async {
    if (productnamecontroller.text != "" &&
        productpricecontroller.text != "" &&
        productdetailcontroller.text != "" &&
        productimagecontroller.text != "") {
      setState(() {
        isLoading = true;
      });

      Map<String, dynamic> addProduct = {
        "Image": productimagecontroller.text,
        "Name": productnamecontroller.text,
        "Price": productpricecontroller.text,
        "Detail": productdetailcontroller.text,
      };
      await DatabaseMethods().addProductDetails(addProduct, value!).then((value) {
        productnamecontroller.text = "";
        productpricecontroller.text = "";
        productdetailcontroller.text = "";
        productimagecontroller.text = "";
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              "Product has been added Successfully",
              style: TextStyle(fontSize: 20.0),
            )));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 116, 95, 82),
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
            productimagecontroller.text == ""
                ? Center(
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(Icons.camera_alt_outlined),
                    ),
                  )
                : Center(
                    child: Material(
                      elevation: 4.0,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            productimagecontroller.text,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Center(child: Icon(Icons.error_outline));
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Image Link",
                style: AppWidget.boldTextstyle(20, Colors.black),
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromARGB(255, 116, 95, 82)),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                controller: productimagecontroller,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Paste Image URL here",
                  hintStyle: AppWidget.semiBoldTextstyle(16, Colors.black54),
                ),
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
                border: Border.all(color: Color.fromARGB(255, 116, 95, 82)),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                controller: productnamecontroller,
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
                border: Border.all(color: Color.fromARGB(255, 116, 95, 82)),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                controller: productpricecontroller,
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
                border: Border.all(color: Color.fromARGB(255, 116, 95, 82)),
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
                border: Border.all(color: Color.fromARGB(255, 116, 95, 82)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: productdetailcontroller,
                maxLines: 5,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter product details",
                  hintStyle: AppWidget.semiBoldTextstyle(16, Colors.black54),
                ),
              ),
            ),
            SizedBox(height: 40),
            Center(
              child: GestureDetector(
                onTap: () {
                  uploadItem();
                },
                child: Container(
                  width: 200,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  margin: EdgeInsets.only(left: 100, right: 100),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 116, 95, 82),
                  ),
                  child: isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : Text(
                          "Add",
                          textAlign: TextAlign.center,
                          style: AppWidget.boldTextstyle(20, Colors.white),
                        ),
                ),
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
