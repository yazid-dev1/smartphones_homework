import 'dart:convert'; // حرف i صغير
import 'package:http/http.dart' as http;

Future<String> loginUser(String email, String password) async {
  try {
    final response = await http.post(
      Uri.parse('http://192.168.0.104/flutterapi/crudflutter/login.php'),
      body: {
        'email': email,
        'password': password,
      },
    );
    
    print("Response Body: ${response.body}");

    if (response.statusCode == 200) {
      // إذا كان السيرفر يرسل كلمة Success مباشرة كنص عادي:
      // نقوم بعمل trim() لإزالة أي مسافات أو سطور زائدة قد يرسلها ملف الـ PHP
      if (response.body.trim() == 'Success') {
        return 'Success';
      } else {
        return 'Error';
      }
    } else {
      return 'Server Error: ${response.statusCode}';
    }
  } catch (e) {
    // من الأفضل دائماً إحاطة عمليات الشبكة بـ try-catch لتفادي انهيار التطبيق عند انقطاع الإنترنت
    print("Exception caught: $e");
    return 'Connection Failed';
  }
}
