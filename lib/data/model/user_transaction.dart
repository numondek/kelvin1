class UserTransaction {
  String? username;
  String? dataAmount;
  int? transactionId;
  bool? credit;
  bool? toWallet;
  DateTime? dateTime;
  String? sentTo;
  String? receivedFrom;
  String? error;

  UserTransaction(
      {this.username,
      this.dateTime,
      this.dataAmount,
      this.credit,
      this.transactionId,
      this.toWallet,
      this.receivedFrom,
      this.sentTo});

  UserTransaction.withError(String errorMessage) {
    error = errorMessage;
  }

  UserTransaction.fromJson(Map<String, dynamic> json,) {

    error = json['detail'];
    username = json['First_Name'] ??= '';
    transactionId = json['Last_Name'] ??= '';
    credit = json['Gender'] ??= '';
    dataAmount = json['City'] ??= '';
    toWallet = json['Phone_number'] ??= '';
    receivedFrom = json['Data_balance'];
    sentTo = json['Mobile_network'];
    dateTime = json['Mobile_network'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['First_Name'] = username;
    data['Last_Name'] = transactionId;
    data['Gender'] = credit;
    data['City'] = dataAmount;
    data['Phone_number'] = toWallet;
    data['Data_balance'] = receivedFrom;
    data['Mobile_network'] = sentTo;
    data['Mobile_network'] = dateTime;


    return data;
  }
}
