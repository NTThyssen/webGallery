class Email {
  final String from;
  final String subject;
  final String body;

  Email({
    required this.from,
    required this.subject,
    required this.body,
  });

  factory Email.fromJson(Map<String, dynamic> json) {
    return Email(
      from: json['from'],
      subject: json['subject'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'from': from,
      'subject': subject,
      'body': body,
    };
  }
}
