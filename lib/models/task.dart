// Data model class representing a single task
class Task {
  // Unique identifier for the task (immutable)
  final String id;
  // Task description/title (immutable)
  final String title;
  // When the task was created (immutable)
  final DateTime createdAt;
  // Whether the task is completed or not (immutable)
  final bool done;

  // Constructor with required parameters (const for performance)
  const Task({
    required this.id,        // Must provide an ID
    required this.title,     // Must provide a title
    required this.createdAt, // Must provide creation date
    required this.done,      // Must provide completion status
  });

  // Method to create a new Task with some fields updated (immutable pattern)
  Task copyWith({String? title, bool? done}) => Task(
        id: id,                                    // Keep original ID
        title: title ?? this.title,                // Use new title or keep original
        createdAt: createdAt,                      // Keep original creation date
        done: done ?? this.done,                   // Use new done status or keep original
      );

  // Convert Task object to Map for JSON serialization
  Map<String, dynamic> toMap() => {
        'id': id,                                  // Store ID as string
        'title': title,                            // Store title as string
        'createdAt': createdAt.toIso8601String(),  // Convert DateTime to ISO string
        'done': done,                              // Store boolean as is
      };

  // Factory constructor to create Task from Map (JSON deserialization)
  factory Task.fromMap(Map<String, dynamic> map) => Task(
        id: map['id'] as String,                   // Cast to String
        title: map['title'] as String,             // Cast to String
        createdAt: DateTime.parse(map['createdAt'] as String), // Parse ISO string to DateTime
        done: map['done'] as bool,                 // Cast to bool
      );
}
