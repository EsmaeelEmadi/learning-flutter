class AccessToken {
  final String accessToken;
  final String expiresIn;

  AccessToken({
    required this.accessToken,
    required this.expiresIn,
  });
}

class RefreshToken {
  final String refreshToken;
  final String refreshExpiresIn;

  RefreshToken({
    required this.refreshToken,
    required this.refreshExpiresIn,
  });
}

class Permission {
  final String resource;
  final List<String> scopes;

  Permission({
    required this.resource,
    required this.scopes,
  });
}

class Credentials {
  String? idToken;
  String? tokenType;
  String? issuedAt;
  AccessToken? accessToken;
  RefreshToken? refreshToken;
  // List<Permission> permissions;

  Credentials({
    this.idToken,
    this.tokenType,
    this.issuedAt,
    this.accessToken,
    this.refreshToken,
    // required this.permissions,
  });

  Credentials.fromJson(Map<String, dynamic> json) {
    idToken = json['idToken'];
    tokenType = json['tokenType'];
    issuedAt = DateTime.now().microsecondsSinceEpoch.toString();
    accessToken = AccessToken(
      accessToken: json['accessToken'],
      expiresIn: json['expiresIn'],
    );
    refreshToken = RefreshToken(
      refreshToken: json['refreshToken'],
      refreshExpiresIn: json['refreshExpiresIn'],
    );
  }

   Map<String, dynamic>  toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idToken'] = idToken;
    data['tokenType'] = tokenType;
    data['accessToken'] = accessToken?.accessToken;
    data['expiresIn'] = accessToken?.expiresIn;
    data['refreshToken'] = refreshToken?.refreshToken;
    data['refreshExpiresIn'] = refreshToken?.refreshExpiresIn;
    return data;
  }
}

// class A {
//   int id;

//   A({required this.id});

//   int getId() { 
//     return id;
//   }
// }

// final a = A(id: 1);
// final int b = a.getId();