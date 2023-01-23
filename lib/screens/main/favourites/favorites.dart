import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/components/custom_text.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      child: Container(
        child: Center(
          child: CustomText(
            "Favorites",
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
