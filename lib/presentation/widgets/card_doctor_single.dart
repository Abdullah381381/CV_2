import 'import_all.dart';

class CardDoctorSingle extends StatelessWidget {
  const CardDoctorSingle({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 25),
      elevation: 0.2,
      child: Padding(
        padding: const EdgeInsets.only(
            left: 12, right: 12, top: 10, bottom: 10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: const CachedNetworkImageApp(
                height: 100,
                width: 100,
                imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQffPvVQeYJo0vimkNLdSz6wuHhn70acktrXg&usqp=CAU",
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
                child: SizedBox(
                  height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Expanded(
                            child: TextApp(
                              text: "Dr.Diaa Tawfeeek",
                              textAlign: TextAlign.start,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 4,
                      ),
                      Divider(
                        color: Colors.grey.shade300,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      //  * Star

                      const TextApp(
                        text: "جراحه",
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        maxLines: 1,
                      ),
                      const SizedBox(
                        height: 6,
                      ),

                      const Row(
                        children: [
                          // SizedBox(width: 2,)
                          TextApp(
                            text: "(جامعه القاهره)",
                            textAlign: TextAlign.start,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            maxLines: 1,
                          ),
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
