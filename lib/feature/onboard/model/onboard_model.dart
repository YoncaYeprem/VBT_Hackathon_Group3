import 'package:easy_localization/easy_localization.dart';
import '../../../core/init/lang/locale_keys.g.dart';

class OnboardModel {
  String title;
  String decription;
  String image;

  OnboardModel(
      {required this.title, required this.decription, required this.image});

  static List<OnboardModel> pages = [
    OnboardModel(
        title: LocaleKeys.onboard_title.tr(),
        decription: LocaleKeys.onboard_page1desc.tr(),
        image: "assets/images/onboard_image_1.png"),
    OnboardModel(
        title: LocaleKeys.onboard_title.tr(),
        decription: LocaleKeys.onboard_page2desc.tr(),
        image: "assets/images/onboard_image_2.png"),
    OnboardModel(
        title: LocaleKeys.onboard_title.tr(),
        decription: LocaleKeys.onboard_page3desc.tr(),
        image: "assets/images/onboard_image_3.png")
  ];
}
