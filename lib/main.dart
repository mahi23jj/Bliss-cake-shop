import 'package:coffee/page/chat.dart';
import 'package:coffee/page/custome_disc.dart';
import 'package:coffee/page/filter.dart';
import 'package:coffee/page/home.dart';
import 'package:coffee/page/provider.dart';
import 'package:coffee/page/search.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBlTYfFd5W0fk2ELD0oVIXOPSy9DmvHLuY",
          authDomain: "login-4471f.firebaseapp.com",
          projectId: "login-4471f",
          storageBucket: "login-4471f.appspot.com",
          databaseURL: "https://login-4471f-default-rtdb.firebaseio.com/",
          messagingSenderId: "953539689403",
          appId: "1:953539689403:web:4b52be341be90317b4e29e"),
    );
  }

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return 
     ChangeNotifierProvider(
      create: (context) =>CategoryProvider(),
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 59, 26, 7)),
            useMaterial3: true,
          ),
          home:MyHomePage (),
        ),
      );
    
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Color c = Color.fromARGB(255, 59, 26, 7);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      // color: Color.fromARGB(255, 155, 148, 133),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('asset/images/c.jpg'), fit: BoxFit.cover),
      ),

      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Stack(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              // Text('Best coffee for you ',style: TextStyle(color: Colors.white,fontSize: 45,fontWeight: FontWeight.w100),),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Search()));
                  },
                  child: Container(
                    height: 75,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [c, c]),
                        borderRadius: BorderRadius.circular(10)),
                    alignment: Alignment.center,
                    child: Text(
                      'Enter Shop',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  )
            ],
          ),
        ]),
      ),
    ));
  }
}
