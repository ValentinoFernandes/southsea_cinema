class UserSettings {
  final String address;
  final String email;
  final bool recieveNewsLetter;
  final String patronNumber;

  const UserSettings(
      {this.patronNumber = '',
      this.address = '',
      this.email = '',
      this.recieveNewsLetter = false});
}
