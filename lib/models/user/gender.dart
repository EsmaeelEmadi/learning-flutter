enum Gender {
  male,
  female,
}

Gender parseGender(String gender) {
  switch (gender.toLowerCase()) {
    case 'MALE':
      return Gender.male;
    case 'FEMALE':
      return Gender.female;
    default:
      throw Exception('Unknown gender value: $gender');
  }
}