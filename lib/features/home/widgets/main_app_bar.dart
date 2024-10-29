import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:noteydho/config/router.dart';
import 'package:noteydho/utils/consts/consts.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    User user = FirebaseAuth.instance.currentUser!;

    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: kToolbarHeight,
      padding: const EdgeInsets.symmetric(
        horizontal: Consts.padding10,
      ),
      margin: const EdgeInsets.only(bottom: Consts.margin10),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 2,
          offset: const Offset(0, 2),
        ),
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "Hey",
                      style: Theme.of(context).textTheme.titleMedium),
                  TextSpan(
                      text: " ${user.displayName}",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.w600)),
                ]),
              ),
              Text(
                "Good Morning",
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
          PopupMenuButton<String>(
            icon: CachedNetworkImage(
              imageUrl: user.photoURL!,
              height: 50,
              width: 50,
              imageBuilder: (context, imageProvider) {
                return Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              errorWidget: (context, url, error) => const Icon(
                Icons.person_outline,
              ),
            ),
            onSelected: (String value) {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                Consts.radius10,
              ),
            ),
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: 'Profile',
                  child: Text('Profile'),
                ),
                const PopupMenuItem<String>(
                  value: 'Settings',
                  child: Text('Settings'),
                ),
                PopupMenuItem<String>(
                  value: 'Logout',
                  child: const Text('Logout'),
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    if (!context.mounted) return;
                    context.push(AppRouter.initial);
                  },
                ),
              ];
            },
          ),
        ],
      ),
    );
  }
}
