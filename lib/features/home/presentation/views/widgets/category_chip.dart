import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../lib.dart';

class CategoryChip extends ConsumerWidget {
  final CategoryEntity? categoryEntity;
  const CategoryChip({super.key, this.categoryEntity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelected = ref.watch(categoryControllerProvider.select((asyncVal) => asyncVal.valueOrNull?.selectedCategory?.id == categoryEntity?.id));
    return ChoiceChip(
      label: Text(categoryEntity?.name ?? ""),
      selected: isSelected,
      onSelected: (selected) {
        ref.read(categoryControllerProvider.notifier).selectCategory(categoryEntity);
      },
    );
  }
}
