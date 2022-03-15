import 'package:flutter/material.dart';

class DayWidget extends StatelessWidget {
  final double size;
  final String day;
  final Color color;
  final int count;
  const DayWidget({
    Key? key,
    required this.day,
    this.size = 50,
    this.color = const Color(0xFFFFFFFF),
    this.count = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> dots = [];
    for (int i = 0; i < count; i++) {
      dots.add(SizedBox(
        width: 3,
        height: 3,
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFFFFFFF),
            shape: BoxShape.circle,
          ),
        ),
      ));
      if (i < count - 1) {
        dots.add(const SizedBox(width: 5));
      }
    }
    bool filled = count > 0;
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        width: size,
        height: size,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                day,
                style: TextStyle(
                  color: filled ? Color(Colors.white.value) : color,
                  fontSize: 30,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: dots,
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: filled ? color : null,
            border: Border.all(color: color, width: 1.5),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
