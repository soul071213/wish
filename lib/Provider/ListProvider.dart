import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wish/model/Lists.dart';

final ListProvider = StateProvider<List<Lists>>((ref) => []);