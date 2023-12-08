import 'package:flutter/material.dart';
import 'package:namaagp/AddExpenses/speech.dart';
import 'package:namaagp/AddPlan/ViewAddPlan.dart';
// import 'package:namaagp/Splash/ViewSplash.dart';
import 'package:namaagp/AddExpenses/ViewAddExpenses.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';

//import 'namaagp/lib/SignUp/ViewModelSignUp.dart';
main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://rpwqxndlhdiqkrejigse.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJwd3F4bmRsaGRpcWtyZWppZ3NlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTMwNjY4NDQsImV4cCI6MjAwODY0Mjg0NH0.qlIR6KNotfLwl30HsVSUW9M3smblYaYxtk_D7W2L_EU',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
     

      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0x00071121), body: buildBody(context)
        // Container(
        //   padding: EdgeInsets.only(top: 50.0, left: 10, right: 10),
        //   width: 428,
        //   height: 926,
        //   clipBehavior: Clip.antiAlias,
        //   decoration: const BoxDecoration(//maybe delete const
        //     gradient: LinearGradient(
        //       begin: Alignment(-0.00, -6.00),
        //       end: Alignment(0, 1.5),
        //       colors: [Color(0xFF342D68), Color(0xFF352D68), Color(0x00352D68)],
        //     ),
        //   ),

        //   child: Column(children: const [
        //     header(subTitle: 'a', title: '',),
        //   ],)

        //   //child: const header(subTitle: 'a', title: '',),
        // )
        );
  }

  Widget buildBody(BuildContext context) {
    return FutureBuilder(
      future: splashNavigate(),
      builder: (context, snapshot) {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Future<String> splashNavigate() async {
    await Future.delayed(const Duration(milliseconds: 5)).then((value) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            submitLogin();

            return ViewAddExpenses();

            //return const ViewSplash();
          },
        ),
      );
    });

    return "Logined";
  }
}

void submitLogin() {
  print('reem');
}
