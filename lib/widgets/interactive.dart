import 'package:flutter/material.dart';
class Interactivetile extends StatefulWidget {
  const Interactivetile({super.key, required this.title, required this.icon});

  final String title;
  final IconData icon;

  @override
  State<Interactivetile> createState() => _InteractivetileState();
}

class _InteractivetileState extends State<Interactivetile> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_){
        setState(() {
          isPressed=true;
        });
      },
      onTapUp: (_){
        setState(() {
          isPressed=false;
        });
      },
      onTapCancel: (){
        setState(() {
          isPressed=false;
        });
      },

      child: Container(
        height: 48,
        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        decoration: BoxDecoration(
          color: Color(0xFFF8F7F7),
          borderRadius: BorderRadius.circular(8),
          boxShadow: isPressed?[
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ]:[],
        ),
        child: Row(
          children: [
            Icon(widget.icon,
              color: Colors.black87,
            ),

            SizedBox(width: 12),
            Text(widget.title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w600,

              ), ),
            Spacer(),
            Icon(Icons.chevron_right,
              color: Colors.black87,),
          ],
        ),
      ) ,

    );

  }
}
