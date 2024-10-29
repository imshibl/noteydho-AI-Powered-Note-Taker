import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:noteydho/utils/consts/consts.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: Consts.margin10,
      ),
      padding: const EdgeInsets.all(Consts.padding10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Consts.radius10,
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            height: 30,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall,
          )
        ],
      ),
    );
  }
}
