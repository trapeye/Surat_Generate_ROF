import 'package:dartz/dartz.dart';
import 'package:doc_template/Core/error/failures.dart';
import 'package:doc_template/GenerateDocx/domain/entities/DocxVariable.dart';

abstract class GenerateDocxRepository {
  Future<Either<Failure, bool>> generateDocx(DocxVariable params);
}
