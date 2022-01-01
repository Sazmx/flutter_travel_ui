import 'package:flutter/material.dart';

import 'home.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  const MainApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

	  final ThemeData theme = ThemeData();

		return MaterialApp(
			debugShowCheckedModeBanner: false,
			theme: theme.copyWith(
        		colorScheme: theme.colorScheme.copyWith(
          			primary: Colors.cyan,
          			secondary: Colors.cyan[50],
					background: Colors.grey[200]
				),
			),
			home: Home(),
		);
  }
}
