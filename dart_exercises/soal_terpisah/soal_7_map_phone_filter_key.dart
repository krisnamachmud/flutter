void main() {
  final phoneBook = <String, String>{
    'Aldi': '081234567890',
    'Siti': '082345678901',
    'Rian': '083456789012',
    'Dewi': '084567890123',
    'Bima': '085678901234',
  };

  final keyLengthFour =
      phoneBook.keys.where((name) => name.length == 4).toList();

  print('Soal 7: Filter key map panjang 4');
  print('Isi phone book: $phoneBook');
  print('Key dengan panjang 4: $keyLengthFour');
}
