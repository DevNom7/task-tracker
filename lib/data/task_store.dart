// Import Dart's JSON conversion utilities
import 'dart:convert';
// Import SharedPreferences for local storage
import 'package:shared_preferences/shared_preferences.dart';
// Import our Task model
import '../models/task.dart';

// Class responsible for persisting tasks to local storage
class TaskStore {
  // Private constant for the storage key (versioned for future updates)
  static const _key = 'tasks_v1';

  // Load tasks from local storage
  Future<List<Task>> load() async {
    try {
      // Get SharedPreferences instance (async operation)
      final prefs = await SharedPreferences.getInstance();
      // Retrieve the stored JSON string
      final raw = prefs.getString(_key);
      // Return empty list if no data exists
      if (raw == null || raw.isEmpty) return [];
      // Parse JSON string to List of Maps
      final list = (jsonDecode(raw) as List).cast<Map<String, dynamic>>();
      // Convert Maps to Task objects and sort by creation date
      return list.map((m) => Task.fromMap(m)).toList()
        ..sort((a, b) => a.createdAt.compareTo(b.createdAt));
    } catch (e) {
      // Return empty list if any error occurs (graceful degradation)
      return [];
    }
  }

  // Save tasks to local storage
  Future<void> save(List<Task> tasks) async {
    try {
      // Get SharedPreferences instance (async operation)
      final prefs = await SharedPreferences.getInstance();
      // Convert Task objects to Maps
      final list = tasks.map((t) => t.toMap()).toList();
      // Convert to JSON string and save
      await prefs.setString(_key, jsonEncode(list));
    } catch (e) {
      // Handle save error silently for demo purposes
    }
  }
}
