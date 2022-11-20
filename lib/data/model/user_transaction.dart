class UserTransaction {
  String? username;
  int? dataAmount;
  String? transactionId;
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

  UserTransaction.fromJson( Map<String, dynamic> json,) {
    error = json['detail'];
    username = json['user'] ??= '';
    transactionId = json['TransactionID'] ??= '';
    credit = json['Credit'] ??= '';
    dataAmount = json['Data_amount'] ??= '';
    toWallet = json['To_wallet'] ??= '';
    receivedFrom = json['Received_From'];
    sentTo = json['Sent_To'];
    dateTime = DateTime.parse(json['Timestamp']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = username;
    data['TransactionID'] = transactionId;
    data['Credit'] = credit;
    data['Data_amount'] = dataAmount;
    data['To_wallet'] = toWallet;
    data['Received_From'] = receivedFrom;
    data['Sent_To'] = sentTo;
    // data['Timestamp'] = dateTime;

    return data;
  }
}
