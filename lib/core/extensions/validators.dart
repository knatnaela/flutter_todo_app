extension Validator on String {
  String? validateField({required String fieldName}) {
    const errorMessage = " can not be empty";
    if (isEmpty) {
      return "$fieldName$errorMessage";
    }
    return null;
  }
}
