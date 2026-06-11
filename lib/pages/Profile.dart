import 'package:flutter/material.dart';
import 'package:b_store/widget/support_widget.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // Helper method to build the profile cards
  Widget _buildProfileItem(IconData icon, String title, String? subtitle, {bool isAction = false, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        decoration: BoxDecoration(
          color: const Color(0xFFf5ecdf), // Light tan color from screenshot
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(icon, color: const Color.fromARGB(255, 116, 95, 82), size: 30),
            const SizedBox(width: 20.0),
            Expanded(
              child: isAction 
                  ? Text(
                      title, 
                      style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: const TextStyle(color: Colors.black54, fontSize: 14)),
                        Text(subtitle ?? "", style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
            ),
            if (isAction) 
              const Icon(Icons.arrow_forward_ios, color: Colors.black54, size: 20),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 50.0),
          child: Column(
            children: [
              // Header
              Center(
                child: Text(
                  "Profile",
                  style: AppWidget.boldTextstyle(24.0, Colors.black),
                ),
              ),
              const SizedBox(height: 30.0),
              
              // Avatar
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    )
                  ]
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.asset(
                    "image/boy.png", // Often used in these tutorials
                    height: 120,
                    width: 120,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 120,
                      width: 120,
                      color: const Color(0xFFeceef0),
                      child: const Icon(Icons.person, size: 80, color: Colors.grey),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40.0),
              
              // Details
              _buildProfileItem(Icons.person_outline, "Name", "Shivam Gupta"),
              _buildProfileItem(Icons.email_outlined, "Email", "ayush282@gmail.com"),
              _buildProfileItem(
                Icons.logout, 
                "LogOut", 
                null, 
                isAction: true,
                onTap: () {
                  // TODO: Implement LogOut logic here
                },
              ),
              _buildProfileItem(
                Icons.delete_outline, 
                "Delete Account", 
                null, 
                isAction: true,
                onTap: () {
                  // TODO: Implement Delete Account logic here
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
