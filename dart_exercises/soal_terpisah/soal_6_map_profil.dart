void main() {
  final profile = <String, dynamic>{
    'name': 'Ahmad',
    'address': 'Bandung',
    'age': 21,
    'country': 'Indonesia',
  };

  profile['country'] = 'Malaysia';

  print('Soal 6: Map Profil (country di-update)');
  profile.forEach((key, value) {
    print('$key: $value');
  });
}
