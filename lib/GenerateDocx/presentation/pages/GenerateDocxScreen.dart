import 'package:doc_template/GenerateDocx/presentation/manager/GenerateDocxProvider.dart';
import 'package:doc_template/GenerateDocx/presentation/widgets/ButtonGenerate.dart';
import 'package:doc_template/GenerateDocx/presentation/widgets/TextFieldDocx.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GenerateDocxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<GenerateDocxProvider>(
        builder: (context, data, child) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFieldDocx.tajuk(
                    onChanged: data.changeTajuk,
                    validation: data.tajuk.isValid,
                    errorText: data.tajuk.errorText,
                    textEditingController: data.tajuk.textEditingController,
                  ),
                  TextFieldDocx.subTajuk(
                    onChanged: data.changeSubTajuk,
                    validation: data.subTajuk.isValid,
                    errorText: data.subTajuk.errorText,
                    textEditingController: data.subTajuk.textEditingController,
                  ),
                  TextFieldDocx.list(
                    onChanged: data.changeList,
                    validation: data.list.isValid,
                    errorText: data.list.errorText,
                    textEditingController: data.list.textEditingController,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ButtonGenerate(
                      name: 'Generate',
                      onPressed: () {
                        data.generateNow;
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
