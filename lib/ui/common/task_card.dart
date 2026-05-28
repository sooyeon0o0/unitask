import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:unitask/app/theme/preview.dart';
import 'package:unitask/ui/common/subject_label.dart';

@AppThemePreview(group: 'Cards', name: 'TaskCard')
Widget preview() {
  return TaskCard(
    onChecked: (value) {},
    onSelected: () {},
    checked: true,
    title: 'Unitask 끝내기',
    date: DateTime.now().copyWith(month: 6, day: 1),
    category: const SubjectLabel(text: 'Flutter'),
  );
}

class TaskCard extends StatelessWidget {
  final bool checked;
  final String title;
  final DateTime date;
  final VoidCallback? onSelected;
  final Function(bool? value)? onChecked;
  final Widget category;

  const TaskCard({
    super.key,
    required this.checked,
    required this.title,
    required this.date,
    required this.category,
    this.onSelected,
    this.onChecked,
  });

  @override
  Widget build(BuildContext context) {
    // <= D-3 :빨강
    // <= D-7 :주황
    // > D-7 :검정
    final dDay = DateTime.now().difference(date).inDays;
    final dDayColor = switch (dDay) {
      >= 3 => Colors.red, // 3일 남음
      >= 7 => Colors.orange, // 7일 남음
      _ => Colors.black, // 기본
    };
    return Card(
      child: Container(
        height: 120,
        padding: const .symmetric(vertical: 6, horizontal: 12),
        child: Column(
          mainAxisAlignment: .spaceBetween,
          crossAxisAlignment: .stretch,
          spacing: 5,
          children: [
            // 과목 라벨 / 체크박스
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                category,
                Checkbox(
                  onChanged: onChecked,
                  value: checked,
                  visualDensity: .compact,
                  activeColor: Colors.blue,

                  fillColor: .resolveWith(
                    (states) => states.contains(WidgetState.selected)
                        ? Colors.blue
                        : const Color(0xFFF3F4F6),
                  ),
                  // fillColor: .resolveWith((states) {
                  //   if (states.contains(WidgetState.selected)) {
                  //     return Colors.blue;
                  //   }
                  //   return const Color(0xFFF3F4F6);
                  // }
                  shape: RoundedRectangleBorder(borderRadius: .circular(5)),
                  side: const BorderSide(color: Colors.transparent),
                  materialTapTargetSize: .shrinkWrap,
                ),
              ],
            ),
            Text(
              title,
              overflow: .ellipsis,
              maxLines: 1,
              style: TextStyle(fontSize: 15, fontWeight: .bold),
            ),
            Row(
              spacing: 5,
              children: [
                Icon(LucideIcons.calendar, size: 16, color: dDayColor),

                Text(
                  DateFormat('yyyy.MM.dd').format(date),
                  style: TextStyle(fontSize: 12, color: dDayColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
