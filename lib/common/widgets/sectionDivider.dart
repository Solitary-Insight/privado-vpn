import 'package:flutter/material.dart';
import 'package:Privado_Vpn/utils/constants/colors.dart';

class sectionDivider extends StatelessWidget {
  const sectionDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
            child: Divider(
          color: TColors.grey,
          thickness: 0.5,
          indent: 60,
          endIndent: 5,
        )),
        Text("Or", style: Theme.of(context).textTheme.labelMedium),
        Flexible(
            child: Divider(
          color: TColors.grey,
          thickness: 0.5,
          indent: 5,
          endIndent: 60,
        ))
      ],
    );
  }
}
