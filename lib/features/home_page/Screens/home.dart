import 'package:Privado_Vpn/common/widgets/connection_status_widget.dart';
import 'package:Privado_Vpn/features/ads/controllers/ads_controller.dart';
import 'package:Privado_Vpn/features/ads/views/banner_ad_screen.dart';
import 'package:Privado_Vpn/features/home_page/contoller/homeController.dart';
import 'package:Privado_Vpn/utils/constants/images_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:Privado_Vpn/common/widgets/connectionStatus.dart';
import 'package:Privado_Vpn/common/widgets/locationCard.dart';
import 'package:Privado_Vpn/common/widgets/sectionDivider.dart';
import 'package:Privado_Vpn/features/home_page/Screens/locationList.dart';
import 'package:Privado_Vpn/utils/constants/colors.dart';
import 'package:Privado_Vpn/utils/constants/sizes.dart';
import 'package:Privado_Vpn/utils/device/device_utility.dart';

class home extends StatelessWidget {
  const home({super.key});
  @override
  Widget build(BuildContext context) {
    homeController controller = Get.find();

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                color: Colors.white,
                height: 400,
                width: double.infinity,
              ),
              Container(
                height: 300,
                decoration: BoxDecoration(
                    color: TColors.accent,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50))),
              ),
              Positioned(
                top: 50,
                width: TDeviceUtils.getScreenWidth(context),
                child: Column(
                  children: [
                    connection_status_widget(),
                    ConnectionStatus(),
                  ],
                ),
              ),
              Positioned(
                top: 200,
                left: TDeviceUtils.getScreenWidth(context) / 2 - 100,
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                  child: Center(
                      child: Container(
                    margin: EdgeInsets.all(TSizes.md),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: TColors.accent,
                        boxShadow: const [
                          // BoxShadow(
                          //   color: Colors.grey.withOpacity(0.2), // Shadow color
                          //   spreadRadius: 6, // Spread radius
                          //   blurRadius: 20, // Blur radius
                          //   offset: Offset(1, 1), // Offset of the shadow
                          // ),
                        ]),
                    child: InkWell(
                      onTap: controller.connectClick,
                      child: Container(
                        margin: EdgeInsets.all(TSizes.lg),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.blue.withOpacity(0.3), // Shadow color
                              spreadRadius: 7, // Spread radius
                              blurRadius: 7, // Blur radius
                              offset: Offset(0, 5), // Offset of the shadow
                            ),
                          ],
                          color: TColors.white,
                        ),
                        child: Center(
                          child: Icon(
                            CupertinoIcons.power,
                            size: 40,
                            color: Colors.blue,
                            fill: 1,
                          ),
                        ),
                      ),
                    ),
                  )),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Selected Location"),
              Icon(
                Iconsax.information5,
                color: TColors.accent,
              )
            ],
          ),
          SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          Obx(
            () {
              return controller.selected_loc_name.value != ""
                  ? locations_card(
                      showBorder: true,
                      initials: controller.selected_loc_name.value
                          .substring(0, 2)
                          .capitalize,
                      icon: Iconsax.flash5,
                      bgColor: Colors.transparent,
                      title: controller.selected_loc_name.value)
                  : SizedBox();
            },
          ),
          const SizedBox(
            height: TSizes.xl,
          ),
          // todo : Section divider
          const sectionDivider(),

          const SizedBox(
            height: TSizes.xl,
          ),
          const Center(child: Text("Select Location")),
          const SizedBox(
            height: TSizes.xl,
          ),

          // todo : change location crousal
          locations_card(
              onPressed: () {
                AdsController.instance.showInterstitialAd(() {
                  Get.to(() {
                    return locationList();
                  });
                });
              },
              image: AssetImage(SolitaryImages.earth_image),
              icon: Iconsax.arrow_down_1,
              bgColor: TColors.accent,
              iconColor: Colors.grey,
              title: "LOCATIONS"),
          const SizedBox(
            height: TSizes.xl,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                CupertinoIcons.lock_circle_fill,
                color: Colors.grey,
              ),
              Text(
                " Stay Safe with",
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                " AES-256 bit Encryption",
                style: TextStyle(color: Colors.blue),
              ),
              SizedBox(height: TSizes.lg),
            ],
          ),
          banner_ad()
        ],
      ),
    ));
  }
}
