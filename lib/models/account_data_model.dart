class AccountDataModel {
  List userAccounts = [
    {
      'nama': 'Charles Makmur',
      'username': 'charles',
      'password': '1',
      'is_owner': true,
      'profile_picture': 'picture-1.png',
      'jadwal': 'Senin\n08.00 - 12.30\n\nSelasa\n13.00 - 15.00',
      'settings': {'dark_mode': false, 'dashboard_minimal': false}
    },
    {
      'nama': 'Frederic Davidsen',
      'username': 'fred',
      'password': '1',
      'is_owner': false,
      'profile_picture': 'picture-2.png',
      'jadwal': 'Rabu\n10.00 - 13.30\n\nKamis\n15.00 - 17.00',
      'settings': {'dark_mode': true, 'dashboard_minimal': true}
    }
  ];

  List<String> profilePictures = [
    'picture-1.png',
    'picture-2.png',
    'picture-3.png',
    'picture-4.png'
  ];
}
