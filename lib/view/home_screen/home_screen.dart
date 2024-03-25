import 'package:fakeapi/controller/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    await Provider.of<HomeScreenController>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final homescreenProvider = Provider.of<HomeScreenController>(context);
    return Scaffold(
      body: ListView.builder(
        itemCount: homescreenProvider.productsList.length,
        itemBuilder: (context, index) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: MediaQuery.sizeOf(context).width,
          child: Row(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          homescreenProvider.productsList[index].image ?? "")),
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            homescreenProvider.productsList[index].title ?? "",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        Text(
                          "\$${homescreenProvider.productsList[index].price ?? ""}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ],
                    ),
                    Text(homescreenProvider.productsList[index].category ?? ""),
                    Text(
                      "\$${homescreenProvider.productsList[index].price ?? ""}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Remove",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.blue),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue),
                              borderRadius: BorderRadius.circular(100)),
                          child: const Row(
                            children: [
                              Icon(Icons.remove),
                              SizedBox(width: 10),
                              Text("1"),
                              SizedBox(width: 10),
                              Icon(Icons.add),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
