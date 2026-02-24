import 'package:flutter_riverpod/flutter_riverpod.dart';

var loginState = StateProvider<bool>((ref) => false);

final currentIndexProvider = StateProvider<int>((ref) => 0);
