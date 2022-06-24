import 'package:flutter/material.dart';
import 'package:valeta/pages/home.dart';
import 'package:valeta/widgets/slide_page_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.fromLTRB(36, 40, 36, 40),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (index) {
                  setState(() {
                    isLastPage = index == 2;
                  });
                },
                children: [
                  PageViewWidget(
                    image: Image.asset('assets/slide-1.jpg'),
                    title: 'Add Money',
                    text: 'This is a very long text which is too long to read. maybe we should have made this text too short and not bad.',
                  ),
                  PageViewWidget(
                    image: Image.asset('assets/slide-1.jpg'),
                    title: 'Spend',
                    text: 'This is a very long text which is too long to read. maybe we should have made this text too short and not bad.',
                  ),
                  PageViewWidget(
                    image: Image.asset('assets/slide-1.jpg'),
                    title: 'Track',
                    text: 'This is a very long text which is too long to read. maybe we should have made this text too short and not bad.',
                  ),
                ],
              ),
            ),
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: const WormEffect(
                  spacing: 5.0,
                  dotWidth: 8.0,
                  dotHeight: 8.0,
                  paintStyle: PaintingStyle.stroke,
                  strokeWidth: 1,
                  dotColor: Colors.grey,
                  activeDotColor: Colors.grey,
                ),
                onDotClicked: (index) => controller.animateToPage(
                  index,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 110.0,
              child: Column(
                children: [
                  isLastPage
                      ? SizedBox(
                          height: 45,
                          width: 300,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: const Color.fromRGBO(101, 119, 236, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(27.0),
                              ),
                            ),
                            child: const Text(
                              'Get Started',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        )
                      : SizedBox(
                          height: 45,
                          width: 300,
                          child: ElevatedButton(
                            onPressed: () {
                              controller.nextPage(
                                duration: const Duration(seconds: 1),
                                curve: Curves.easeInOut,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: const Color.fromRGBO(101, 119, 236, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(27.0),
                              ),
                            ),
                            child: const Text(
                              'Next',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                  isLastPage
                      ? const SizedBox(
                          height: 0,
                        )
                      : TextButton(
                          onPressed: () {
                            controller.animateToPage(
                              2,
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeInOut,
                            );
                          },
                          style: TextButton.styleFrom(
                            primary: Colors.blueGrey,
                          ),
                          child: const Text('Skip'),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Page View Content
  // Container _pageViewContent(Image image, String title, String text) {
  //   return Container(
  //     color: Colors.white,
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         SizedBox(
  //           height: 20,
  //         ),
  //         image,
  //         Text(
  //           title,
  //           style: TextStyle(
  //             fontSize: 25,
  //             fontWeight: FontWeight.bold,
  //             color: Color.fromRGBO(101, 119, 236, 1),
  //           ),
  //         ),
  //         SizedBox(
  //           height: 20,
  //         ),
  //         Text(
  //           text,
  //           textAlign: TextAlign.center,
  //           style: TextStyle(
  //             fontSize: 16,
  //             fontWeight: FontWeight.normal,
  //             color: Color.fromRGBO(98, 105, 107, 1),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
