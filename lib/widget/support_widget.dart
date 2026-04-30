import 'package:flutter/material.dart';

class AppWidget {
  static TextStyle boldTextstyle(double size, Color color) {
    return TextStyle(color: color, fontSize: size, fontWeight: FontWeight.bold);
  }

  static Widget categoryItem(String imagePath, String name) {
    return Container(
      margin: EdgeInsets.only(right: 20.0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Color(0xFFeceef0),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              imagePath,
              height: 40,
              width: 40,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) =>
                  Icon(Icons.category, size: 40),
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            name,
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  static Widget nonSelected(String size) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Color(0xFFeceef0),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(size, style: AppWidget.boldTextstyle(20, Colors.black)),
      ),
    );
  }

  static Widget selectedone(String size) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 116, 95, 82),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(size, style: AppWidget.boldTextstyle(20, Colors.white)),
      ),
    );
  }

  static Widget nonSelectedcolor(String color) {
    return Container(
      height: 50,
      width: 70,
      decoration: BoxDecoration(
        color: Color(0xFFeceef0),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(color, style: AppWidget.boldTextstyle(18, Colors.black)),
      ),
    );
  }

  static Widget selectedcolor(String color) {
    return Container(
      height: 50,
      width: 70,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 116, 95, 82),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(color, style: AppWidget.boldTextstyle(18, Colors.white)),
      ),
    );
  }
}
