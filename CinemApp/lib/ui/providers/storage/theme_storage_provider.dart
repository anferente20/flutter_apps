import 'package:cinemapp/ui/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeConfigurationProvider = FutureProvider.autoDispose((ref) {
  return ref.watch(localStorageRepoisitoryProvider).getThemeconfiguration();
});
