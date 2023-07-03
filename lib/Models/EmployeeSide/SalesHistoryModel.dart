class SalesHistoryModel {
  List<Server>? server;

  SalesHistoryModel({this.server});

  SalesHistoryModel.fromJson(Map<String, dynamic> json) {
    if (json['server'] != null) {
      server = <Server>[];
      json['server'].forEach((v) {
        server!.add(new Server.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.server != null) {
      data['server'] = this.server!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Server {
  String? oid;
  String? grandtotal;
  String? date;
  String? paymentmode;
  String? pendingamount;
  String? customername;
  String? customerid;

  Server(
      {this.oid,
        this.grandtotal,
        this.date,
        this.paymentmode,
        this.pendingamount,
        this.customername,
        this.customerid});

  Server.fromJson(Map<String, dynamic> json) {
    oid = json['oid'];
    grandtotal = json['grandtotal'];
    date = json['date'];
    paymentmode = json['paymentmode'];
    pendingamount = json['pendingamount'];
    customername = json['customername'];
    customerid = json['customerid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['oid'] = this.oid;
    data['grandtotal'] = this.grandtotal;
    data['date'] = this.date;
    data['paymentmode'] = this.paymentmode;
    data['pendingamount'] = this.pendingamount;
    data['customername'] = this.customername;
    data['customerid'] = this.customerid;
    return data;
  }
}
