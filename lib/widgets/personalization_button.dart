import 'package:deepcare/screens/personalization/personalization_modal_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../core/models/personalization_settings.dart';
import '../utils/personalization_controller_provider.dart';

class PersonalizationButton extends ConsumerWidget {
  const PersonalizationButton({super.key});

  void _showPersonalizationSheet(
    BuildContext context,
    PersonalizationSettings settings,
  ) {
    showModalBottomSheet<void>(
      context: context,
      useSafeArea: true,
      showDragHandle: true,
      useRootNavigator: true,
      isScrollControlled: true,
      builder: (context) => const PersonalizationModalSheet(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(personalizationControllerProvider);

    return IconButton(
      onPressed: () => _showPersonalizationSheet(context, settings),
      icon: const Icon(LucideIcons.paintbrush),
    );
  }
}
