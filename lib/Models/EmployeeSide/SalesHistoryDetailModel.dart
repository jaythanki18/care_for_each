class SalesHistoryDetailModel {
  List<Server>? server;
  List<Server1>? server1;

  SalesHistoryDetailModel({this.server, this.server1});

  SalesHistoryDetailModel.fromJson(Map<String, dynamic> json) {
    if (json['server'] != null) {
      server = <Server>[];
      json['server'].forEach((v) {
        server!.add(new Server.fromJson(v));
      });
    }
    if (json['server1'] != null) {
      server1 = <Server1>[];
      json['server1'].forEach((v) {
        server1!.add(new Server1.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.server != null) {
      data['server'] = this.server!.map((v) => v.toJson()).toList();
    }
    if (this.server1 != null) {
      data['server1'] = this.server1!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Server {
  String? oid;
  String? customerid;
  String? grandtotal;
  String? date;
  String? paymentmode;
  int? paidamount;
  String? customername;
  String? customercompanyname;
  String? customercontactno;
  String? customeremailid;
  int? pendingamount;
  String? remindDate;

  Server(
      {this.oid,
        this.customerid,
        this.grandtotal,
        this.date,
        this.paymentmode,
        this.paidamount,
        this.customername,
        this.customercompanyname,
        this.customercontactno,
        this.customeremailid,
        this.pendingamount,
        this.remindDate});

  Server.fromJson(Map<String, dynamic> json) {
    oid = json['oid'];
    customerid = json['customerid'];
    grandtotal = json['grandtotal'];
    date = json['date'];
    paymentmode = json['paymentmode'];
    paidamount = json['paidamount'];
    customername = json['customername'];
    customercompanyname = json['customercompanyname'];
    customercontactno = json['customercontactno'];
    customeremailid = json['customeremailid'];
    pendingamount = json['pendingamount'];
    remindDate = json['remind_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['oid'] = this.oid;
    data['customerid'] = this.customerid;
    data['grandtotal'] = this.grandtotal;
    data['date'] = this.date;
    data['paymentmode'] = this.paymentmode;
    data['paidamount'] = this.paidamount;
    data['customername'] = this.customername;
    data['customercompanyname'] = this.customercompanyname;
    data['customercontactno'] = this.customercontactno;
    data['customeremailid'] = this.customeremailid;
    data['pendingamount'] = this.pendingamount;
    data['remind_date'] = this.remindDate;
    return data;
  }
}

class Server1 {
  String? date;
  String? amount;
  String? paymenttype;

  Server1({this.date, this.amount, this.paymenttype});

  Server1.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    amount = json['amount'];
    paymenttype = json['paymenttype'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['amount'] = this.amount;
    data['paymenttype'] = this.paymenttype;
    return data;
  }
}
