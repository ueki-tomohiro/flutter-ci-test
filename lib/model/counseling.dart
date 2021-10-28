enum StatusEnum {
  accepted,
  completed,
  requested,
}

class Patient {
  final DateTime birthday;
  final int id;
  final String name;

  Patient({
    required this.id,
    required this.name,
    required this.birthday,
  });
}

class Counseling {
  Counseling({
    this.date,
    required this.id,
    this.message = "",
    required this.patient,
    required this.requestedDate,
    this.status = StatusEnum.requested,
  });

  final DateTime? date;

  final int id;

  final String message;

  final Patient patient;

  final DateTime requestedDate;

  final StatusEnum status;
}
