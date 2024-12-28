import 'package:Privado_Vpn/features/home_page/contoller/homeController.dart';
import 'package:Privado_Vpn/models/vpn_status.dart';
import 'package:Privado_Vpn/services/vpn_engine.dart';
import 'package:Privado_Vpn/utils/constants/images_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Privado_Vpn/utils/constants/sizes.dart';
import 'package:Privado_Vpn/utils/device/device_utility.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ConnectionStatus extends StatelessWidget {
  const ConnectionStatus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final homeController controller = Get.find();
    return SizedBox(
      width: TDeviceUtils.getScreenWidth(context),
      child: Column(
        children: [
          Obx(() {
            if (controller.vpnState.value == "connecting" ||
                controller.vpnState.value == "wait_connection" ||
                controller.vpnState.value == "authenticating") {
              return SizedBox(
                  height: 150,
                  child: Lottie.asset(SolitaryImages.fox_running_animation));
            } else if (controller.vpnState.value == "connected") {
              return Column(
                children: [
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Icon(
                              CupertinoIcons.arrow_up_arrow_down_circle_fill,
                              color: Colors.green,
                              size: 36,
                            ),
                            StreamBuilder<VpnStatus?>(
                              initialData: VpnStatus(),
                              stream: VpnEngine.vpnStatusSnapshot(),
                              builder: (context, snapshot) => Column(
                                children: [
                                  Text(
                                    "${snapshot.data?.byteOut ?? "0.0 kB - 0.0kB/s"}",
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .apply(color: Colors.green),
                                  ),
                                  Text(
                                      "${snapshot.data?.byteIn ?? "0.0 kB - 0.0kB/s"}",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .apply(color: Colors.orange))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 0,
                        child: SizedBox(
                          height: 50,
                          width: 2,
                          child: Container(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Duration",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .apply(
                                      color: Colors.white,
                                      overflow: TextOverflow.ellipsis),
                            ),
                            Obx(() => Text(
                                  controller.timer_String.value,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .apply(
                                          color: Colors.white,
                                          overflow: TextOverflow.ellipsis),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              );
            } else {
              return SizedBox(
                  height: 100,
                  child: Lottie.asset(SolitaryImages.failed_animation));
            }
          }),
        ],
      ),
    );
  }
}
