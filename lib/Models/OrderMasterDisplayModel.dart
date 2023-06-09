class OrderMasterDisplayModel {
  List<Server>? server;

  OrderMasterDisplayModel({this.server});

  OrderMasterDisplayModel.fromJson(Map<String, dynamic> json) {
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
  String? customerid;
  String? companyname;
  String? customername;
  String? custEmailid;
  String? custContactNum;
  int? paidAmmount;

  Server(
      {this.oid,
        this.grandtotal,
        this.date,
        this.customerid,
        this.companyname,
        this.customername,
        this.custEmailid,
        this.custContactNum,
        this.paidAmmount});

  Server.fromJson(Map<String, dynamic> json) {
    oid = json['oid'];
    grandtotal = json['grandtotal'];
    date = json['date'];
    customerid = json['customerid'];
    companyname = json['companyname'];
    customername = json['customername'];
    custEmailid = json['cust_emailid'];
    custContactNum = json['cust_contact_num'];
    paidAmmount = json['paid_ammount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['oid'] = this.oid;
    data['grandtotal'] = this.grandtotal;
    data['date'] = this.date;
    data['customerid'] = this.customerid;
    data['companyname'] = this.companyname;
    data['customername'] = this.customername;
    data['cust_emailid'] = this.custEmailid;
    data['cust_contact_num'] = this.custContactNum;
    data['paid_ammount'] = this.paidAmmount;
    return data;
  }
}
