class ProceedWithWCIDModel {
  List<Server>? server;

  ProceedWithWCIDModel({this.server});

  ProceedWithWCIDModel.fromJson(Map<String, dynamic> json) {
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
  String? custaddress;
  String? custCompanyName;

  Server(
      {this.custname,
        this.custemailid,
        this.custmobile,
        this.custaddress,
        this.custCompanyName});

  Server.fromJson(Map<String, dynamic> json) {
    custname = json['custname'];
    custemailid = json['custemailid'];
    custmobile = json['custmobile'];
    custaddress = json['custaddress'];
    custCompanyName = json['cust_company_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['custname'] = this.custname;
    data['custemailid'] = this.custemailid;
    data['custmobile'] = this.custmobile;
    data['custaddress'] = this.custaddress;
    data['cust_company_name'] = this.custCompanyName;
    return data;
  }
}
