final String postagemTable = "postagemTable";

final String idPostagemColumn = "idPostagemColumn";

final String codigoColumn = "codigoColumn";
final String respostasColumn = "respostasColumn";
final String dataHoraColumn = "dataHoraColumn";
final String estaLidoColumn = "estaLidoColumn";
final String autorIDColumn = "autorIDColumn";
final String autorNomeColumn = "autorNomeColumn";
final String autorImageUrlColumn = "autorImageUrlColumn";
final String textoColumn = "textoColumn";
final String versaoColumn = "versaoColumn";

class Postagem {

  String idPostagem;
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
    this.idPostagem,
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

  Postagem.fromMap (Map map) {
    idPostagem = map[idPostagemColumn];
    codigo = map[codigoColumn];
    respostas = map[respostasColumn];
    dataHora = map[dataHoraColumn];
    estaLido = map[estaLidoColumn];
    autorID = map[autorIDColumn];
    autorNome = map[autorNomeColumn];
    autorImageUrl = map[autorImageUrlColumn];
    texto = map[textoColumn];
    versao = map[versaoColumn];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      codigoColumn: codigo,
      respostasColumn: respostas,
      dataHoraColumn: dataHora,
      estaLidoColumn: estaLido,
      autorIDColumn: autorID,
      autorNomeColumn: autorNome,
      autorImageUrlColumn: autorImageUrl,
      textoColumn: texto,
      versaoColumn: versao,
    };
    if(idPostagem != null){
      map[idPostagemColumn] = idPostagem;
    }
    return map;
  }

}