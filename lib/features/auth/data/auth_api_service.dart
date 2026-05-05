import 'package:firebase_auth/firebase_auth.dart';

class AuthApiService {
  AuthApiService() : _auth = FirebaseAuth.instance;

  final FirebaseAuth _auth;

  Future<String> login({required String email, required String password}) async {
    try {
      print('🔐 LOGIN ATTEMPT dengan Firebase: email=$email');

      // Login menggunakan Firebase Authentication
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Dapatkan ID token
      final idToken = await userCredential.user!.getIdToken();
      
      print('✅ LOGIN SUCCESS! UID: ${userCredential.user!.uid}');
      print('🔑 Token: ${idToken?.substring(0, 50)}...');
      
      return idToken ?? 'firebase_token_${userCredential.user!.uid}';
    } on FirebaseAuthException catch (e) {
      print('❌ FIREBASE AUTH ERROR: ${e.code} - ${e.message}');
      
      String errorMessage = _getErrorMessage(e.code);
      throw Exception(errorMessage);
    } catch (e) {
      print('💥 UNEXPECTED ERROR: $e');
      throw Exception('Terjadi kesalahan: $e');
    }
  }

  String _getErrorMessage(String code) {
    switch (code) {
      case 'user-not-found':
        return 'Email tidak terdaftar';
      case 'wrong-password':
        return 'Password salah';
      case 'invalid-email':
        return 'Email tidak valid';
      case 'user-disabled':
        return 'Akun telah dinonaktifkan';
      case 'too-many-requests':
        return 'Terlalu banyak percobaan login gagal. Coba lagi nanti';
      case 'operation-not-allowed':
        return 'Email/Password login tidak diaktifkan';
      default:
        return 'Login gagal: $code';
    }
  }
}
