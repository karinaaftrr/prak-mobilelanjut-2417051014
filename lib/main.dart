// import 'package:flutter/material.dart';

// import 'assets_media.dart';
// import 'detail_page.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Assets & Media Navigation',

//       // Halaman pertama
//       initialRoute: '/',

//       // Named Routes
//       routes: {
//         '/': (context) => const AssetsMediaPage(),
//         '/detail': (context) => const DetailPage(),
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';

import 'api_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'REST API Praktikum',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ApiPage(),
    );
  }
}
