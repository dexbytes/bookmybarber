// ignore_for_file: unnecessary_null_comparison

class Validation {
  /*===============check valid mobile or not=================*/
  bool validMobile(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(patttern);
    if (regExp.hasMatch(value)) {
      return true;
    }
    return false;
  }

  /*===============validate name field=================*/
  bool restrictNumbersOnly(String value) {
    if (value.length > 0) {
      String patttern = r'^[^0-9.,(){}+-@!#$&*%]+$';

      RegExp regExp = new RegExp(patttern);
      if (regExp.hasMatch(value)) {
        return true;
      }
    }
    return false;
  }

  /*==============check phone not blank=================*/
  bool isNotEmpty(String value) {
    try {
      if (value != null) {
        value = value.trim();
        if (value.length != 0) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  /*==============check lenght of phone =================*/
  bool phoneLength(String value) {
    if (value != null && value.length >= 7 && value.length <= 12) {
      return true;
    }
    return false;
  }

  /*==============check lenght of phone =================*/
  bool postCodeLength(String value) {
    if (value != null && value.length >= 6 || value.length <= 2) {
      return true;
    }
    return false;
  }

  /*==============check lenght of password =================*/
  bool isPasswordValidation(String value) {
    if (value != null && value.length >= 4 && value.length <= 16) {
      return true;
    }
    return false;
  }

  /*===============validate name field=================*/
  bool validateNameField(String value) {
    if (value.length > 0) {
      String patttern = r'(^[a-zA-Z ]*$)';
      RegExp regExp = new RegExp(patttern);
      if (regExp.hasMatch(value)) {
        return true;
      }
    }
    return false;
  }
  /* bool validateNameField(String value) {
   if(value.length>2){
     String patttern = r'(^[a-zA-Z ]*$)';
     RegExp regExp = new RegExp(patttern);
     if (regExp.hasMatch(value)) {
       return true;
     }
   }
    return false;
  }*/

  /*===============validate name field=================*/
  bool validateFullNameField(String value) {
    if (value.length > 2) {
      String patttern = r'(^[a-zA-Z ]*$)';
      RegExp regExp = new RegExp(patttern);
      if (regExp.hasMatch(value)) {
        return true;
      }
    }
    return false;
  }

  /*===============validate name field=================*/
  bool passwordLength(String value) {
    if (value.length < 6) {
      return false;
    }
    return true;
  }

  bool validateVerificationCodeLength(String value) {
    if (value.length < 6) {
      return false;
    }
    return true;
  }

  /*========================validate email field=============*/
//  bool validateEmail(String email){
//    String patttern = r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
//    RegExp regExp = new RegExp(patttern);
//    if (regExp.hasMatch(email)) {
//      return true;
//    }
//    return false;
//  }

  bool validateEmail(String email) {
    //String pattern = r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+\.[a-zA-Z]+";
    RegExp regExp = new RegExp(pattern);
    if (regExp.hasMatch(email)) {
      return true;
    }
    return false;
  }

  /*========================validate email field=============*/
  bool validatePassword(String pass) {
    // String pattern = r"^(?=.*[a-zA-Z])(?=.*?[0-9])";
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    if (regExp.hasMatch(pass)) {
      return true;
    }
    return false;
  }

  /* =======================validate phone number field===========*/
  bool validatePhoneNumber(String pass) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(pattern);
    if (regExp.hasMatch(pass)) {
      return true;
    }
    return false;
  }

  /*========================validate username field=============*/
  bool validateUserName(String pass) {
    // String pattern = r"^[a-zA-Z0-9]";
    String pattern = r"^[._a-zA-Z0-9]+$";
    RegExp regExp = new RegExp(pattern);
    //RegExp regExp1 = new RegExp(r"^[0-9]");
    RegExp regExp2 = new RegExp(r"^[.]");
    if (regExp.hasMatch(pass)) {
      if (pass.startsWith(regExp2)) {
        return false;
      }
      return true;
    }
    return false;
  }
}

Validation validation = Validation();
