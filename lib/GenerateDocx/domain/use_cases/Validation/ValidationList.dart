import 'package:dartz/dartz.dart';
import 'package:doc_template/Core/UseCase/UseCase.dart';
import 'package:doc_template/Core/error/failures.dart';
import 'package:doc_template/GenerateDocx/domain/repositories/ValidationRepository.dart';

class ValidationList extends UseCaseNoFuture<bool, String> {
  final ValidationRepository repository;

  ValidationList(this.repository);
  @override
  Either<Failure, bool> call(String params) {
    return repository.validationList(params);
  }
}
