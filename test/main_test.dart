import 'package:binarytoolset/converters.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Convert Decimal to Binary Sign & Magnitude", () {
    expect(Converters.decimalToBinarySignMagnitude(10, 8), "00001010");
    expect(Converters.decimalToBinarySignMagnitude(-85, 10), "1001010101");
    expect(Converters.decimalToBinarySignMagnitude(255, 10), "0011111111");
    expect(Converters.decimalToBinarySignMagnitude(-441, 10), "1110111001");
    expect(Converters.decimalToBinarySignMagnitude(103, 10), "0001100111");
    expect(Converters.decimalToBinarySignMagnitude(-236, 10), "1011101100");
    expect(Converters.decimalToBinarySignMagnitude(-158, 10), "1010011110");
    expect(Converters.decimalToBinarySignMagnitude(-8, 5), "11000");
    expect(Converters.decimalToBinarySignMagnitude(-5, 5), "10101");
    expect(Converters.decimalToBinarySignMagnitude(-54, 7), "1110110");
    expect(Converters.decimalToBinarySignMagnitude(-64, 8), "11000000");
    expect(Converters.decimalToBinarySignMagnitude(0, 8), "00000000");
  });

  test("Convert Decimal to Octal Sign & Magnitude", () {
    expect(Converters.decimalToOctalSignMagnitude(10, 8), "00000012");
    expect(Converters.decimalToOctalSignMagnitude(-85, 10), "7000000125");
    expect(Converters.decimalToOctalSignMagnitude(255, 10), "0000000377");
    expect(Converters.decimalToOctalSignMagnitude(-441, 10), "7000000671");
    expect(Converters.decimalToOctalSignMagnitude(103, 10), "0000000147");
    expect(Converters.decimalToOctalSignMagnitude(-236, 10), "7000000354");
    expect(Converters.decimalToOctalSignMagnitude(-158, 10), "7000000236");
    expect(Converters.decimalToOctalSignMagnitude(-8, 5), "70010");
    expect(Converters.decimalToOctalSignMagnitude(-5, 5), "70005");
    expect(Converters.decimalToOctalSignMagnitude(-54, 7), "7000066");
    expect(Converters.decimalToOctalSignMagnitude(-64, 8), "70000100");
    expect(Converters.decimalToOctalSignMagnitude(0, 8), "00000000");
  });

  test("Convert Decimal to Hexadecimal Sign & Magnitude", () {
    expect(Converters.decimalToHexSignMagnitude(10, 8), "0000000A");
    expect(Converters.decimalToHexSignMagnitude(-85, 10), "F000000055");
    expect(Converters.decimalToHexSignMagnitude(255, 10), "00000000FF");
    expect(Converters.decimalToHexSignMagnitude(-441, 10), "F0000001B9");
    expect(Converters.decimalToHexSignMagnitude(103, 10), "0000000067");
    expect(Converters.decimalToHexSignMagnitude(-236, 10), "F0000000EC");
    expect(Converters.decimalToHexSignMagnitude(-158, 10), "F00000009E");
    expect(Converters.decimalToHexSignMagnitude(-8, 5), "F0008");
    expect(Converters.decimalToHexSignMagnitude(-5, 5), "F0005");
    expect(Converters.decimalToHexSignMagnitude(-54, 7), "F000036");
    expect(Converters.decimalToHexSignMagnitude(-64, 8), "F0000040");
    expect(Converters.decimalToHexSignMagnitude(0, 8), "00000000");
  });


  test("Convert Binary Sign & Magnitude to Decimal", () {
    expect(Converters.signMagnitudeBinaryToDecimal("00001010"), 10);
    expect(Converters.signMagnitudeBinaryToDecimal("1001010101"), -85);
    expect(Converters.signMagnitudeBinaryToDecimal("0011111111"), 255);
    expect(Converters.signMagnitudeBinaryToDecimal("1110111001"), -441);
    expect(Converters.signMagnitudeBinaryToDecimal("0001100111"), 103);
    expect(Converters.signMagnitudeBinaryToDecimal("1011101100"), -236);
    expect(Converters.signMagnitudeBinaryToDecimal("1010011110"), -158);
    expect(Converters.signMagnitudeBinaryToDecimal("11000"), -8);
    expect(Converters.signMagnitudeBinaryToDecimal("10101"), -5);
    expect(Converters.signMagnitudeBinaryToDecimal("1110110"), -54);
    expect(Converters.signMagnitudeBinaryToDecimal("11000000"), -64);
    expect(Converters.signMagnitudeBinaryToDecimal("00000000"), 0);
  });

  test("Convert Octal Sign & Magnitude to Decimal", () {
    expect(Converters.signMagnitudeOctalToDecimal("00000012"), 10);
    expect(Converters.signMagnitudeOctalToDecimal("7000000125"), -85);
    expect(Converters.signMagnitudeOctalToDecimal("0000000377"), 255);
    expect(Converters.signMagnitudeOctalToDecimal("7000000671"), -441);
    expect(Converters.signMagnitudeOctalToDecimal("0000000147"), 103);
    expect(Converters.signMagnitudeOctalToDecimal("7000000354"), -236);
    expect(Converters.signMagnitudeOctalToDecimal("7000000236"), -158);
    expect(Converters.signMagnitudeOctalToDecimal("70010"), -8);
    expect(Converters.signMagnitudeOctalToDecimal("70005"), -5);
    expect(Converters.signMagnitudeOctalToDecimal("7000066"), -54);
    expect(Converters.signMagnitudeOctalToDecimal("70000100"), -64);
    expect(Converters.signMagnitudeOctalToDecimal("00000000"), 0);
  });

  test("Convert Hexadecimal Sign & Magnitude to Decimal", () {
    expect(Converters.signMagnitudeHexToDecimal("0000000A"), 10);
    expect(Converters.signMagnitudeHexToDecimal("F000000055"), -85);
    expect(Converters.signMagnitudeHexToDecimal("00000000FF"), 255);
    expect(Converters.signMagnitudeHexToDecimal("F0000001B9"),-441);
    expect(Converters.signMagnitudeHexToDecimal("0000000067"),103);
    expect(Converters.signMagnitudeHexToDecimal("F0000000EC"),-236);
    expect(Converters.signMagnitudeHexToDecimal("F00000009E"),-158);
    expect(Converters.signMagnitudeHexToDecimal("F0008"),-8);
    expect(Converters.signMagnitudeHexToDecimal("F0005"),-5);
    expect(Converters.signMagnitudeHexToDecimal("F000036"),-54);
    expect(Converters.signMagnitudeHexToDecimal("F0000040"),-64);
    expect(Converters.signMagnitudeHexToDecimal("00000000"), 0);
  });

}
