extension PhoneFormatter on String {
  String toPhoneFormat() {
    String cleaned = replaceAll(RegExp(r'[^0-9]'), '');
    if (cleaned.length != 13) {
      throw const FormatException("O Telefone precisa ter 13 digitos");
    }
    String countryCode = cleaned.substring(0, 2);
    String areaCode = cleaned.substring(2, 4);
    String firstPart = cleaned.substring(4, 9);
    String secondPart = cleaned.substring(9, 13);
    return '+$countryCode ($areaCode) $firstPart-$secondPart';
  }
}
