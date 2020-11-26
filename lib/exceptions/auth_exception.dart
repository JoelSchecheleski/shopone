class AuthException implements Exception {
  static Map<String, String> erros = {
    "EMAIL_NOT_FOUND": "E-mail não encontrado.",
    "INVALID_PASSWORD": "A senha inválida.",
    "USER_DISABLED": "Conta desabilitada por um administrador.",
    "EMAIL_EXISTS":"O endereço de e-mail já está sendo usado por outra conta.",
    "OPERATION_NOT_ALLOWED":"Login de senha desabilitado para este projeto.",
    "TOO_MANY_ATTEMPTS_TRY_LATER":"Bloqueamos todas as solicitações deste dispositivo devido a atividade incomum. Tente mais tarde.",
    "TOKEN_EXPIRED":"Sua credencial não é mais válida. Tente entrar novamente.",
    "USER_NOT_FOUND":"Seu usuário correspondente ao token de atualização não foi encontrado.",
    "INVALID_REFRESH_TOKEN":"Token de atualização fornecido é inválido.",
    "INVALID_GRANT_TYPE":"O tipo de permissão especificado é inválido.",
    "MISSING_REFRESH_TOKEN":"Nenhum token de atualização foi fornecido."
  };
  final String key;

  const AuthException(this.key);

  @override
  String toString() {
    if(erros.containsKey(key)) {
      return erros[key];
    } else {
      return "Ocorreu um erro na autenticação.";
    }
  }
}
