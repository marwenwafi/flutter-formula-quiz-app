import 'dart:async';
import 'package:flutter/material.dart';
import 'package:formula_quiz/services/models.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {

  final SupabaseClient client = Supabase.instance.client;

  Future<List<Category>> getCategories() async {
    final response =  await client.from('categories').select();
    final List<dynamic> data = response as List<dynamic>;
    return data.map((item) => Category.fromJson(item)).toList();
  }

}