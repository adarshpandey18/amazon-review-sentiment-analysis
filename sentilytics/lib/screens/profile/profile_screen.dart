import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sentilytics/core/constants/image_string.dart';
import 'package:sentilytics/core/constants/text_string.dart';
import 'package:sentilytics/core/utils/helper_functions.dart';
import 'package:sentilytics/provider/auth_provider.dart';
import 'package:sentilytics/provider/db_provider.dart';
import 'package:sentilytics/routes/app_router_constant.dart';
import 'package:sentilytics/widget/custom_list_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AppAuthProvider>(context);
    final dbProvider = Provider.of<DbProvider>(context);
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 38.0),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 10),
                CircleAvatar(
                  backgroundImage: AssetImage(ImageString.profileImagePath),
                  maxRadius: 70,
                ),
                const SizedBox(height: 8),
                Text(
                  dbProvider.userName,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Divider(color: Colors.grey),
                const SizedBox(height: 8),
                Column(
                  children: [
                    CustomListTile(
                      changeColor: false,
                      leadingIcon: Icons.person,
                      listTitleText: TextString.profileChangeNameText,
                      onTap: () {
                        context.push(AppRouterConstant.changeNameRoutePath);
                      },
                    ),
                    const SizedBox(height: 7),
                    CustomListTile(
                      changeColor: false,
                      leadingIcon: Icons.lock,
                      listTitleText: TextString.profileChangePasswordText,
                      onTap: () {
                        context.push(AppRouterConstant.changePasswordRoutePath);
                      },
                    ),
                    const SizedBox(height: 7),
                    CustomListTile(
                      changeColor: false,
                      leadingIcon: Icons.workspace_premium,
                      listTitleText: TextString.profileUpgradeUserStatusText,
                      onTap: () {},
                    ),
                    const SizedBox(height: 7),
                    CustomListTile(
                      changeColor: false,
                      leadingIcon: Icons.info,
                      listTitleText: TextString.profileAboutText,
                      onTap: () {
                        context.push(AppRouterConstant.aboutAppRoutePath);
                      },
                    ),
                    const SizedBox(height: 7),
                    CustomListTile(
                      changeColor: false,
                      leadingIcon: Icons.help,
                      listTitleText: TextString.profileHelpText,
                      onTap: () {
                        context.push(AppRouterConstant.helpRoutePath);
                      },
                    ),
                    const SizedBox(height: 7),
                    CustomListTile(
                      changeColor: false,
                      leadingIcon: Icons.share,
                      listTitleText: TextString.profileShareAppText,
                      onTap: () {
                        HelperFunctions.shareApp(context);
                      },
                    ),
                    const SizedBox(height: 7),

                    CustomListTile(
                      changeColor: true,
                      leadingIcon: Icons.logout,
                      listTitleText: TextString.profileSignOutText,
                      onTap: () {
                        authProvider.signOut(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
