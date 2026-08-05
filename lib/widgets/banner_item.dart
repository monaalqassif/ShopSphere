import 'package:flutter/material.dart';

class BannerItem extends StatefulWidget {
  final List<Map<String, String>> banners;

  const BannerItem({super.key, required this.banners});

  @override
  State<BannerItem> createState() => _BannerItemState();
}

class _BannerItemState extends State<BannerItem> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 160,
          child: PageView.builder(
            itemCount: widget.banners.length,
            onPageChanged: (index) => setState(() => currentIndex = index),
            itemBuilder: (context, index) {
              final banner = widget.banners[index];
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xff6055D8),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Text(
                          banner["title"]!,
                          style:  TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                       SizedBox(height: 4),
                        Text(
                          banner["offer"]!,
                          style:  TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                       SizedBox(height: 4),
                        Text(
                          banner["subtitle"]!,
                          style:  TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      banner["image"]!,
                      height: 110,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.banners.length,
                (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: currentIndex == index
                    ? const Color(0xff6055D8)
                    : Colors.grey.shade300,
              ),
            ),
          ),
        ),
      ],
    );
  }
}