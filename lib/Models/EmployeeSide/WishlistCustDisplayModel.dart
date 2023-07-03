class WishlistCustDisplayModel {
  List<Server>? server;

  WishlistCustDisplayModel({this.server});

  WishlistCustDisplayModel.fromJson(Map<String, dynamic> json) {
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
  String? custname;
  String? custemailid;
  String? custmobile;
  String? expecteddate;
  String? wcid;
  String? custCompanyName;
  String? custaddress;
  String? custdesc;

  Server(
      {this.custname,
        this.custemailid,
        this.custmobile,
        this.expecteddate,
        this.wcid,
        this.custCompanyName,
        this.custaddress,
        this.custdesc});

  Server.fromJson(Map<String, dynamic> json) {
    custname = json['custname'];
    custemailid = json['custemailid'];
    custmobile = json['custmobile'];
    expecteddate = json['expecteddate'];
    wcid = json['wcid'];
    custCompanyName = json['cust_company_name'];
    custaddress = json['custaddress'];
    custdesc = json['custdesc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['custname'] = this.custname;
    data['custemailid'] = this.custemailid;
    data['custmobile'] = this.custmobile;
    data['expecteddate'] = this.expecteddate;
    data['wcid'] = this.wcid;
    data['cust_company_name'] = this.custCompanyName;
    data['custaddress'] = this.custaddress;
    data['custdesc'] = this.custdesc;
    return data;
  }
}
