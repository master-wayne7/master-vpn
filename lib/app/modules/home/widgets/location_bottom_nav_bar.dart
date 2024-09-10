import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:master_v_p_n/app/services/responsive_size.dart';

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
          child: DecoratedBox(
            decoration: const BoxDecoration(color: Colors.redAccent),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.1.w),
              child: SizedBox(
                height: 62.kh,
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.flag_circle,
                      color: Colors.white,
                      size: 36.kh,
                    ),
                    12.kwidthBox,
                    Text(
                      "Select Country / Location",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.kh,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const Spacer(),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.redAccent,
                        size: 26.kh,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
