import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late AdSize adSize = AdSize.banner;
  BannerAd? _bannerAd;
  final String adUnitId =
      'ca-app-pub-3940256099942544/6300978111'; // Test Banner Ad ID

  // final String adUnitId =
  //     Platform.isAndroid
  //         ? 'ca-app-pub-4686056747047135/9963539365'
  //         : 'ca-app-pub-4686056747047135/8073966527';

  @override
  void initState() {
    super.initState();
    _linkTextController = TextEditingController();
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Provider.of<DbProvider>(
          context,
          listen: false,
        ).getName(user.uid, context);
      });
    }
    _loadAd();
  }

  void _loadAd() {
    final bannerAd = BannerAd(
      size: adSize,
      adUnitId: adUnitId,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          if (!mounted) {
            ad.dispose();
            return;
          }
          debugPrint('BannerAd loaded successfully');
          setState(() {
            _bannerAd = ad as BannerAd;
          });
        },
        onAdFailedToLoad: (ad, error) {
          debugPrint('BannerAd failed to load: $error');
          ad.dispose();
        },
      ),
    );
    debugPrint("Loading Banner Ad with ID: $adUnitId");
    bannerAd.load();
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
                    FutureBuilder<bool>(
                      future: dbProvider.checkUserStatus(
                        FirebaseAuth.instance.currentUser!.uid,
                        context,
                      ),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CupertinoActivityIndicator();
                        }
                        if (snapshot.hasError) {
                          return const Icon(Icons.error);
                        }

                        bool isPremium = snapshot.data ?? false;

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
                const SizedBox(height: 10),
                _bannerAd != null
                    ? SizedBox(height: 50, child: AdWidget(ad: _bannerAd!))
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
