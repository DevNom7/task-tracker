// Import Flutter's material design library
import 'package:flutter/material.dart';
// Import our data storage class
import '../data/task_store.dart';
// Import our Task model
import '../models/task.dart';
// Import our custom input widget
import '../widgets/task_input.dart';
// Import our custom list widget
import '../widgets/task_list.dart';

// Enum to define different task filtering options
enum TaskFilter { all, active, completed }

// Main home page widget (StatefulWidget because it manages state)
class TaskHomePage extends StatefulWidget {
  // Constructor with const for performance
  const TaskHomePage({super.key});

  // Create the state object
  @override
  State<TaskHomePage> createState() => _TaskHomePageState();
}

// Private state class for the home page
class _TaskHomePageState extends State<TaskHomePage> {
  // Instance of our data storage class
  final _store = TaskStore();
  // Controller for the text input field
  final _controller = TextEditingController();
  // List to hold all tasks
  List<Task> _tasks = [];
  // Current filter being applied
  TaskFilter _filter = TaskFilter.all;
  // Whether data is still loading
  bool _loading = true;

  // Called when the widget is first created
  @override
  void initState() {
    super.initState();
    // Load tasks from storage when widget initializes
    _load();
  }

  // Load tasks from local storage
  Future<void> _load() async {
    // Get tasks from storage (async operation)
    final tasks = await _store.load();
    // Update the UI state
    setState(() {
      _tasks = tasks;        // Store the loaded tasks
      _loading = false;      // Mark loading as complete
    });
  }

  // Save tasks to local storage (shorthand method)
  Future<void> _persist() async => _store.save(_tasks);

  // Add a new task to the list
  void _addTask(String title) {
    // Remove whitespace from the title
    final t = title.trim();
    // Don't add empty tasks
    if (t.isEmpty) return;
    // Update the UI state
    setState(() {
      // Create new list with existing tasks plus new task
      _tasks = [
        ..._tasks,  // Spread existing tasks
        // Create new task with unique ID and current timestamp
        Task(
          id: DateTime.now().microsecondsSinceEpoch.toString(),  // Unique ID
          title: t,                                              // Task title
          createdAt: DateTime.now(),                             // Current time
          done: false,                                           // Not completed
        ),
      ];
    });
    // Save to storage
    _persist();
  }

  // Toggle the completion status of a task
  void _toggle(Task task) {
    // Find the index of the task in the list
    final i = _tasks.indexWhere((x) => x.id == task.id);
    // Return if task not found
    if (i == -1) return;
    // Update the UI state
    setState(() {
      // Create new list with updated task
      _tasks = [
        ..._tasks.sublist(0, i),                    // Tasks before the one being updated
        _tasks[i].copyWith(done: !task.done),       // Updated task with flipped done status
        ..._tasks.sublist(i + 1),                   // Tasks after the one being updated
      ];
    });
    // Save to storage
    _persist();
  }

  // Delete a specific task
  void _delete(Task task) {
    // Update the UI state
    setState(() {
      // Filter out the task with matching ID
      _tasks = _tasks.where((t) => t.id != task.id).toList();
    });
    // Save to storage
    _persist();
  }

  // Remove all completed tasks
  void _clearCompleted() {
    // Update the UI state
    setState(() {
      // Keep only tasks that are not completed
      _tasks = _tasks.where((t) => !t.done).toList();
    });
    // Save to storage
    _persist();
  }

  // Getter that returns tasks based on current filter
  List<Task> get _visible {
    switch (_filter) {
      case TaskFilter.active:
        // Return only incomplete tasks
        return _tasks.where((t) => !t.done).toList();
      case TaskFilter.completed:
        // Return only completed tasks
        return _tasks.where((t) => t.done).toList();
      case TaskFilter.all:
        // Return all tasks
        return _tasks;
    }
  }

  // Build method that creates the widget tree
  @override
  Widget build(BuildContext context) {
    // Count how many tasks are not completed
    final activeCount = _tasks.where((t) => !t.done).length;

    // Return the main scaffold (app structure)
    return Scaffold(
      // Top app bar
      appBar: AppBar(
        // App title
        title: const Text('Task Tracker - Naim Lindsay'),
        // Action buttons in the app bar
        actions: [
          // Clear completed tasks button
          IconButton(
            tooltip: 'Clear completed',  // Tooltip for accessibility
            // Only enable if there are completed tasks
            onPressed: _tasks.any((t) => t.done) ? _clearCompleted : null,
            icon: const Icon(Icons.cleaning_services_outlined),
          ),
          // Filter dropdown menu
          PopupMenuButton<TaskFilter>(
            initialValue: _filter,  // Current selected filter
            // Update filter when selection changes
            onSelected: (v) => setState(() => _filter = v),
            // Menu items
            itemBuilder: (context) => const [
              PopupMenuItem(value: TaskFilter.all, child: Text('All')),
              PopupMenuItem(value: TaskFilter.active, child: Text('Active')),
              PopupMenuItem(value: TaskFilter.completed, child: Text('Completed')),
            ],
            icon: const Icon(Icons.filter_list),
            tooltip: 'Filter',
          ),
        ],
      ),
      // Main body content
      body: Column(
        children: [
          // Task input section
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: TaskInput(
              controller: _controller,  // Text controller for input
              onAdd: (v) {
                _addTask(v);           // Add the task
                _controller.clear();   // Clear the input field
              },
            ),
          ),
          // Status text section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              // Animated switcher for smooth transitions
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: _loading
                    ? const SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Text(
                        // Show different messages based on task count
                        activeCount == 0
                            ? 'All done! 🎉'  // No active tasks
                            : '$activeCount task${activeCount == 1 ? '' : 's'} remaining',  // Task count
                        key: ValueKey(activeCount),  // Key for animation
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
              ),
            ),
          ),
          // Task list section (takes remaining space)
          Expanded(
            child: TaskList(
              tasks: _visible,     // Filtered tasks
              onToggle: _toggle,   // Toggle callback
              onDelete: _delete,   // Delete callback
              filter: _filter,     // Current filter
              loading: _loading,   // Loading state
            ),
          ),
        ],
      ),
      // Floating action button for adding tasks
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddDialog(context),  // Show add dialog when pressed
        icon: const Icon(Icons.add),               // Add icon
        label: const Text('New Task'),             // Button text
      ),
    );
  }

  // Show dialog for adding a new task
  void _showAddDialog(BuildContext context) {
    // Create text controller for the dialog
    final c = TextEditingController();
    // Show the dialog
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Add task'),  // Dialog title
        content: TextField(
          controller: c,                // Text controller
          autofocus: true,              // Focus the field automatically
          decoration: const InputDecoration(hintText: 'e.g. Ship portfolio link'),
          // Add task when enter is pressed
          onSubmitted: (v) {
            _addTask(v);
            Navigator.of(context).pop();  // Close dialog
          },
        ),
        actions: [
          // Cancel button
          TextButton(
            onPressed: () => Navigator.of(context).pop(),  // Close dialog
            child: const Text('Cancel'),
          ),
          // Add button
          FilledButton(
            onPressed: () {
              _addTask(c.text);           // Add the task
              Navigator.of(context).pop(); // Close dialog
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}

