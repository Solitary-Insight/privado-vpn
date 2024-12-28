import 'package:flutter/material.dart';
import 'package:Privado_Vpn/utils/constants/colors.dart';
import 'package:Privado_Vpn/utils/constants/sizes.dart';
import 'package:get/get.dart';

class locations_card extends StatelessWidget {
  const locations_card({
    super.key,
    this.bgColor,
    this.image = null,
    required this.icon,
    this.iconColor = Colors.orange,
    required this.title,
    this.onPressed,
    this.showBorder = false,
    this.initials = '',
    this.count,
    this.extraInformation,
  });
  final Color? bgColor;
  final ImageProvider? image;
  final String? initials;
  final Widget? extraInformation;

  final IconData icon;
  final Color iconColor;
  final bool showBorder;
  final String title;
  final VoidCallback? onPressed;
  final int? count;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: TSizes.md),
        decoration: BoxDecoration(
            color: bgColor,
            border: showBorder ? Border.all(color: TColors.accent) : null,
            borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          leading: CircleAvatar(
            child: image == null
                ? Text(initials!)
                : CircleAvatar(
                    child: Image(
                      image: image!,
                      height: 30,
                      width: 50,
                    ),
                  ),
          ),
          // title: Text(title),
          title: Column(
            children: [
              Row(
                children: [
                  Text(count != null ? count.toString() : "",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .apply(color: TColors.primary)),
                  SizedBox(
                    width: TSizes.sm,
                  ),
                  Flexible(
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
              extraInformation ?? SizedBox()
            ],
          ),
          trailing: Icon(
            icon,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
