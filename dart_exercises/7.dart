import 'dart:io';

void main() {
  exerciseListNames();
  exerciseSetFruits();
  exerciseExpenses();
  exerciseDays();
  exerciseFriendsWhere();
  exerciseMapProfile();
  exerciseMapWhereKeyLength();
  runTodoApp();
}

void exerciseListNames() {
  print('\n=== 1) List Nama ===');
  final names = ['Andi', 'Budi', 'Citra', 'Dina', 'Eko'];

  for (final name in names) {
    print(name);
  }
}

void exerciseSetFruits() {
  print('\n=== 2) Set Buah ===');
  final fruits = {'Apel', 'Jeruk', 'Mangga', 'Pisang', 'Anggur'};

  for (final fruit in fruits) {
    print(fruit);
  }
}

void exerciseExpenses() {
  print('\n=== 3) Total Expenses ===');
  final expenses = <double>[];

  final count = readInt('Masukkan jumlah data pengeluaran: ');

  for (var index = 1; index <= count; index++) {
    final amount = readDouble('Pengeluaran ke-$index: ');
    expenses.add(amount);
  }

  final total = expenses.fold<double>(0, (sum, value) => sum + value);
  print('Daftar pengeluaran: $expenses');
  print('Total pengeluaran: $total');
}

void exerciseDays() {
  print('\n=== 4) List Hari ===');
  final days = <String>[];

  days.add('Senin');
  days.add('Selasa');
  days.add('Rabu');
  days.add('Kamis');
  days.add('Jumat');
  days.add('Sabtu');
  days.add('Minggu');

  for (final day in days) {
    print(day);
  }
}

void exerciseFriendsWhere() {
  print('\n=== 5) Cari Nama Teman yang Diawali Huruf a ===');
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

  print('Semua teman: $friends');
  print('Teman yang diawali huruf a: $startsWithA');
}

void exerciseMapProfile() {
  print('\n=== 6) Map Profil ===');
  final profile = <String, dynamic>{
    'name': 'Ahmad',
    'address': 'Bandung',
    'age': 21,
    'country': 'Indonesia',
  };

  profile['country'] = 'Malaysia';

  profile.forEach((key, value) {
    print('$key: $value');
  });
}

void exerciseMapWhereKeyLength() {
  print('\n=== 7) Map Name-Phone + Filter Key Panjang 4 ===');
  final phoneBook = <String, String>{
    'Aldi': '081234567890',
    'Siti': '082345678901',
    'Rian': '083456789012',
    'Dewi': '084567890123',
    'Bima': '085678901234',
  };

  final keyLengthFour =
      phoneBook.keys.where((name) => name.length == 4).toList();

  print('Isi phone book: $phoneBook');
  print('Key dengan panjang 4: $keyLengthFour');
}

void runTodoApp() {
  print('\n=== 8) Simple To-Do App ===');
  final tasks = <String>[];

  while (true) {
    print('\nMenu To-Do:');
    print('1. Lihat task');
    print('2. Tambah task');
    print('3. Hapus task');
    print('0. Keluar');

    final choice = readInt('Pilih menu: ');

    if (choice == 0) {
      print('Keluar dari To-Do App.');
      break;
    }

    switch (choice) {
      case 1:
        if (tasks.isEmpty) {
          print('Belum ada task.');
        } else {
          print('Daftar task:');
          for (var index = 0; index < tasks.length; index++) {
            print('${index + 1}. ${tasks[index]}');
          }
        }
        break;
      case 2:
        stdout.write('Masukkan task baru: ');
        final task = stdin.readLineSync()?.trim() ?? '';
        if (task.isEmpty) {
          print('Task tidak boleh kosong.');
        } else {
          tasks.add(task);
          print('Task berhasil ditambahkan.');
        }
        break;
      case 3:
        if (tasks.isEmpty) {
          print('Tidak ada task untuk dihapus.');
          break;
        }

        for (var index = 0; index < tasks.length; index++) {
          print('${index + 1}. ${tasks[index]}');
        }

        final taskNumber = readInt('Masukkan nomor task yang ingin dihapus: ');

        if (taskNumber < 1 || taskNumber > tasks.length) {
          print('Nomor task tidak valid.');
        } else {
          final removedTask = tasks.removeAt(taskNumber - 1);
          print('Task "$removedTask" berhasil dihapus.');
        }
        break;
      default:
        print('Pilihan tidak tersedia.');
    }
  }
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
