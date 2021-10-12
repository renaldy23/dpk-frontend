
class UtilInputTextFormField {
  validatorEmpty(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some value';
    }
    return null;
  }
}

