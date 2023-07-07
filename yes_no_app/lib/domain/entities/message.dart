enum FromWho { me, her }

class Message {
  final String text;
  final String? imgUrl;
  final FromWho fromWho;

  Message({required this.text, this.imgUrl, required this.fromWho});

  factory Message.fromHer(Map<String, dynamic> json) => Message(
      text: json['answer'] == 'yes' ? 'Sí' : 'No', fromWho: FromWho.her, imgUrl: json['image']);
}
