class WishlistDisplayModel {
  List<Server>? server;

  WishlistDisplayModel({this.server});

  WishlistDisplayModel.fromJson(Map<String, dynamic> json) {
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
  Null? custname;
  Null? custemailid;
  Null? custmobile;
  Null? expecteddate;
  Null? custCompanyName;
  Null? custaddress;
  Null? custdesc;
  Null? wcid;

  Server(
      {this.custname,
        this.custemailid,
        this.custmobile,
        this.expecteddate,
        this.custCompanyName,
        this.custaddress,
        this.custdesc,
        this.wcid});

  Server.fromJson(Map<String, dynamic> json) {
    custname = json['custname'];
    custemailid = json['custemailid'];
    custmobile = json['custmobile'];
    expecteddate = json['expecteddate'];
    custCompanyName = json['cust_company_name'];
    custaddress = json['custaddress'];
    custdesc = json['custdesc'];
    wcid = json['wcid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['custname'] = this.custname;
    data['custemailid'] = this.custemailid;
    data['custmobile'] = this.custmobile;
    data['expecteddate'] = this.expecteddate;
    data['cust_company_name'] = this.custCompanyName;
    data['custaddress'] = this.custaddress;
    data['custdesc'] = this.custdesc;
    data['wcid'] = this.wcid;
    return data;
  }
}
