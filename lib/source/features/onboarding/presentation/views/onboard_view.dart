// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:gtk_flutter/source/core/router/app_router.dart';
// import 'package:gtk_flutter/source/features/onboarding/presentation/onboarding_controller.dart';
// import 'package:gtk_flutter/source/features/onboarding/domain/onboarding.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// // OnBoardingScreen
// class OnBoardingScreen3 extends ConsumerStatefulWidget {
//   const OnBoardingScreen3({super.key});

//   @override
//   ConsumerState<OnBoardingScreen3> createState() => _OnBoardingScreenState();
// }

// class _OnBoardingScreenState extends ConsumerState<OnBoardingScreen3> {
//   // Variables
//   late PageController _pageController;
//   int _pageIndex = 0;
//   Timer? _timer;

//   @override
//   void initState() {
//     super.initState();
//     // Initialize page controller
//     _pageController = PageController(initialPage: 0);
//     // Automatic scroll behaviour
//     _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
//       if (_pageIndex < 3) {
//         _pageIndex++;
//       } else {
//         _pageIndex = 0;
//       }

//       _pageController.animateToPage(
//         _pageIndex,
//         duration: const Duration(milliseconds: 350),
//         curve: Curves.easeIn,
//       );
//     });
//   }

//   @override
//   void dispose() {
//     // Dispose everything
//     _pageController.dispose();
//     _timer!.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final state = ref.watch(onboardingControllerProvider);
//     return Scaffold(
//       body: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         // Background gradient
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: <Color>[
//               Color(0xff1f005c),
//               Color(0xff5b0060),
//               Color(0xff870160),
//               Color(0xffac255e),
//               Color(0xffca485c),
//               Color(0xffe16b5c),
//               Color(0xfff39060),
//               Color(0xffffb56b),
//             ],
//             tileMode: TileMode.mirror,
//           ),
//         ),
//         child: Column(
//           children: [
//             // Carousel area
//             Expanded(
//               child: PageView.builder(
//                 onPageChanged: (index) {
//                   setState(() {
//                     _pageIndex = index;
//                   });
//                 },
//                 itemCount: demoData.length,
//                 controller: _pageController,
//                 itemBuilder: (context, index) => OnBoardContent(
//                   title: demoData[index].title,
//                   description: demoData[index].description,
//                   image: demoData[index].image,
//                 ),
//               ),
//             ),
//             // Indicator area
//             Padding(
//               padding: const EdgeInsets.only(bottom: 16.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   ...List.generate(
//                     demoData.length,
//                     (index) => Padding(
//                       padding: const EdgeInsets.only(right: 4),
//                       child: DotIndicator(
//                         isActive: index == _pageIndex,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             // Privacy policy area
//             const Text("By proceeding you agree to our Privacy Policy"),
//             // White space
//             const SizedBox(
//               height: 16,
//             ),
//             // Button area
//             InkWell(
//               onTap: () async {
//                 bool isLoading = state.isLoading;
//                 await ref.read(onboardingControllerProvider.notifier).completeOnboarding();
//                 if (context.mounted) {
//                   context.goNamed(AppRoute.signIn.name);
//                 }
//               },
//               child: Container(
//                 margin: const EdgeInsets.only(bottom: 48),
//                 height: 40,
//                 width: 200,
//                 decoration: BoxDecoration(
//                   color: Colors.purple,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: const Center(
//                   child: Text(
//                     "Login / Registration",
//                     style: TextStyle(
//                       fontFamily: "HappyMonkey",
//                       color: Colors.white,
//                       fontSize: 18,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // OnBoarding area widget
// class OnBoardContent extends StatelessWidget {
//   OnBoardContent({
//     super.key,
//     required this.image,
//     required this.title,
//     required this.description,
//   });

//   String image;
//   String title;
//   String description;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const Spacer(),
//         Text(
//           title,
//           style: const TextStyle(
//             color: Colors.white,
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         const SizedBox(
//           height: 16,
//         ),
//         Text(
//           description,
//           textAlign: TextAlign.center,
//           style: const TextStyle(
//             color: Colors.white,
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         const Spacer(),
//         Image.asset(image),
//         const Spacer(),
//       ],
//     );
//   }
// }

// // Dot indicator widget
// class DotIndicator extends StatelessWidget {
//   const DotIndicator({
//     this.isActive = false,
//     super.key,
//   });

//   final bool isActive;

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 300),
//       height: 8,
//       width: isActive ? 24 : 8,
//       decoration: BoxDecoration(
//         color: isActive ? Colors.blue : Colors.white,
//         border: isActive ? null : Border.all(color: Colors.blue),
//         borderRadius: const BorderRadius.all(
//           Radius.circular(12),
//         ),
//       ),
//     );
//   }
// }
