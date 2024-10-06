import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_vpn/app/data/models/vpn_info_model.dart';
import 'package:master_vpn/app/extensions/app_theme.dart';
import 'package:master_vpn/app/modules/location/controllers/location_controller.dart';
import 'package:master_vpn/app/services/responsive_size.dart';
import 'package:master_vpn/app/utils/formatter.dart';

class VpnLocationCard extends StatelessWidget {
  final VpnInfoModel vpnInfo;
  const VpnLocationCard({super.key, required this.vpnInfo});

  @override
  Widget build(BuildContext context) {
    LocationController controller = Get.find();
    return InkWell(
      onTap: () => controller.selectVpnLocationAndConnect(vpnInfo),
      borderRadius: BorderRadius.circular(16.kh),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.kh)),
        leading: Container(
          padding: EdgeInsets.all(0.5.kh),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(16.kh),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.kh),
            child: Image.asset(
              "assets/flags/${vpnInfo.countryShortName.toLowerCase()}.png",
              height: 40.kh,
              width: 15.w,
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(vpnInfo.countryLongName),
        subtitle: Row(
          children: [
            Icon(
              Icons.network_check_rounded,
              size: 20.kh,
              color: Colors.redAccent,
            ),
            5.kwidthBox,
            Text(
              formatSpeedBytes(vpnInfo.speed),
              style: TextStyle(fontSize: 13.kh),
            ),
            10.kwidthBox,
            Icon(
              Icons.network_cell,
              size: 20.kh,
              color: Colors.redAccent,
            ),
            5.kwidthBox,
            Text(
              "${vpnInfo.ping}ms",
              style: TextStyle(fontSize: 13.kh),
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              vpnInfo.vpnSessionsNum.toString(),
              style: TextStyle(
                fontSize: 13.kh,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).lightTextColor,
              ),
            ),
            5.kwidthBox,
            const Icon(
              Icons.person_2_outlined,
              color: Colors.redAccent,
            )
          ],
        ),
      ),
    );
  }
}
