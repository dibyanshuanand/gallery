import 'package:bipolar_test/providers/anotherImageProvider.dart';
import 'package:bipolar_test/views/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:bipolar_test/providers/imageProvider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    run();
  });
}

void run() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MyImageProvider()),
        ChangeNotifierProvider(create: (context) => AnotherImageProvider(),),
      ],
      child: MaterialApp(
        home: SplashScreen(),
      ),
    );
  }
}
