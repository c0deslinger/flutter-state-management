class Response {
  Status status;
  UserDetails? userDetails;
  Response({required this.status, required this.userDetails});
}

enum Status { loading, success, error, idle }

class UserDetails {
  String nama;
  int umur;
  UserDetails({required this.nama, required this.umur});
}
