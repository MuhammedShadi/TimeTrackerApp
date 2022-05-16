abstract class StringValidators{
  bool isValid(String value);
}

class NonEmptyStringStringValidators implements StringValidators{
  @override
  bool isValid(String value) {
      return value.isNotEmpty;
  }
}

class EmailPasswordValidators{
  final StringValidators emailValidator = NonEmptyStringStringValidators();
  final StringValidators passwordValidator = NonEmptyStringStringValidators();

}
