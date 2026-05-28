import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:unitask/app/theme/preview.dart';

@AppThemePreview(group: 'Items', name: 'TaskCard')
Widget preview() {
  return TaskCard(
    onChecked: (value) {},
    onSelected: () {},
    checked: false,
    title: 'Flutter 개발',
    date: DateTime.now(),
    category: Container(width: 30, height: 15, color: Colors.blue),
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
    return Card(
      child: Column(
        crossAxisAlignment: .stretch,
        spacing: 5,
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              category,
              Checkbox(onChanged: onChecked, value: checked),
            ],
          ),
          Text(title),
          Row(
            spacing: 5,
            children: [
              const Icon(LucideIcons.calendar),
              // TODO:아이콘 색상 설정은 아래와 같음
              // =< D-3 :빨강
              // =< D-7 :주황
              // > D-7 :검정
              Text(
                '', //TODO: DateTime 사용, intal라이브러리 사용해서 TimeFormat 해야함
              ),
            ],
          ),
        ],
      ),
    );
  }
}
