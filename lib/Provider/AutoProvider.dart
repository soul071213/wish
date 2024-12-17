import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wish/model/User.dart';

final userProvider = StateProvider<List<User>>((ref) => []);