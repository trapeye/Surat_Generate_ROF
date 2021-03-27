import 'package:doc_template/GenerateDocx/presentation/manager/GenerateDocxProvider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../Injection_Container.dart';

class ProviderMulti {
  static List<SingleChildWidget> multiProviderListMain = [
    ChangeNotifierProvider<GenerateDocxProvider>(
      create: (context) => sl<GenerateDocxProvider>(),
    ),
  ];
}
