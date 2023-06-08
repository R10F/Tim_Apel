class AccountModel {
  String nama;
  String username;
  String password;
  bool isOwner;
  String jadwal;
  String profilePicture;
  Map<String, dynamic> settings;

  AccountModel(
      {required this.nama,
      required this.username,
      required this.password,
      required this.jadwal,
      required this.profilePicture,
      this.isOwner = false,
      Map<String, dynamic>? settings})
      : settings = settings ?? {'dark_mode': false, 'dashboard_minimal': false};
}

class AccountData {
  List<AccountModel> userAccounts = [
    AccountModel(
        nama: 'Charles Makmur',
        username: 'charles',
        password: '1',
        isOwner: true,
        profilePicture: 'picture-1.png',
        jadwal: 'Senin\n08.00 - 12.30\n\nSelasa\n13.00 - 15.00'),
    AccountModel(
        nama: 'Frederic Davidsen',
        username: 'fred',
        password: '1',
        profilePicture: 'picture-2.png',
        jadwal: 'Rabu\n10.00 - 13.30\n\nKamis\n15.00 - 17.00',
        settings: {'dark_mode': true, 'dashboard_minimal': true})
  ];

  List<String> profilePictures = [
    'picture-1.png',
    'picture-2.png',
    'picture-3.png',
    'picture-4.png'
  ];
}
