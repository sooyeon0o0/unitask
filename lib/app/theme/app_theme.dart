import 'package:flutter/material.dart';

class AppTheme {
  static const Color _primaryColor = Color(0xFF3B82F6);
  static const Color _darkBackground = Color(0xFF0F172A);
  static const Color _darkSurface = Color(0xFF1E293B);

  static ThemeData get light => ThemeData.light(useMaterial3: true).copyWith(
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: Colors.white,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
      backgroundColor: _primaryColor,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: _primaryColor),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: _primaryColor,
        padding: const .symmetric(vertical: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFFF9FAFB),
      prefixIconColor: const Color(0xFF9CA3AF),
      prefixIconConstraints: const BoxConstraints(maxWidth: 35, minHeight: 10),
      hintStyle: const TextStyle(color: Color(0xFF9CA3AF)),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
  );

  // 새로운 dark 테마
  static ThemeData get dark => ThemeData.dark(useMaterial3: true).copyWith(
    brightness: Brightness.dark,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: _darkBackground,

    // FloatingActionButton 설정
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
      backgroundColor: _primaryColor,
    ),

    // TextButton 설정
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: _primaryColor.withOpacity(
          0.9,
        ), // 다크모드에서 가독성을 위해 살짝 조정 가능
      ),
    ),

    // ElevatedButton 설정
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: _primaryColor,
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        ), // .symmetric 앞에 EdgeInsets 추가
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),

    // InputDecoration (입력창) 설정
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: _darkSurface, // 배경보다 약간 밝은 색으로 입체감 부여
      prefixIconColor: const Color(0xFF94A3B8), // Slate 400 계열
      // 기존 maxWidth: 10은 아이콘이 잘릴 수 있어 수치를 확인해보시는 것이 좋습니다.
      prefixIconConstraints: const BoxConstraints(minWidth: 40),
      hintStyle: const TextStyle(color: Color(0xFF64748B)), // Slate 500 계열
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        // 포커스 시 강조 효과 (선택 사항)
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: _primaryColor, width: 1),
      ),
    ),
  );
}
