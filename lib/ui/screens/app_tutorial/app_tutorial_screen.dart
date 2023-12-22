import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String text;
  final String imageUrl;

  SlideInfo({required this.title, required this.text, required this.imageUrl});
}

final slides = <SlideInfo>[
  SlideInfo(
      title: "Search food",
      text:
          "Lorem ipsum es el texto que se usa habitualmente en diseño gráfico en demostraciones de tipografías",
      imageUrl: "assets/images/1.png"),
  SlideInfo(
      title: "Fast delivery",
      text:
          "Lorem ipsum es el texto que se usa habitualmente en diseño gráfico en demostraciones de tipografías",
      imageUrl: "assets/images/2.png"),
  SlideInfo(
      title: "Enjoy the food",
      text:
          "Lorem ipsum es el texto que se usa habitualmente en diseño gráfico en demostraciones de tipografías",
      imageUrl: "assets/images/3.png"),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
      print(pageViewController.page.toString());
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map((slide) => _Slide(slide.title, slide.text, slide.imageUrl))
                .toList(),
          ),
          Positioned(
              right: 24,
              top: 50,
              child: TextButton(
                onPressed: () => context.pop(),
                child: const Text("Skip"),
              )),
          endReached
              ? Positioned(
                  bottom: 32,
                  right: 24,
                  child: FadeInRight(
                    from: 16,
                    delay: const Duration(milliseconds: 500),
                    child: FilledButton(
                        child: const Text("Start"),
                        onPressed: () => context.pop()),
                  ))
              : const SizedBox()
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String text;
  final String imgUrl;

  const _Slide(this.title, this.text, this.imgUrl);

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final descriptionStyle = Theme.of(context).textTheme.bodyMedium;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage(imgUrl),
            ),
            const SizedBox(height: 24),
            Text(
              title,
              style: titleStyle,
            ),
            const SizedBox(height: 24),
            Text(
              text,
              style: descriptionStyle,
            )
          ],
        ),
      ),
    );
  }
}
