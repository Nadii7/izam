import 'dart:math';

extension StringEx on String {
  bool get isEmail =>
      RegExp(r'^[a-zA-Z]{3}\.[0-9]{4}@izam\.co$').hasMatch(this);

  bool get isPassword =>
      RegExp(r'^(?=.*[0-9])(?=.*[!$#^*]).{8,}$').hasMatch(this);
}

String generatePassword() {
  final random = Random();
  final symbols = ['!', '\$', '#', '^', '*'];

  // Generate a random password with the specified criteria
  String password = '';
  password += String.fromCharCode(random.nextInt(26) + 97); // lowercase letter
  password += String.fromCharCode(random.nextInt(26) + 65); // uppercase letter
  password += random.nextInt(10).toString(); // number
  password += symbols[random.nextInt(symbols.length)]; // symbol

  while (password.length < 8) {
    final charType = random.nextInt(4);
    switch (charType) {
      case 0:
        password +=
            String.fromCharCode(random.nextInt(26) + 97); // lowercase letter
        break;
      case 1:
        password +=
            String.fromCharCode(random.nextInt(26) + 65); // uppercase letter
        break;
      case 2:
        password += random.nextInt(10).toString(); // number
        break;
      case 3:
        password += symbols[random.nextInt(symbols.length)]; // symbol
        break;
    }
  }

  // Shuffle the generated password
  final passwordCharacters = password.split('');
  passwordCharacters.shuffle(random);
  password = passwordCharacters.join();

  return password;
}
