import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sentilytics/core/constants/image_string.dart';
import 'package:sentilytics/core/constants/text_string.dart';
import 'package:sentilytics/provider/db_provider.dart';
import 'package:sentilytics/widget/auth_button.dart';
import 'package:sentilytics/widget/auth_text_form_field.dart';
import 'package:sentilytics/widget/get_premium_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _linkTextController;
  late GlobalKey<FormState> _formKey;
  @override
  void initState() {
    super.initState();
    _linkTextController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Provider.of<DbProvider>(
          context,
          listen: false,
        ).getName(user.uid, context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final dbProvider = Provider.of<DbProvider>(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 38.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          TextString.homeGreetingText,
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(fontWeight: FontWeight.normal),
                        ),
                        Text(
                          dbProvider.userName,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: GetPremiumButton(
                      onTap:
                          () => dbProvider.upgradeUserToPremium(
                            FirebaseAuth.instance.currentUser!.uid,
                            context,
                          ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              LottieBuilder.asset(ImageString.homeAnimation),
              const SizedBox(height: 50),
              AuthTextFormField(
                controller: _linkTextController,
                isEmail: false,
                isPassword: false,
                isName: true,
                prefixIconData: Icons.link,
              ),
              const SizedBox(height: 13),
              AuthButton(
                text: TextString.homeLinkButtonText,
                onTap: () {
                  if (_formKey.currentState!.validate()) {}
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
