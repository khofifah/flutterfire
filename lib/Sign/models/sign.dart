class Sign {
  final String nama, email;

  Sign({this.nama, this.email});

  factory Sign.fromString(String dataNama, String dataEmail) {
    return Sign(
      nama: dataNama,
      email: dataEmail,
    );
  }

  factory Sign.fromMap(Map<String, dynamic> data) {
    return Sign(
      nama: data['nama'],
      email: data['email'],
    );
  }

  Map toMap(Sign sign) {
    var data = Map<String, dynamic>();
    data['email'] = sign.email;
    data['nama'] = sign.nama;
    return data;
  }
}
