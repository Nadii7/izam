extension StringEx on String {
  bool get isEmail =>
      RegExp(r'^[a-zA-Z]{3}\.[0-9]{4}@izam\.co$').hasMatch(this);

  bool get isPassword =>
      RegExp(r'^(?=.*[0-9])(?=.*[!$#^*]).{8,}$').hasMatch(this);
}
