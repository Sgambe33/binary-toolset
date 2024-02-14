import 'dart:math';
import 'dart:typed_data';

class Converters {

  static String normalizeNumber(String n, int bits) {
    return (n.length < bits) ? '0' * (bits - n.length) + n : n;
  }

  static String decimalToBinarySignMagnitude(int n, int bits) {
    String binary = n.abs().toRadixString(2);
    if(binary.length > bits){
      throw Exception('Number is too large for the given number of bits');
    }
    binary = normalizeNumber(binary, bits);
    if(n>=0){
      if(binary[0] == '0') {
        return binary;
      }
    }else{
      return '1${binary.substring(1, bits)}';
    }
    return binary;
  }

  static int signMagnitudeBinaryToDecimal(String n) {
    if (n[0] == '1') {
      return -int.parse(n.substring(1), radix: 2);
    } else {
      return int.parse(n, radix: 2);
    }
  }

  static String decimalToOctalSignMagnitude(int n, int bits) {
    String octal = n.abs().toRadixString(8);
    if (octal.length > bits) {
      throw Exception('Number is too large for the given number of bits');
    }
    octal = normalizeNumber(octal, bits);
    if (n >= 0) {
      if (octal[0] == '0') {
        return octal;
      }
    } else {
      return '7${octal.substring(1, bits)}';
    }
    return octal;
  }

  static int signMagnitudeOctalToDecimal(String n) {

    if (n[0] == '7') {
      return -int.parse(n.substring(1), radix: 8);
    } else {
      return int.parse(n, radix: 8);
    }
  }

  static String decimalToHexSignMagnitude(int n, int bits) {
    String hex = n.abs().toRadixString(16).toUpperCase();
    if (hex.length > bits) {
      throw Exception('Number is too large for the given number of bits');
    }
    hex = normalizeNumber(hex, bits);
    if (n >= 0) {
      if (hex[0] == '0') {
        return hex;
      }
    } else {
      return 'F${hex.substring(1, bits)}';
    }
    return hex;
  }

  static int signMagnitudeHexToDecimal(String n) {
    if (n[0] == 'F') {
      return -int.parse(n.substring(1), radix: 16);
    } else {
      return int.parse(n.substring(1), radix: 16);
    }
  }

  static String decimalToBaseComplement(int n, int bits, int base) {
    if(base != 2 && base != 8 && base != 16){
      throw Exception('Invalid base');
    }
    int max = pow(base, bits).toInt();
    return (n >= 0) ? normalizeNumber(n.toRadixString(base), bits) : normalizeNumber((max - n.abs()).toRadixString(base), bits);
  }

  static int baseComplementToDecimal(String n, int bits, int base) {
    if(base != 2 && base != 8 && base != 16){
      throw Exception('Invalid base');
    }
    int max = pow(base, bits).toInt();
    return (n[0] == '0') ? int.parse(n, radix: base) : -(max - int.parse(n, radix: base));
  }

  static String decimalToBaseMinusOneComplement(int n, int bits, int base) {
    if(base != 2 && base != 8 && base != 16){
      throw Exception('Invalid base');
    }
    int max = pow(base, bits).toInt();
    return (n >= 0) ? normalizeNumber(n.toRadixString(base), bits) : normalizeNumber((max - n.abs() - 1).toRadixString(base), bits);
  }

  static int baseMinusOneComplementToDecimal(String n, int bits, int base) {
    if(base != 2 && base != 8 && base != 16){
      throw Exception('Invalid base');
    }
    int max = pow(base, bits).toInt();
    return (n[0] == '0') ? int.parse(n, radix: base) : -(max - int.parse(n, radix: base) + 1);
  }

  static String decimalToExcessK(int n, int bits){
    int bias = pow(2, bits - 1).toInt() - 1;
    return (n + bias).toRadixString(2);
  }

  static int excessKToDecimal(String n, int bits){
    int bias = pow(2, bits - 1).toInt() - 1;
    return int.parse(n, radix: 2) - bias;
  }


  static String floatTo32BitsIEEE754(double n) {
    Float32List float32List = Float32List(1);
    float32List[0] = n;
    Uint8List uint8List = float32List.buffer.asUint8List();
    int intValue = ByteData.view(uint8List.buffer).getUint32(0, Endian.little);
    return intValue.toRadixString(2).padLeft(32, '0');
  }

  static String floatTo64BitsIEEE754(double n) {
    Float64List float64List = Float64List(1);
    float64List[0] = n;
    Uint8List uint8List = float64List.buffer.asUint8List();
    int intValue = ByteData.view(uint8List.buffer).getUint64(0, Endian.little);
    return intValue.toRadixString(2).padLeft(64, '0');
  }

  static double bits32IEEE754ToFloat(String n) {
    int intValue = int.parse(n, radix: 2);
    Uint8List uint8List = Uint8List(4);
    ByteData.view(uint8List.buffer).setUint32(0, intValue, Endian.little);
    Float32List float32List = Float32List.view(uint8List.buffer);
    return float32List[0];
  }

  static double bits64IEEE754ToFloat(String n) {
    int intValue = int.parse(n, radix: 2);
    Uint8List uint8List = Uint8List(8);
    ByteData.view(uint8List.buffer).setUint64(0, intValue, Endian.little);
    Float64List float64List = Float64List.view(uint8List.buffer);
    return float64List[0];
  }

}
