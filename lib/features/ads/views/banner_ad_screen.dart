import 'package:Privado_Vpn/common/widgets/loaders.dart';
import 'package:Privado_Vpn/features/ads/controllers/ads_controller.dart';
import 'package:Privado_Vpn/utils/constants/colors.dart';
import 'package:Privado_Vpn/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class banner_ad extends StatelessWidget {
  const banner_ad({super.key});

  @override
  Widget build(BuildContext context) {
    AdsController controller = Get.find();

    return Container(
      child: Obx(() => controller.isBannerAdLoaded.value
          ? SizedBox(
              height: controller.bannerAd.size.height.toDouble(),
              width: controller.bannerAd.size.width.toDouble(),
              child: AdWidget(
                ad: controller.bannerAd,
              ),
            )
          : Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(
                  horizontal: TSizes.md, vertical: TSizes.md),
              decoration: BoxDecoration(
                  color: TColors.buttonDisabled,
                  borderRadius: BorderRadius.circular(TSizes.borderRadiusSm)),
              child: SizedBox())),
    );
  }
}
