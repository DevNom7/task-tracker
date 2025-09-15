// Import Flutter's material design library
import 'package:flutter/material.dart';

// Reusable widget for task input (StatelessWidget = no state changes)
class TaskInput extends StatelessWidget {
  // Text controller to manage the input field
  final TextEditingController controller;
  // Callback function called when user adds a task
  final ValueChanged<String> onAdd;

  // Constructor with required parameters
  const TaskInput({super.key, required this.controller, required this.onAdd});

  // Build method defines the widget tree
  @override
  Widget build(BuildContext context) {
    // Return a horizontal row layout
    return Row(
      children: [
        // Expanded widget takes up remaining space
        Expanded(
          child: TextField(
            // Connect the text controller
            controller: controller,
            // Decorate the input field
            decoration: const InputDecoration(
              hintText: 'Add a task…',           // Placeholder text
              border: OutlineInputBorder(),      // Border style
            ),
            // Call onAdd when user presses enter
            onSubmitted: onAdd,
          ),
        ),
        // Add spacing between input and button
        const SizedBox(width: 12),
        // Button with icon and text
        FilledButton.icon(
          // Call onAdd with current text when pressed
          onPressed: () => onAdd(controller.text),
          // Add task icon
          icon: const Icon(Icons.add_task_outlined),
          // Button text
          label: const Text('Add'),
        ),
      ],
    );
  }
}
