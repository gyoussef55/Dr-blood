import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  CustomCard({required this.imgPath,required this.title,required this.subtitle,super.key});
  String imgPath;
  String title;
  String subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: const Color.fromRGBO(196, 196, 196, 1),
          child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          children: [
            Image.asset(
              imgPath,
            ),
             Expanded(
              child: ListTile(
                title: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(166, 0, 0, 1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  subtitle,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
