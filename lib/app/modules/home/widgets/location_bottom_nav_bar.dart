import 'package:flutter/material.dart';

class LocationSelectionBottomNavBar extends StatelessWidget {
  const LocationSelectionBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Semantics(
        button: true,
        child: InkWell(
          onTap: () {
            // Navigate to the location selection screen
          },
          child: Padding(padding: EdgeInsetsGeometry),
        ),
      ),
    );
  }
}
