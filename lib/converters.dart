import 'dart:math';

class Converters {
  ///Converts a decimal number to a binary number
  static String decimalToBinary(int n) {
    String binary = '';
    while (n > 0) {
      binary = (n % 2).toString() + binary;
      n = n ~/ 2;
    }
    return binary;
  }

  ///Converts a decimal number to an octal number
  static String decimalToOctal(int n) {
    String octal = '';
    while (n > 0) {
      octal = (n % 8).toString() + octal;
      n = n ~/ 8;
    }
    return octal;
  }

  ///Converts a decimal number to a hexadecimal number
  static String decimalToHex(int n) {
    String hex = '';
    while (n > 0) {
      int rem = n % 16;
      if (rem < 10) {
        hex = rem.toString() + hex;
      } else {
        hex = String.fromCharCode(rem + 55) + hex;
      }
      n = n ~/ 16;
    }
    return hex;
  }

  ///Converts a binary number to a decimal number
  static int binaryToDecimal(String n) {
    int decimal = 0;
    int exp = 0;
    String reversed = n.split('').reversed.join();
    for (int i = 0; i < reversed.length; i++) {
      decimal += int.parse(reversed[i]) * pow(2, exp) as int;
      exp++;
    }
    return decimal;
  }

  ///Converts an octal number to a decimal number
  static int octalToDecimal(String n) {
    int decimal = 0;
    int exp = 0;
    String reversed = n.split('').reversed.join();
    for (int i = 0; i < reversed.length; i++) {
      decimal += int.parse(reversed[i]) * pow(8, exp) as int;
      exp++;
    }
    return decimal;
  }

  ///Converts a hexadecimal number to a decimal number
  static int hexToDecimal(String n) {
    int decimal = 0;
    int exp = 0;
    String reversed = n.split('').reversed.join();
    for (int i = 0; i < reversed.length; i++) {
      int digit = reversed.codeUnitAt(i);
      if (digit >= 48 && digit <= 57) {
        decimal += (digit - 48) * pow(16, exp) as int;
      } else if (digit >= 65 && digit <= 70) {
        decimal += (digit - 55) * pow(16, exp) as int;
      } else if (digit >= 97 && digit <= 102) {
        decimal += (digit - 87) * pow(16, exp) as int;
      }
      exp++;
    }
    return decimal;
  }

  static String decimalToBinarySignMagnitude(int n) {
    String binary = decimalToBinary(n.abs());
    if (n >= 0) {
      if (binary[0] == '1') {
        return '0$binary';
      } else {
        return binary;
      }
    } else {
      if (binary[0] == '1') {
        return '1$binary';
      } else {
        return '1${binary.substring(1)}';
      }
    }
  }

  static int signMagnitudeBinaryToDecimal(String n) {
    if (n[0] == '1') {
      return -binaryToDecimal(n.substring(1));
    } else {
      return binaryToDecimal(n);
    }
  }

  static String decimalToOctalSignMagnitude(int n) {
    String octal = decimalToOctal(n.abs());
    if (n >= 0) {
      if (octal[0] == '0') {
        return octal;
      } else {
        return '0$octal';
      }
    } else {
      return '7$octal';
    }
  }

  static int signMagnitudeOctalToDecimal(String n) {
    if (n[0] == '7') {
      return -octalToDecimal(n.substring(1));
    } else {
      return octalToDecimal(n);
    }
  }

  static String decimalToHexSignMagnitude(int n) {
    String hex = decimalToHex(n.abs());
    if (n >= 0) {
      if (hex[0] == '0') {
        return hex;
      } else {
        return '0$hex';
      }
    } else {
      return 'F$hex';
    }
  }

  static int signMagnitudeHexToDecimal(String n) {
    if (n[0] == 'F') {
      return -hexToDecimal(n.substring(1));
    } else {
      return hexToDecimal(n);
    }
  }
}
