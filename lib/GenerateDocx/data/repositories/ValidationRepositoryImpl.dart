import 'package:dartz/dartz.dart';
import 'package:doc_template/Core/Validator/string_validators.dart';
import 'package:doc_template/Core/error/failures.dart';
import 'package:doc_template/GenerateDocx/domain/repositories/ValidationRepository.dart';

class ValidationRepositoryImpl extends ValidationRepository {
  @override
  Either<Failure, bool> validationList(String params) {
    if (NonEmptyStringValidator().isValid(params)) {
      return Right(true);
    } else {
      return Left(ValidationFailure('List is empty'));
    }
  }

  @override
  Either<Failure, bool> validationSubTitle(String params) {
    if (NonEmptyStringValidator().isValid(params)) {
      return Right(true);
    } else {
      return Left(ValidationFailure('SubTitle is empty'));
    }
  }

  @override
  Either<Failure, bool> validationTitle(String params) {
    if (NonEmptyStringValidator().isValid(params)) {
      return Right(true);
    } else {
      return Left(ValidationFailure('Title is empty'));
    }
  }
}
