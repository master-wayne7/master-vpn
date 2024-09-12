import 'package:flutter/material.dart';
import 'package:master_vpn/app/services/responsive_size.dart';

class CustomRoundWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final Color color;
  final IconData? icon;
  final String? assetName;

  const CustomRoundWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.color,
    required this.icon,
  }) : assetName = null;
  const CustomRoundWidget.image({
    super.key,
    required this.title,
    required this.subTitle,
    required this.color,
    required this.assetName,
  }) : icon = null;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 46.w,
      child: Column(
        children: [
          CircleAvatar(
            radius: 32.kh,
            backgroundColor: color,
            backgroundImage: assetName != null ? AssetImage(assetName!) : null,
            child: icon != null
                ? Icon(
                    icon,
                    color: Colors.white,
                  )
                : null,
          ),
          7.kheightBox,
          Text(
            title,
            style: TextStyle(
              fontSize: 16.kh,
              fontWeight: FontWeight.w600,
            ),
          ),
          7.kheightBox,
          Text(
            subTitle,
            style: TextStyle(
              fontSize: 12.kh,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
