class Email {
  final String from;
  final String subject;
  final String body;
  final String name;

  Email({
    required this.from,
    required this.subject,
    required this.body,
    required this.name,
  });

  factory Email.fromJson(Map<String, dynamic> json) {
    return Email(
      from: json['from'],
      subject: json['subject'],
      body: json['body'],
      name: json['name']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'from': from,
      'subject': subject,
      'body': body,
      'name':  name
    };
  }
}
