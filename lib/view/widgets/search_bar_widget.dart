import 'package:be_talent/view/resources/colors.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String text) onChanged;
  const SearchBarWidget({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(
            left: 18,
            top: 24,
            bottom: 15,
          ),
          child: Text(
            'Funcionários',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            controller: controller,
            onChanged: onChanged,
            decoration: InputDecoration(
              prefixIcon: const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Icon(
                  Icons.search,
                  size: 24,
                ),
              ),
              hintText: 'Search...',
              hintStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              filled: true,
              fillColor: AppColors.gray05,
              contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
