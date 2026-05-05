import 'dart:io';

void main() {
  final expenses = <double>[];

  final count = readInt('Masukkan jumlah data pengeluaran: ');

  for (var index = 1; index <= count; index++) {
    final amount = readDouble('Pengeluaran ke-$index: ');
    expenses.add(amount);
  }

  final total = expenses.fold<double>(0, (sum, value) => sum + value);

  print('\nSoal 3: Total Expenses');
  print('Daftar pengeluaran: $expenses');
  print('Total pengeluaran: $total');
}

int readInt(String prompt) {
  while (true) {
    stdout.write(prompt);
    final input = stdin.readLineSync();
    final value = int.tryParse(input ?? '');
    if (value != null) {
      return value;
    }
    print('Input tidak valid. Masukkan angka bulat.');
  }
}

double readDouble(String prompt) {
  while (true) {
    stdout.write(prompt);
    final input = stdin.readLineSync();
    final value = double.tryParse(input ?? '');
    if (value != null) {
      return value;
    }
    print('Input tidak valid. Masukkan angka.');
  }
}
