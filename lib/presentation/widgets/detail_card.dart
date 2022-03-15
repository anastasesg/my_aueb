import 'package:flutter/material.dart';

class DetailCard extends StatefulWidget {
  final List<Widget> details;
  const DetailCard({
    Key? key,
    required this.details,
  }) : super(key: key);

  @override
  State<DetailCard> createState() => _DetailCardState();
}

class _DetailCardState extends State<DetailCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      child: Container(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0, bottom: 10.0),
        child: Column(
          children: widget.details,
        ),
      ),
    );
  }
}
