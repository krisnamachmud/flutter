void main() {
  final friends = [
    'andi',
    'brian',
    'amelia',
    'doni',
    'anna',
    'rudi',
    'agung',
  ];

  final startsWithA =
      friends.where((name) => name.toLowerCase().startsWith('a')).toList();

  print('Soal 5: Filter Teman (awalan a)');
  print('Semua teman: $friends');
  print('Teman yang diawali huruf a: $startsWithA');
}
