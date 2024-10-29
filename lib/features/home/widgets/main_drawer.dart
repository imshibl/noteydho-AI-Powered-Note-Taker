import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:noteydho/features/home/widgets/drawer_item.dart';
import 'package:noteydho/utils/assets/icons.dart';
import 'package:noteydho/utils/assets/images.dart';
import 'package:noteydho/utils/consts/colors.dart';
import 'package:noteydho/utils/consts/consts.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: 250,
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                AppColors.freshMintGreen,
                AppColors.softBlack,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 2,
                offset: const Offset(0, 3), // changes position of shadow
              )
            ]),
        child: Column(
          children: [
            // Drawer Header
            SizedBox(
              child: Row(
                children: [
                  Image.asset(AppImages.logo, height: 80),
                  Text(
                    "Nwot",
                    style: Theme.of(context).textTheme.titleLarge,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // Drawer Items
            const DrawerItem(
              icon: AppIcons.note,
              title: "My Notes",
            ),
            const DrawerItem(
              icon: AppIcons.people,
              title: "Shared with Me",
            ),
            const DrawerItem(
              icon: AppIcons.stars,
              title: "Quick Access",
            ),

            const Spacer(),
            //current plan
            Container(
              height: 100,
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.all(Consts.margin10),
              padding: const EdgeInsets.all(Consts.padding10),
              decoration: BoxDecoration(
                color: AppColors.lightGray,
                borderRadius: BorderRadius.circular(
                  Consts.radius10,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Active Plan",
                      style: Theme.of(context).textTheme.titleSmall),
                  Text(
                    "Free",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Do more with Nwot, ",
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        TextSpan(
                            text: "Upgrade now",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                  color: Colors.blue,
                                ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print("Upgrade now");
                              }),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.only(bottom: Consts.margin10),
              child: Text(
                "Nwot © 2024. All rights reserved",
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: AppColors.lightGray,
                    ),
              ),
            ),
          ],
        ));
  }
}
