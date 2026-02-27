class NotificationModel {
  final String title;
  final String body;
  final DateTime receivedAt;
  bool isRead;

  NotificationModel({
    required this.title,
    required this.body,
    required this.receivedAt,
    this.isRead = false,
  });

  // JSON માંથી ઓબ્જેક્ટ બનાવવા માટે
  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      title: json['title'] ?? 'No Title',
      body: json['body'] ?? 'No Body',
      receivedAt: DateTime.parse(json['receivedAt']),
      isRead: json['isRead'] ?? false,
    );
  }

  // ઓબ્જેક્ટમાંથી JSON બનાવવા માટે
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': body,
      'receivedAt': receivedAt.toIso8601String(),
      'isRead': isRead,
    };
  }
}
