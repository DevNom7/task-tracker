// Import Flutter's material design library
import 'package:flutter/material.dart';
// Import our Task model
import '../models/task.dart';
// Import home page for TaskFilter enum
import '../pages/home_page.dart';
// Import only TaskFilter enum from home page
import '../pages/home_page.dart' show TaskFilter;
// Import date utilities with alias to avoid naming conflicts
import '../utils/date_utils.dart' as app_utils;

// Reusable widget for displaying list of tasks
class TaskList extends StatelessWidget {
  // List of tasks to display
  final List<Task> tasks;
  // Callback function when task is toggled (checked/unchecked)
  final void Function(Task task) onToggle;
  // Callback function when task is deleted
  final void Function(Task task) onDelete;
  // Current filter being applied
  final TaskFilter filter;
  // Whether data is still loading
  final bool loading;

  // Constructor with all required parameters
  const TaskList({
    super.key,
    required this.tasks,      // Must provide tasks list
    required this.onToggle,   // Must provide toggle callback
    required this.onDelete,   // Must provide delete callback
    required this.filter,     // Must provide current filter
    required this.loading,    // Must provide loading state
  });

  // Build method defines the widget tree
  @override
  Widget build(BuildContext context) {
    // Show empty state if no tasks
    if (tasks.isEmpty) {
      return Center(
        child: Text(
          // Show different messages based on loading state and filter
          loading
              ? 'Loading…'                                    // Still loading
              : filter == TaskFilter.completed
                  ? 'No completed tasks yet.'                 // No completed tasks
                  : 'No tasks. Add your first one!',          // No tasks at all
          // Apply theme styling
          style: Theme.of(context).textTheme.titleMedium,
        ),
      );
    }

    // Return scrollable list with separators
    return ListView.separated(
      // Add padding around the list
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 96),
      // Number of items in the list
      itemCount: tasks.length,
      // Widget to show between items (spacing)
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      // Function to build each item
      itemBuilder: (context, i) {
        // Get the task at this index
        final task = tasks[i];
        // Return a dismissible (swipeable) widget
        return Dismissible(
          // Unique key for the dismissible widget
          key: Key(task.id),
          // Background widget when swiping left
          background: _swipeBg(Alignment.centerLeft, const EdgeInsets.only(left: 16)),
          // Background widget when swiping right
          secondaryBackground: _swipeBg(Alignment.centerRight, const EdgeInsets.only(right: 16)),
          // Call onDelete when dismissed
          onDismissed: (_) => onDelete(task),
          // The actual task item
          child: Material(
            // Add subtle shadow
            elevation: 1,
            // Round the corners
            borderRadius: BorderRadius.circular(16),
            // The checkbox list tile
            child: CheckboxListTile(
              // Round the tile corners to match Material
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              // Whether the checkbox is checked
              value: task.done,
              // Call onToggle when checkbox is tapped
              onChanged: (_) => onToggle(task),
              // Task title with conditional styling
              title: Text(
                task.title,
                style: TextStyle(
                  // Strike through if completed
                  decoration: task.done ? TextDecoration.lineThrough : null,
                  // Italic if completed
                  fontStyle: task.done ? FontStyle.italic : null,
                ),
              ),
              // Show when the task was added
              subtitle: Text('Added ${app_utils.DateUtils.friendlyTime(task.createdAt)}'),
              // Put checkbox on the left side
              controlAffinity: ListTileControlAffinity.leading,
            ),
          ),
        );
      },
    );
  }

  // Helper method to create swipe background
  Widget _swipeBg(Alignment align, EdgeInsets padding) => Container(
        // Align the content
        alignment: align,
        // Add padding
        padding: padding,
        // Red background with transparency
        color: Colors.red.withValues(alpha: 0.8),
        // Delete icon
        child: const Icon(Icons.delete_outline),
      );
}
