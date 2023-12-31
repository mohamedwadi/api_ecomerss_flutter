import 'package:api_ecomerss_flutter/screen/test_api.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            useMaterial3: true,
            appBarTheme: AppBarTheme(
                color: Colors.transparent
                ,elevation: 0,
                centerTitle: true

            )
        ),
      home: TestApi(),
    );
  }
}

