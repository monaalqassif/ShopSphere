import '../widgets/interactive.dart';
import 'package:flutter/material.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 25,),
              CircleAvatar(
                radius: 45,
                backgroundColor: Color(0xFFD9D9D9),
                child: Icon(Icons.person,size: 55,color: Colors.grey,),
              ),
              SizedBox(height: 10),
              Text('Name',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),),
              SizedBox(height: 35),
              Interactivetile(title:'Profile', icon: Icons.person),

              SizedBox(height: 12),
              Interactivetile(title:'Setting', icon: Icons.settings),

              SizedBox(height: 12),
              Interactivetile(title:'Contact', icon: Icons.email_rounded),

              SizedBox(height: 12),
              Interactivetile(title:'Share App', icon: Icons.share),

              SizedBox(height: 12),
              Interactivetile(title:'Help', icon: Icons.help_outlined),
              Spacer(),

              TextButton(
                onPressed: () {},
                child: const Text(
                  'Sign Out',
                  style: TextStyle(
                    color: Color(0xFFF55F1F),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),),),
            ],
          ),
        ),),


    );
  }
}
