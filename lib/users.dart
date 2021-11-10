class UserModel {
  String? name;
  String? userID;
  String? email;
  String? photoUrl;
  UserModel({this.email, this.name, this.userID, this.photoUrl});
}

List<UserModel> users = [
  UserModel(
    name: "Sarthak Agarwal",
    userID: "107022971815933530283",
    photoUrl:
        "https://lh3.googleusercontent.com/a/AATXAJxzgRYULHOBmXNp12NRmGDaI_9UYMAQt3y0kS8h=s96-c",
    email: "agarwalsarthak456@gmail.com",
  ),
  UserModel(
      name: "Sarthak Agarwal",
      email: "7as1931006@gmail.com",
      userID: "101831561063543566830",
      photoUrl:
          "https://lh3.googleusercontent.com/a/AATXAJzG8vwKpFAKLbbhsXLJpUDqJmI398Nd6cshh-af=s96-c"),
  UserModel(
    name: "Sarthak Agarwal",
    email: "sarthak1931006@akgec.ac.in",
    photoUrl:
        "https://lh3.googleusercontent.com/a-/AOh14GgtuxMPYScbqrNhgbfvH4L_ql--J_Hz7zd_MGRk=s96-c",
    userID: "106645499702300519952",
  )
];
