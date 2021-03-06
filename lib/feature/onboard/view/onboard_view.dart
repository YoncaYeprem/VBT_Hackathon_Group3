import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../authentication/login/view/login_view.dart';
import '../model/onboard_model.dart';

class OnboardView extends StatefulWidget {
  const OnboardView({Key? key}) : super(key: key);

  @override
  _OnboardViewState createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {
  PageController? _controller;
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: createPageView()),
    );
  }

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  createPageView() {
    return PageView.builder(
      onPageChanged: (newIndex) {
        setState(() {
          currentIndex = newIndex;
        });
      },
      controller: _controller,
      itemCount: OnboardModel.pages.length,
      itemBuilder: (_, index) {
        return pageViewItem(index);
      },
    );
  }

  Widget pageViewItem(int index) {
    return Column(
      children: [
        Expanded(
          child: Image.asset(OnboardModel.pages[index].image),
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  indicatorWidget(),
                  buildTitle(index, context),
                  buildDecription(index, context),
                  buildbuttons(index, context, _controller),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Expanded indicatorWidget() {
    return Expanded(
      flex: 1,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                OnboardModel.pages.length,
                (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      child: CircleAvatar(
                        radius: currentIndex == index ? 8 : 6,
                        backgroundColor: currentIndex == index
                            ? Colors.deepOrangeAccent
                            : Colors.grey,
                      ),
                    ))),
      ),
    );
  }
}

Expanded buildTitle(int index, context) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.all(20),
      child: Text(OnboardModel.pages[index].title,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(fontWeight: FontWeight.bold)),
    ),
  );
}

Expanded buildDecription(int index, context) {
  return Expanded(
      flex: 2,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Text(
          OnboardModel.pages[index].decription,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(fontWeight: FontWeight.normal),
        ),
      ));
}

Expanded buildbuttons(index, BuildContext context, _controller) {
  return Expanded(
      flex: 1,
      child: Container(
        child: Center(
          child: Row(children: [
            Expanded(
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginView()));
                  },
                  child: Text(LocaleKeys.onboard_skipButton.tr())),
            ),
            Expanded(
              child: index == 2
                  ? TextButton(
                      onPressed: () {
                        context.navigateToPage(LoginView());
                      },
                      child: Text(LocaleKeys.onboard_doneButton.tr()))
                  : TextButton(
                      onPressed: () {
                        _controller.animateToPage(index == 2 ? 0 : index + 1,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease);
                      },
                      child: Text(LocaleKeys.onboard_nextButton.tr()),
                    ),
            )
          ]),
        ),
      ));
}
