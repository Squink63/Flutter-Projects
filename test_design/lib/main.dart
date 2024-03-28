import 'package:flutter/material.dart';
import 'package:test_one/aya_pay_agent_home.dart';
// import 'package:easy_localization/easy_localization.dartrt';
import 'package:test_one/aya_pay_agent_login.dart';

void main() {
  runApp(
      // EasyLocalization(
      //     supportedLocales: [Locale('en', 'US'), Locale('es', 'ES')],
      //     path: "jsons",
      //   fallbackLocale: Locale("en", "US"),
           const MyApp(),
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // debugShowCheckedModeBanner: false,
      // localizationsDelegates: context.localizationDelegates,
      // supportedLocales: context.supportedLocales,
      // locale: context.locale,
      theme: ThemeData(

      ),
      home: const AYAPayAgentLogin(),
    );
  }
}

class LoginPage extends StatelessWidget{
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(35, 56, 109, 1.0),
        toolbarHeight: 230.0,
        leading: const Padding(
          padding: EdgeInsets.only(left: 30.0,top: 55.0),
          child: Text(
            "Welcome back ",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        leadingWidth: 200.0,
      ),

      body: Container(
        color: const Color.fromRGBO(35, 56, 109, 1.0),
        child:  Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(35.0), topLeft: Radius.circular(35.0)),
              color: Colors.white
          ),
          child:  Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const Text("Sign in to continue",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18.0,
                  ),
                ),

                const SizedBox(
                  height: 35.0,
                ),

                const Text("Username",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18.0,
                  ),
                ),

                const TextField(

                ),

                const SizedBox(
                  height: 35.0,
                ),

                const Text("Password",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18.0,
                  ),
                ),

                const TextField(

                ),

                const SizedBox(
                  height: 35.0,
                ),

                SizedBox(
                  width: 180,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                        backgroundColor:  const Color.fromRGBO(35, 56, 109, 1.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)
                        )
                    ),
                    child:  const Text("Sign In",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 35.0,
                ),

                const Text("Forget password?",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
        ),

      ),
    );
  }

}

const Color kPrimaryKPayColor = Color.fromRGBO(27, 85, 166, 1.0);
const String kImage = "assets/images/";


