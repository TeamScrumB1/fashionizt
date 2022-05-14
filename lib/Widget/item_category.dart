import 'package:flutter/material.dart';

class ItemCategory extends StatelessWidget {
  ItemCategory({
    required this.nama,
    required this.img,
  });

  String nama;
  String img;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 100,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 7),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(
                      img,
                      fit: BoxFit.cover,
                    )
                ),
              ),
            ),
            Text(nama),
          ],
        ),
      ),
    );
  }
}
