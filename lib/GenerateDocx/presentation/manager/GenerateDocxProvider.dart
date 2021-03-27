import 'package:dartz/dartz.dart';
import 'package:doc_template/Core/error/failures.dart';
import 'package:doc_template/GenerateDocx/domain/entities/DocxVariable.dart';
import 'package:doc_template/GenerateDocx/domain/use_cases/GenerateDocx.dart';
import 'package:doc_template/GenerateDocx/domain/use_cases/Validation/ValidationList.dart';
import 'package:doc_template/GenerateDocx/domain/use_cases/Validation/ValidationSubTitle.dart';
import 'package:doc_template/GenerateDocx/domain/use_cases/Validation/ValidationTitle.dart';
import 'package:flutter/cupertino.dart';

class GenerateDocxProvider extends ChangeNotifier {
  GenerateDocx _generateDocx;
  ValidationTitle _validationTitle;
  ValidationSubTitle _validationSubTitle;
  ValidationList _validationList;

  GenerateDocxProvider({
    @required GenerateDocx generateDocx,
    @required ValidationTitle validationTitle,
    @required ValidationSubTitle validationSubTitle,
    @required ValidationList validationList,
  })  : _generateDocx = generateDocx,
        _validationTitle = validationTitle,
        _validationSubTitle = validationSubTitle,
        _validationList = validationList;

  DocxVariable docxVariable = DocxVariable(
    tajuk: '',
    subTajuk: '',
    list: '',
  );

  TextFieldLogic tajuk = TextFieldLogic();
  TextFieldLogic subTajuk = TextFieldLogic();
  TextFieldLogic list = TextFieldLogic();

  void changeTajuk(String value) {
    if (!tajuk.isValid) {
      validUserTitle(value);
    }
    docxVariable.tajuk = value;
    notifyListeners();
  }

  void changeSubTajuk(String value) {
    if (!subTajuk.isValid) {
      validUserSubTitle(value);
    }
    docxVariable.subTajuk = value;

    notifyListeners();
  }

  void changeList(String value) {
    if (!list.isValid) {
      validUserList(value);
    }
    docxVariable.list = value;
    notifyListeners();
  }

  void validUserTitle(String value) {
    final Either<Failure, bool> result = _validationTitle.call(value);

    result.fold(
      (l) {
        tajuk.isValid = false;
        tajuk.errorText = (l as ValidationFailure).errorValidationText;
      },
      (r) {
        tajuk.isValid = r;
        tajuk.errorText = '';
      },
    );
  }

  void validUserSubTitle(String value) {
    final Either<Failure, bool> result = _validationSubTitle.call(value);

    result.fold(
      (l) {
        subTajuk.isValid = false;
        subTajuk.errorText = (l as ValidationFailure).errorValidationText;
      },
      (r) {
        subTajuk.isValid = r;
        subTajuk.errorText = '';
      },
    );
  }

  void validUserList(String value) {
    final Either<Failure, bool> result = _validationList.call(value);

    result.fold(
      (l) {
        list.isValid = false;
        list.errorText = (l as ValidationFailure).errorValidationText;
      },
      (r) {
        list.isValid = r;
        list.errorText = '';
      },
    );
  }

  Future<bool> get generateNow async {
    validUserList(docxVariable.list);
    validUserSubTitle(docxVariable.subTajuk);
    validUserTitle(docxVariable.tajuk);
    notifyListeners();
    if (tajuk.isValid && subTajuk.isValid && list.isValid) {
      final Either<Failure, bool> result =
          await _generateDocx.call(docxVariable);

      return result.fold(
        (l) => false,
        (r) => r,
      );
    } else {
      return false;
    }
  }
}

class TextFieldLogic extends ChangeNotifier {
  bool isValid = true;
  String errorText = 'error';
  TextEditingController textEditingController = TextEditingController();

  void change(String value) {
    notifyListeners();
  }
}
