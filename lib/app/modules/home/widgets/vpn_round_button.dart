import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_vpn/app/modules/home/controllers/home_controller.dart';
import 'package:master_vpn/app/services/responsive_size.dart';

class VpnRoundButton extends StatelessWidget {
  const VpnRoundButton({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Semantics(
          button: true,
          child: GestureDetector(
            onTap: () {},
            child: Obx(
              () => SizedBox(
                height: 170.kh,
                child: Stack(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: EdgeInsets.all(14.kh),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: controller.getButtonColor.withOpacity(.1),
                      ),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: EdgeInsets.all(14.kh),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: controller.getButtonColor.withOpacity(.3),
                        ),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width: 30.w,
                          padding: EdgeInsets.all(18.kh),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: controller.getButtonColor,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.power_settings_new,
                                size: 30.kh,
                                color: Colors.white,
                              ),
                              6.kheightBox,
                              Text(
                                controller.getButtonText,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12.kh,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(100.kh),
                          onTap: () {},
                          overlayColor: WidgetStatePropertyAll<Color>(
                            Colors.white.withOpacity(0.3),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
