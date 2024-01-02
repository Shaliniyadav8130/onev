class VerifyUser {
  VerifyUser({
    required this.status,
    required this.message,
    required this.phone,
    required this.driver,
    required this.token,
  });
  late final String status;
  late final String message;
  late final String phone;
  late final Driver driver;
  late final String token;

  VerifyUser.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    phone = json['phone'];
    driver = Driver.fromJson(json['driver']);
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['phone'] = phone;
    _data['driver'] = driver.toJson();
    _data['token'] = token;
    return _data;
  }
}

class Driver {
  Driver({
    required this.id,
    required this.date,
    required this.driverNumber,
    required this.driverName,
    required this.driverEmail,
    required this.vehicleNumber,
    required this.vehicleModel,
    required this.vehicleRent,
    required this.profilePic,
    required this.aadharFront,
    required this.aadharBack,
    required this.rcFront,
    required this.rcBack,
    required this.dlFront,
    required this.dlBack,
    required this.panFront,
    required this.insurance,
    required this.accountNumber,
    required this.accountIfsc,
    required this.balance,
    required this.paid,
    required this.status,
    required this.suspended,
    required this.onboarded,
    required this.points,
    required this.notiToken,
  });
  late final String id;
  late final int date;
  late final String driverNumber;
  late final String driverName;
  late final String driverEmail;
  late final String vehicleNumber;
  late final String vehicleModel;
  late final String vehicleRent;
  late final String profilePic;
  late final String aadharFront;
  late final String aadharBack;
  late final String rcFront;
  late final String rcBack;
  late final String dlFront;
  late final String dlBack;
  late final String panFront;
  late final String insurance;
  late final String accountNumber;
  late final String accountIfsc;
  late final int balance;
  late final int paid;
  late final bool status;
  late final bool suspended;
  late final bool onboarded;
  late final int points;
  late final String notiToken;

  Driver.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    date = json['date'];
    driverNumber = json['driver_number'];
    driverName = json['driver_name'];
    driverEmail = json['driver_email'];
    vehicleNumber = json['vehicle_number'];
    vehicleModel = json['vehicle_model'];
    vehicleRent = json['vehicle_rent'];
    profilePic = json['profile_pic'];
    aadharFront = json['aadhar_front'];
    aadharBack = json['aadhar_back'];
    rcFront = json['rc_front'];
    rcBack = json['rc_back'];
    dlFront = json['dl_front'];
    dlBack = json['dl_back'];
    panFront = json['pan_front'];
    insurance = json['insurance'];
    accountNumber = json['account_number'];
    accountIfsc = json['account_ifsc'];
    balance = json['balance'];
    paid = json['paid'];
    status = json['status'];
    suspended = json['suspended'];
    onboarded = json['onboarded'];
    points = json['points'];
    notiToken = json['noti_token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['date'] = date;
    _data['driver_number'] = driverNumber;
    _data['driver_name'] = driverName;
    _data['driver_email'] = driverEmail;
    _data['vehicle_number'] = vehicleNumber;
    _data['vehicle_model'] = vehicleModel;
    _data['vehicle_rent'] = vehicleRent;
    _data['profile_pic'] = profilePic;
    _data['aadhar_front'] = aadharFront;
    _data['aadhar_back'] = aadharBack;
    _data['rc_front'] = rcFront;
    _data['rc_back'] = rcBack;
    _data['dl_front'] = dlFront;
    _data['dl_back'] = dlBack;
    _data['pan_front'] = panFront;
    _data['insurance'] = insurance;
    _data['account_number'] = accountNumber;
    _data['account_ifsc'] = accountIfsc;
    _data['balance'] = balance;
    _data['paid'] = paid;
    _data['status'] = status;
    _data['suspended'] = suspended;
    _data['onboarded'] = onboarded;
    _data['points'] = points;
    _data['noti_token'] = notiToken;
    return _data;
  }
}
