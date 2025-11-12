import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harry_potter_app/core/utils/size_config.dart';

class CustomSearchBar extends StatelessWidget {
  final String hintText;
  final void Function(String) onSearch;
  final TextEditingController? controller;
  const CustomSearchBar({
    super.key,
    required this.hintText,
    required this.onSearch,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockWidth * 4),
      child: TextField(
        controller: controller,
        onChanged: onSearch,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            vertical: SizeConfig.blockHeight * 1.5,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(SizeConfig.blockWidth * 2.5),
          ),
          filled: true,
          fillColor: Theme.of(context).cardColor,
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockWidth * 3,
            ),
            child: FaIcon(FontAwesomeIcons.magnifyingGlass, size: 20),
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 0,
            minHeight: 0,
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}
