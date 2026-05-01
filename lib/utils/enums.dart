enum BaseUrl {
  production(''),
  staging('');

  final String url;

  const BaseUrl(this.url);
}

enum Endpoint {
  login('/login');

  final String value;

  const Endpoint(this.value);
}
