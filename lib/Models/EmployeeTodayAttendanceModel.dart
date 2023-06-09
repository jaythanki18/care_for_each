class EmployeeTodayAttendanceModel {
  List<Server>? server;

  EmployeeTodayAttendanceModel({this.server});

  EmployeeTodayAttendanceModel.fromJson(Map<String, dynamic> json) {
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
  String? result;
  String? logintime;
  String? logouttime;
  String? loginDate;
  String? longLogin;
  String? lateLogin;
  String? longLogout;
  String? lateLogout;
  String? locationLogin;
  String? locationLogout;
  String? logoutDate;
  String? employeeName;
  String? employeeDesignation;
  String? employeePhoto;
  String? eEmailid;

  Server(
      {this.result,
        this.logintime,
        this.logouttime,
        this.loginDate,
        this.longLogin,
        this.lateLogin,
        this.longLogout,
        this.lateLogout,
        this.locationLogin,
        this.locationLogout,
        this.logoutDate,
        this.employeeName,
        this.employeeDesignation,
        this.employeePhoto,
        this.eEmailid});

  Server.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    logintime = json['logintime'];
    logouttime = json['logouttime'];
    loginDate = json['login_date'];
    longLogin = json['long_login'];
    lateLogin = json['late_login'];
    longLogout = json['long_logout'];
    lateLogout = json['late_logout'];
    locationLogin = json['location_login'];
    locationLogout = json['location_logout'];
    logoutDate = json['logout_date'];
    employeeName = json['employee_name'];
    employeeDesignation = json['employee_designation'];
    employeePhoto = json['employee_photo'];
    eEmailid = json['e_emailid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    data['logintime'] = this.logintime;
    data['logouttime'] = this.logouttime;
    data['login_date'] = this.loginDate;
    data['long_login'] = this.longLogin;
    data['late_login'] = this.lateLogin;
    data['long_logout'] = this.longLogout;
    data['late_logout'] = this.lateLogout;
    data['location_login'] = this.locationLogin;
    data['location_logout'] = this.locationLogout;
    data['logout_date'] = this.logoutDate;
    data['employee_name'] = this.employeeName;
    data['employee_designation'] = this.employeeDesignation;
    data['employee_photo'] = this.employeePhoto;
    data['e_emailid'] = this.eEmailid;
    return data;
  }
}
