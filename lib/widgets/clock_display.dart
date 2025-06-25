import 'package:deepcare/core/extensions/context.dart';
import 'package:deepcare/core/extensions/datetime.dart';
import 'package:deepcare/core/extensions/text_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClockDisplay extends StatelessWidget {
  final DateTime currentTime;

  const ClockDisplay({super.key, required this.currentTime});

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final localeName = locale.languageCode;

    final alwaysUse24HourFormat = MediaQuery.alwaysUse24HourFormatOf(context);

    final timeFormat = alwaysUse24HourFormat
        ? DateFormat('HH:mm', localeName)
        : DateFormat('h:mm', localeName);

    final periodFormat = DateFormat('a', localeName);
    final dateFormat = DateFormat('E d. MMM.', localeName);

    return Column(
      spacing: 16,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: timeFormat.format(currentTime),
                style: context.textTheme.displayLarge?.bold,
              ),
              if (!alwaysUse24HourFormat)
                TextSpan(
                  text: ' ${periodFormat.format(currentTime)}',
                  style: context.textTheme.titleLarge?.semibold,
                ),
            ],
          ),
        ),
        Text.rich(
          textAlign: TextAlign.center,
          TextSpan(
            children: [
              TextSpan(
                text: dateFormat.format(currentTime),
                style: context.textTheme.displaySmall?.semibold,
              ),
              WidgetSpan(
                child: Text(
                  ' ${context.l10n.weekNumber(currentTime.weekOfYear)}',
                  style: context.textTheme.labelLarge,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
