class DriverProfileModel {
  bool? status;
  String? message;
  Data? data;

  DriverProfileModel({this.status, this.message, this.data});

  DriverProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? firstName;
  String? middleName;
  String? lastName;
  String? phone;
  String? email;
  String? location;
  String? dob;
  String? identityCard;
  String? insuranceNo;
  String? vehicleNo;
  String? licenceNo;
  String? licenceFrontImage;
  String? licenceBackImage;
  String? insurance;
  String? idFrontImage;
  String? idBackImage;
  String? profileImage;

  Data(
      {this.firstName,
        this.middleName,
        this.lastName,
        this.phone,
        this.email,
        this.location,
        this.dob,
        this.identityCard,
        this.insuranceNo,
        this.profileImage,
        this.vehicleNo,
        this.licenceNo,
        this.licenceFrontImage,
        this.licenceBackImage,
        this.insurance,
        this.idFrontImage,
        this.idBackImage});

  Data.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    middleName = json['middle_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    profileImage = json['profile_image'];
    email = json['email'];
    location = json['location'];
    dob = json['dob'];
    identityCard = json['identity_card'];
    insuranceNo = json['insurance_no'];
    vehicleNo = json['vehicle_no'];
    licenceNo = json['licence_no'];
    licenceFrontImage = json['licence_front_image'];
    licenceBackImage = json['licence_back_image'];
    insurance = json['insurance'];
    idFrontImage = json['id_front_image'];
    idBackImage = json['id_back_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['middle_name'] = this.middleName;
    data['last_name'] = this.lastName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['profile_image'] = this.profileImage;
    data['location'] = this.location;
    data['dob'] = this.dob;
    data['identity_card'] = this.identityCard;
    data['insurance_no'] = this.insuranceNo;
    data['vehicle_no'] = this.vehicleNo;
    data['licence_no'] = this.licenceNo;
    data['licence_front_image'] = this.licenceFrontImage;
    data['licence_back_image'] = this.licenceBackImage;
    data['insurance'] = this.insurance;
    data['id_front_image'] = this.idFrontImage;
    data['id_back_image'] = this.idBackImage;
    return data;
  }
}
