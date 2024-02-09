import 'package:binarytoolset/converters.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Convert Decimal to Binary', () {
    expect(Converters.decimalToBinary(10), '1010');
    expect(Converters.decimalToBinary(1011), '0011 1111 0011');
  });

  test('Convert Decimal to Octal', () {
    expect(Converters.decimalToOctal(10), '12');
    expect(Converters.decimalToOctal(1011), '1763');
  });

  test('Convert Decimal to Hex', () {
    expect(Converters.decimalToHex(10), 'A');
    expect(Converters.decimalToHex(1011), '3F3');
  });

  test('Convert Binary to Decimal', () {
    expect(Converters.binaryToDecimal('1010'), 10);
    expect(Converters.binaryToDecimal('001111110011'), 1011);
  });

  test('Convert Octal to Decimal', () {
    expect(Converters.octalToDecimal('12'), 10);
    expect(Converters.octalToDecimal('1763'), 1011);
  });

  test('Convert Hex to Decimal', () {
    expect(Converters.hexToDecimal('A'), 10);
    expect(Converters.hexToDecimal('a'), 10);
    expect(Converters.hexToDecimal('3F3'), 1011);
  });


}