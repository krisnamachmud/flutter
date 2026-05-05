// 6. Write a program to print full name from first name and last name using user input.

import 'dart:io';

void main() {
  stdout.write("Enter your first name: ");
  String firstName = stdin.readLineSync()!;

  stdout.write("Enter your last name: ");
  String lastName = stdin.readLineSync()!;

  String fullName = "$firstName $lastName";

  print("Your full name is: $fullName");
}
