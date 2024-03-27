// import 'package:flutter/material.dart';
// import 'package:easy_localization/easy_localization.dart';
//
// void main() {
//   runApp(
//     EasyLocalization(
//       supportedLocales: [Locale('en', 'US'), Locale('es', 'ES')],
//       path: 'locales',
//       fallbackLocale: Locale('en', 'US'),
//       child: MyApp1(),
//     ),
//   );
// }
//
// class MyApp1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       localizationsDelegates: context.localizationDelegates,
//       supportedLocales: context.supportedLocales,
//       locale: context.locale,
//       title: 'Localization Sample',
//       home: const MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('title'.tr()),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text('title'.tr(), style: TextStyle(fontSize: 24)),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 context.setLocale(Locale('en', 'US'));
//               },
//               child: Text('button_text_1'.tr()),
//             ),
//             SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: () {
//                 context.setLocale(Locale('es', 'ES'));
//               },
//               child: Text('button_text_2'.tr()),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }