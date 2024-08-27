enum FromWho { me, your }

class ChatEntitie {
  final String text;
  final String imageUrl;
  final FromWho fromWho;

  ChatEntitie(
      {required this.text, required this.imageUrl, required this.fromWho});
}
