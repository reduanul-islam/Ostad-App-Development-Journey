class TMUrls {
  static const String baseURL =
      'https://task-manager-api.ostad.live/api/v1';

  static const String registration =
      '$baseURL/Registration';

  static const String login =
      '$baseURL/Login';

  static const String createTask =
      '$baseURL/createTask';

  static const String taskCount =
      '$baseURL/taskStatusCount';

  static String taskByStatus(String status) {
    return '$baseURL/listTaskByStatus/$status';
  }

  static String updateTaskStatus(String taskId, String status) {
    return '$baseURL/updateTaskStatus/$taskId/$status';
  }

  static String deleteTask(String taskId) {
    return '$baseURL/deleteTask/$taskId';
  }
}