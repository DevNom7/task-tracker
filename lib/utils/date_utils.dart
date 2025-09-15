// Utility class for date formatting
class DateUtils {
  // Convert a DateTime to a human-readable relative time string
  static String friendlyTime(DateTime dt) {
    // Get current time
    final now = DateTime.now();
    // Calculate the difference
    final diff = now.difference(dt);
    // Return appropriate string based on time difference
    if (diff.inMinutes < 1) return 'just now';                    // Less than 1 minute
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';     // Less than 1 hour
    if (diff.inHours < 24) return '${diff.inHours}h ago';         // Less than 1 day
    // More than 1 day - show date in YYYY-MM-DD format
    return '${dt.year}-${two(dt.month)}-${two(dt.day)}';
  }

  // Helper method to format numbers with leading zeros (e.g., 1 -> "01")
  static String two(int n) => n.toString().padLeft(2, '0');
}
