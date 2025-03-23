import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sentilytics/core/constants/image_string.dart';
import 'package:sentilytics/core/constants/text_string.dart';
import 'package:sentilytics/provider/db_provider.dart';
import 'package:sentilytics/widget/auth_button.dart';
import 'package:sentilytics/widget/auth_text_form_field.dart';
import 'package:sentilytics/widget/double_text_heading.dart';
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
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 38.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: DoubleTextHeading(
                        firstText: TextString.homeGreetingText,
                        secondText: dbProvider.userName,
                      ),
                    ),
                    FutureBuilder(
                      future: dbProvider.checkUserStatus(
                        FirebaseAuth.instance.currentUser!.uid,
                        context,
                      ),
                      builder: (context, snapshot) {
                        bool isPremium = false;
                        if (snapshot.data == null) {
                          isPremium = true;
                        } else {
                          isPremium = snapshot.data ?? false;
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CupertinoActivityIndicator();
                        }
                        if (snapshot.hasError) {
                          return Icon(Icons.error);
                        }
                        return isPremium
                            ? Container()
                            : Expanded(
                              child: GetPremiumButton(
                                onTap:
                                    () => dbProvider.upgradeUserToPremium(
                                      FirebaseAuth.instance.currentUser!.uid,
                                      context,
                                    ),
                              ),
                            );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                LottieBuilder.asset(ImageString.homeAnimation),
                const SizedBox(height: 50),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    TextString.homeTextFieldLabelText,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
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
                    if (_formKey.currentState!.validate()) {
                      _linkTextController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
