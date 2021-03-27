import 'package:dartz/dartz.dart';
import 'package:doc_template/Core/error/failures.dart';

abstract class ValidationRepository {
  Either<Failure, bool> validationTitle(String params);
  Either<Failure, bool> validationSubTitle(String params);
  Either<Failure, bool> validationList(String params);
}
