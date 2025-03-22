import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sentilytics/core/constants/image_string.dart';
import 'package:sentilytics/core/constants/text_string.dart';
import 'package:sentilytics/provider/db_provider.dart';
import 'package:sentilytics/widget/auth_button.dart';
import 'package:sentilytics/widget/auth_text_form_field.dart';
import 'package:sentilytics/widget/double_text_heading.dart';
import 'package:sentilytics/widget/get_premium_button.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class CompareScreen extends StatefulWidget {
  const CompareScreen({super.key});

  @override
  State<CompareScreen> createState() => _CompareScreenState();
}

class _CompareScreenState extends State<CompareScreen> {
  late TextEditingController _firstLinkController;
  late TextEditingController _secondLinkController;
  late GlobalKey<FormState> _globalKey;
  @override
  void initState() {
    _firstLinkController = TextEditingController();
    _secondLinkController = TextEditingController();
    _globalKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    _firstLinkController.dispose();
    _secondLinkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dbProvider = Provider.of<DbProvider>(context);
    return FutureBuilder(
      future: dbProvider.checkUserStatus(
        FirebaseAuth.instance.currentUser!.uid,
        context,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CupertinoActivityIndicator());
        }
        if (snapshot.hasError) {
          return Icon(Icons.error);
        }
        bool isPremium = snapshot.data ?? false;

        return isPremium
            ? SingleChildScrollView(
              child: Form(
                key: _globalKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DoubleTextHeading(
                      firstText: TextString.compareFirstText,
                      secondText: TextString.compareSecondText,
                    ),
                    const SizedBox(height: 50),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(ImageString.comparisonImagePath),

                        Text(
                          TextString.firstProductText,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        AuthTextFormField(
                          controller: _firstLinkController,
                          isEmail: false,
                          isPassword: false,
                          isName: true,
                          prefixIconData: Icons.link,
                        ),
                        const SizedBox(height: 13),
                        Text(
                          TextString.secondProductText,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        AuthTextFormField(
                          controller: _secondLinkController,
                          isEmail: false,
                          isPassword: false,
                          isName: true,
                          prefixIconData: Icons.link,
                        ),
                        const SizedBox(height: 13),
                        AuthButton(
                          text: TextString.compareProductButtonText,
                          onTap: () {
                            if (_globalKey.currentState!.validate()) {
                            } else {
                              showTopSnackBar(
                                Overlay.of(context),
                                CustomSnackBar.error(
                                  message: TextString.comparisonErrorMessage,
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
            : Center(
              child: GetPremiumButton(
                onTap: () {
                  dbProvider.upgradeUserToPremium(
                    FirebaseAuth.instance.currentUser!.uid,
                    context,
                  );
                },
              ),
            );
      },
    );
  }
}
