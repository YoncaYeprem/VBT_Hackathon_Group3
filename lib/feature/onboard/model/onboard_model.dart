class OnboardModel {
  String title;
  String decription;
  String image;

  OnboardModel(
      {required this.title, required this.decription, required this.image});

  static List<OnboardModel> pages = [
    OnboardModel(
        title: "", decription: "", image: "assets/images/onboard_image_1.png"),
    OnboardModel(
        title: "", decription: "", image: "assets/images/onboard_image_2.png"),
    OnboardModel(
        title: "", decription: " ", image: "assets/images/onboard_image_3.png")
  ];
}
