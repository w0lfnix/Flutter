class Account {
  String _nom;
  String _prenom;
  Account(String p, String n) {
    this._nom = n;
    this._prenom = p;
  }

  String getIdentity() => this._prenom + " " + this._nom;
}
