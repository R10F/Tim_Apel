class Account {
  String nama;
  String username;
  String password;
  String jadwal;
  String profilePicture;
  Map<String, dynamic> settings;
  bool isOwner = false;
  bool isActive = true;

  Account(
      {required this.nama,
      required this.username,
      required this.password,
      required this.jadwal,
      required this.profilePicture,
      Map<String, dynamic>? settings})
      : settings = settings ?? {'dark_mode': false, 'dashboard_minimal': false};

  void setIsOwner(bool value) {
    isOwner = value;
  }

  void setIsActive(bool value) {
    isActive = value;
  }
}

class AccountData {
  late List<Account> userAccounts;

  AccountData() {
    Account charles = Account(
        nama: 'Charles Makmur',
        username: 'charles',
        password: '1',
        profilePicture: 'picture-1.png',
        jadwal: 'Senin\n08.00 - 12.30\n\nSelasa\n13.00 - 15.00');
    charles.setIsOwner(true);

    Account alexander = Account(
        nama: 'Alexander Parker',
        username: 'alexander',
        password: '1',
        profilePicture: 'picture-5.png',
        jadwal: 'Senin\n08.00 - 12.30\n\nSelasa\n13.00 - 15.00');
    alexander.setIsActive(false);

    userAccounts = [
      charles,
      alexander,
      Account(
          nama: 'Frederic Davidsen',
          username: 'fred',
          password: '1',
          profilePicture: 'picture-2.png',
          jadwal: 'Rabu\n10.00 - 13.30\n\nKamis\n15.00 - 17.00',
          settings: {'dark_mode': true, 'dashboard_minimal': true}),
      Account(
          nama: 'Erin Gunawan',
          username: 'er',
          password: '1',
          profilePicture: 'picture-3.png',
          jadwal: 'Rabu\n10.00 - 13.30\n\nKamis\n15.00 - 17.00',
          settings: {'dark_mode': true, 'dashboard_minimal': false}),
      Account(
          nama: 'Farrell Rio Fa',
          username: 'rel',
          password: '1',
          profilePicture: 'picture-4.png',
          jadwal: 'Rabu\n10.00 - 13.30\n\nKamis\n15.00 - 17.00',
          settings: {'dark_mode': false, 'dashboard_minimal': true}),
    ];
  }

  List<String> profilePictures = [
    'picture-1.png',
    'picture-2.png',
    'picture-3.png',
    'picture-4.png',
    'picture-5.png',
    'picture-6.png',
    'picture-7.png',
    'picture-8.png',
    'picture-9.png',
    'picture-10.png',
  ];
}
