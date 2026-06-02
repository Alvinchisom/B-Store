import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addUserDetails(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .set(userInfoMap);
  }

  Future addProductDetails(Map<String, dynamic> productInfoMap, String categoryName) async {
    // Add the category identifier inside the map data
    productInfoMap["Category"] = categoryName;

    // Save directly to the central "Products" collection so Home page reads it
    return await FirebaseFirestore.instance
        .collection("Products")
        .add(productInfoMap);
  }
  
  Stream<QuerySnapshot> getAllProducts() {
    return FirebaseFirestore.instance.collection("Products").snapshots();
  }
}