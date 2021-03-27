import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:doc_template/Core/Date.dart';
import 'package:doc_template/Core/error/failures.dart';
import 'package:doc_template/GenerateDocx/domain/entities/DocxVariable.dart';
import 'package:doc_template/GenerateDocx/domain/repositories/GenerateDocxRepository.dart';
import 'package:docx_template/docx_template.dart';
import 'package:path_provider/path_provider.dart';

class GenerateDocxRepositoryImpl implements GenerateDocxRepository {
  @override
  Future<Either<Failure, bool>> generateDocx(DocxVariable params) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;

    final f = File("assets/ROF.docx");
    final docx = await DocxTemplate.fromBytes(await f.readAsBytes());
    Content c = Content();
    c..add(TextContent("Hari", "${Date().weekDay.toUpperCase()}"));
    c..add(TextContent("Tarikh", "${Date().date.toUpperCase()}"));
    c..add(TextContent("tajuk", "${params.tajuk}"));
    c..add(TextContent("subtajuk", "${params.subTajuk}"));
    c..add(TextContent("list", "${params.list}"));
    c..add(TextContent("list2", ""));
    c..add(TextContent("list2", ""));
    final d = await docx.generate(c);
    final of = File('$appDocPath\\contoh\\rof.docx');
    await of.writeAsBytes(d);
    return Right(true);
  }
}
