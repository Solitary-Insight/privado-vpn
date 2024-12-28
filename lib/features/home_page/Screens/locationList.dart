import 'package:Privado_Vpn/common/widgets/connection_status_widget.dart';
import 'package:Privado_Vpn/features/home_page/contoller/homeController.dart';
import 'package:Privado_Vpn/features/home_page/contoller/locationsController.dart';
import 'package:Privado_Vpn/models/vpn_config.dart';
import 'package:Privado_Vpn/utils/constants/images_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:Privado_Vpn/common/widgets/locationCard.dart';
import 'package:Privado_Vpn/utils/constants/colors.dart';
import 'package:Privado_Vpn/utils/constants/sizes.dart';
import 'package:lottie/lottie.dart';

class locationList extends StatelessWidget {
  const locationList({super.key});
  @override
  Widget build(BuildContext context) {
    locationsController loc_controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColors.accent,
        shadowColor: Colors.grey,
        title: Text(
          "Servers locations",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .apply(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: TSizes.md),
                  child: connection_status_widget(),
                ),
                Container(
                    decoration: BoxDecoration(
                        color: TColors.accent,
                        borderRadius: BorderRadius.all(
                            Radius.circular(TSizes.cardRadiusLg))),
                    child: Column(
                      children: [
                        Center(child: Text("Existing Servers")),
                      ],
                    )),
              ],
            ),
          ),
          ListView.separated(
              shrinkWrap: true,
              itemBuilder: (__, index) {
                return locations_card(
                    onPressed: (() {
                      homeController.instance.locationClicked(
                          loc_controller.loaded_vpnList[index]);
                    }),
                    initials: loc_controller.loaded_vpnList[index].country
                        .substring(0, 2)
                        .capitalize,
                    icon: Iconsax.flash5,
                    bgColor: Colors.transparent,
                    iconColor: Colors.grey,
                    count: index + 1,
                    title: loc_controller.loaded_vpnList[index].country);
              },
              separatorBuilder: (_, index) => Container(
                    margin: EdgeInsets.symmetric(
                        vertical: TSizes.sm, horizontal: TSizes.xl),
                    height: 1,
                    color: TColors.grey,
                  ),
              itemCount: loc_controller.loaded_vpnList.length),
          // SizedBox(height: TSizes.sm),

          Padding(
            padding: const EdgeInsets.all(TSizes.md),
            child: Container(
                decoration: BoxDecoration(
                    color: TColors.accent,
                    borderRadius:
                        BorderRadius.all(Radius.circular(TSizes.cardRadiusLg))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("New Servers"),
                      IconButton(
                          onPressed: () {
                            locationsController.instance.handleLocationsData();
                          },
                          icon: Icon(Iconsax.refresh)),
                    ],
                  ),
                )),
          ),
          Obx(() => loc_controller.areServerLoading.value
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: SizedBox(
                          height: 200,
                          child:
                              Lottie.asset(SolitaryImages.loading_animation)),
                    ),
                  ],
                )
              : Text("")),
          Obx(() => locationsController.instance.connectionStatus.value
              ? SizedBox()
              : Container(
                  decoration: BoxDecoration(
                      color: TColors.error,
                      borderRadius:
                          BorderRadius.circular(TSizes.borderRadiusSm)),
                  child: Padding(
                    padding: EdgeInsets.all(TSizes.md),
                    child: Text(
                      "Looks like you have internet connection issue!",
                      style: TextStyle(color: TColors.light),
                    ),
                  ),
                )),
          Obx(() => !loc_controller.areServerLoading.value
              ? Flexible(
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (__, index) {
                        final VpnConfig vpn_item =
                            loc_controller.vpnList[index];
                        return locations_card(
                            onPressed: (() {
                              homeController.instance.locationClicked(vpn_item);
                            }),
                            initials:
                                vpn_item.country.substring(0, 2).capitalize,
                            icon: Iconsax.flash5,
                            bgColor: Colors.transparent,
                            iconColor: Colors.grey,
                            count: index + 1,
                            extraInformation: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Ping : ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .apply(color: Colors.orange),
                                ),
                                SizedBox(
                                  width: TSizes.sm,
                                ),
                                Text(
                                  vpn_item.ping.toString() + 'ms',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .apply(color: Colors.orange),
                                )
                              ],
                            ),
                            title: vpn_item.country);
                      },
                      separatorBuilder: (_, index) => Container(
                            margin: EdgeInsets.symmetric(
                                vertical: TSizes.sm, horizontal: TSizes.xl),
                            height: 1,
                            color: TColors.grey,
                          ),
                      itemCount: loc_controller.vpnList.length))
              : Text("Loading more servers might take some time"))
        ],
      ),
    );
  }
}
