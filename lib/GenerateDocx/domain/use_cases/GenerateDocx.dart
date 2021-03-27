import 'package:dartz/dartz.dart';
import 'package:doc_template/Core/UseCase/UseCase.dart';
import 'package:doc_template/Core/error/failures.dart';
import 'package:doc_template/GenerateDocx/domain/entities/DocxVariable.dart';
import 'package:doc_template/GenerateDocx/domain/repositories/GenerateDocxRepository.dart';

class GenerateDocx implements UseCase<bool, DocxVariable> {
  final GenerateDocxRepository repository;

  GenerateDocx(this.repository);

  @override
  Future<Either<Failure, bool>> call(DocxVariable params) {
    return repository.generateDocx(params);
  }
}
