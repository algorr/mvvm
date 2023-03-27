// ignore_for_file: public_member_api_docs, sort_constructors_first
class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject({
    required this.title,
    required this.subTitle,
    required this.image,
  });
}

class Customer {
  String id;
  String name;
  int numOfNotifications;

  Customer({
    required this.id,
    required this.name,
    required this.numOfNotifications,
  });
}

class Contacts {
  String phone;
  String link;
  String email;

  Contacts({
    required this.phone,
    required this.link,
    required this.email,
  });
}

class Authentication {
  Customer customer;
  Contacts contacts;

  Authentication({
    required this.customer,
    required this.contacts,
  });
}
