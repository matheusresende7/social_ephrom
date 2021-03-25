class Postagem {

  String iD;
  String codigo;
  int respostas;
  String dataHora;
  bool estaLido;
  String autorID;
  String autorNome;
  String autorImageUrl;
  String texto;
  int versao;

  Postagem({
    this.iD,
    this.codigo,
    this.respostas,
    this.dataHora,
    this.estaLido,
    this.autorID,
    this.autorNome,
    this.autorImageUrl,
    this.texto,
    this.versao
  });

  Postagem.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    codigo = json['Codigo'];
    respostas = json['Respostas'];
    dataHora = json['DataHora'];
    estaLido = json['EstaLido'];
    autorID = json['AutorID'];
    autorNome = json['AutorNome'];
    autorImageUrl = json['AutorImageUrl'];
    texto = json['Texto'];
    versao = json['Versao'];
  }

}