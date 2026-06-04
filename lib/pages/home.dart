import 'package:flutter/material.dart';
import 'package:b_store/widget/support_widget.dart';
import 'package:b_store/pages/detail_page.dart';
import 'package:b_store/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Stream? productsStream;

  void getontheload() {
    productsStream = DatabaseMethods().getAllProducts();
    setState(() {});
  }

  @override
  void initState() {
    getontheload();
    super.initState();
  }

  Widget allProduct() {
    return StreamBuilder(
      stream: productsStream,
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.data.docs.isEmpty) {
          return const Center(
            child: Text(
              "No products available yet.",
              style: TextStyle(color: Colors.black54, fontSize: 16),
            ),
          );
        }

        return ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: snapshot.data.docs.length,
          itemBuilder: (context, index) {
            DocumentSnapshot ds = snapshot.data.docs[index];

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      image: ds["Image"] ?? "",
                      name: ds["Name"] ?? "Product Name",
                      price: "\$${ds["Price"] ?? "0"}",
                      detail: ds["Detail"] ?? "",
                    ),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(right: 15.0),
                width: 160,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: ds["Image"] != null && ds["Image"] != ""
                          ? Image.network(
                              ds["Image"],
                              height: 150,
                              width: 160,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Center(
                                    child: Icon(Icons.broken_image, size: 50),
                                  ),
                            )
                          : const Center(child: Icon(Icons.image, size: 50)),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.7),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              ds["Name"] ?? "Unknown",
                              style: AppWidget.boldTextstyle(16, Colors.white),
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              "\$${ds["Price"] ?? "0"}",
                              style: AppWidget.boldTextstyle(
                                14,
                                Colors.white70,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Location",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 5.0),
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Color.fromARGB(255, 14, 13, 0),
                  ),
                  Text(
                    "123 Main St",
                    style: AppWidget.boldTextstyle(20, Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Container(
                padding: const EdgeInsets.only(left: 20.0),
                margin: const EdgeInsets.only(right: 20.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFeceef0),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search items",
                    hintStyle: TextStyle(
                      color: Colors.black45,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    suffixIcon: Icon(Icons.search, color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                margin: const EdgeInsets.only(right: 20.0),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        "image/banner.png",
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 20,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 116, 95, 82),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          "Shop Now",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                "Category",
                style: AppWidget.boldTextstyle(22, Colors.black),
              ),
              const SizedBox(height: 15.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    AppWidget.categoryItem("image/tshirt_new.png", "T-Shirt"),
                    AppWidget.categoryItem("image/shoes.png", "Shoes"),
                    AppWidget.categoryItem("image/jacket.png", "Jacket"),
                    AppWidget.categoryItem("image/jeans.png", "Jeans"),
                    AppWidget.categoryItem("image/dress.png", "Dress"),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                "Flash Sales",
                style: AppWidget.boldTextstyle(22, Colors.black),
              ),
              const SizedBox(height: 15.0),
              SizedBox(height: 160, child: allProduct()),
            ],
          ),
        ),
      ),
    );
  }
}
