// 4. Write a program in Dart that finds simple interest.
//    Formula = (p * t * r) / 100

import 'dart:io';

void main() {
  print("=== Simple Interest Calculator ===");

  stdout.write("Enter Principal Amount (p): ");
  double p = double.parse(stdin.readLineSync()!);

  stdout.write("Enter Time in years (t): ");
  double t = double.parse(stdin.readLineSync()!);

  stdout.write("Enter Rate of Interest (r): ");
  double r = double.parse(stdin.readLineSync()!);

  double simpleInterest = (p * t * r) / 100;

  print("\nPrincipal: $p");
  print("Time: $t years");
  print("Rate: $r%");
  print("Simple Interest = $simpleInterest");
}
