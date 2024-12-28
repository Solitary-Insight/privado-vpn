import 'package:Privado_Vpn/features/home_page/contoller/homeController.dart';
import 'package:Privado_Vpn/services/vpn_engine.dart';
import 'package:Privado_Vpn/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class connection_status_widget extends StatelessWidget {
  const connection_status_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    homeController controller = Get.find();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding:
              EdgeInsets.symmetric(vertical: TSizes.xs, horizontal: TSizes.sm),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3), // Shadow color
                spreadRadius: 1, // Spread radius
                blurRadius: 20, // Blur radius
                offset: Offset(0, 0), // Offset of the shadow
              ),
            ],
          ),
          child: Obx(() => Text(
                controller.vpnState == VpnEngine.vpnWaitConnection
                    ? "WAITING CONNECTION"
                    : controller.vpnState.value
                        .replaceAll("_", " ")
                        .toUpperCase(),
                style: Theme.of(context).textTheme.titleMedium!.apply(
                    color: controller.vpnState.value == "disconnected" ||
                            controller.vpnState.value == "denied"
                        ? Colors.red
                        : controller.vpnState.value == "connected"
                            ? Colors.green
                            : Colors.yellow),
              )),
        )
      ],
    );
  }
}
