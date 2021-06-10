class ServicesModel {
  String name;
  String wallet;
  String walletLogo;
  String walletNumber;

  ServicesModel(this.name, this.wallet, this.walletLogo, this.walletNumber);
}

List<ServicesModel> wallets = ServiceData
    .map((item) => ServicesModel(
        item['name'], item['wallet'], item['walletLogo'], item['walletNumber']))
    .toList();

var ServiceData = [
  {
    "name": "Kibtek",
    "wallet": "Gopay",
    "walletLogo": 'assets/images/kibtek_logo.png',
    "walletNumber": '+62*** **** 1932'
  },
  {
    "name": "Telsim",
    "wallet": "Ovo",
    "walletLogo": 'assets/images/telsim-logo.png',
    "walletNumber": '+62*** **** 2245'
  },
  {
    "name": "Turk Telekom",
    "wallet": "Gopay",
    "walletLogo": 'assets/images/turk_telekom_logo.png',
    "walletNumber": '+62*** **** 2245'
  },
  {
    "name": "Turkcell",
    "wallet": "Dana",
    "walletLogo": 'assets/images/turkcell.png',
    "walletNumber": '+62*** **** 1932'
  }
];
