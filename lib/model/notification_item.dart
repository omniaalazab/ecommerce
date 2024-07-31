class NotificationModel {
  final String? title;
  final String? body;

  NotificationModel({required this.title, required this.body});
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'body': body,

      // 'user': user,
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      title: map['title'],

      body: map["body"],

      // user: map['user']
    );
  }
}
