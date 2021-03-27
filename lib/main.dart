import 'package:doc_template/GenerateDocx/presentation/pages/GenerateDocxScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Core/Provider/ProviderMulti.dart';
import 'Injection_Container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderMulti.multiProviderListMain,
      child: MaterialApp(
        home: GenerateDocxScreen(),
      ),
    );
  }
}
