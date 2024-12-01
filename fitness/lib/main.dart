import 'package:flutter/material.dart';
import 'package:workout_fitness/data/services/Preferences.dart';
import 'package:workout_fitness/view/login/on_boarding_view.dart';
import 'package:workout_fitness/view/menu/menu_view.dart';
import 'common/color_extension.dart';

Future<void> main() async {
  try {
    // Đảm bảo Flutter bindings đã được khởi tạo
    WidgetsFlutterBinding.ensureInitialized();

    // Khởi tạo SharedPreferences
    await Preferences.init();

    // Kiểm tra user data
    final hasUserData = await checkUserData();

    runApp(MyApp(hasUserData: hasUserData));
  } catch (e) {
    print("Initialization error: $e");
    // Trong trường hợp lỗi, chạy app với hasUserData = false
    runApp(const MyApp(hasUserData: false));
  }
}

// Hàm kiểm tra dữ liệu user
Future<bool> checkUserData() async {
  try {
    final userInfo = Preferences.getUserInfo();
    // Kiểm tra xem có đầy đủ thông tin cần thiết không
    return userInfo['username'] != null &&
        userInfo['username'].toString().isNotEmpty &&
        userInfo['birthday'] != null &&
        userInfo['height'] != null &&
        userInfo['height'] != 0.0 &&
        userInfo['weight'] != null &&
        userInfo['weight'] != 0.0 &&
        userInfo['gender'] != null;
  } catch (e) {
    print("Error checking user data: $e");
    return false;
  }
}

class MyApp extends StatelessWidget {
  final bool hasUserData;

  const MyApp({
    super.key,
    required this.hasUserData,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workout Fitness',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Quicksand",
        colorScheme: ColorScheme.fromSeed(seedColor: TColor.primary),
        useMaterial3: false,
      ),
      home: hasUserData ? const MenuView() : const OnBoardingView(),
    );
  }
}