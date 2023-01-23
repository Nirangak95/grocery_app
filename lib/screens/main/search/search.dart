import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/components/custom_text.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      child: Container(
        child: Center(
          child: CustomText(
            "Search",
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
