import 'dart:io';

void main() {
  final tasks = <String>[];

  print('Soal 8: Simple To-Do App');
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
