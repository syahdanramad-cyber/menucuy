import 'package:flutter/material.dart';

void main() {
  runApp(Tes());
}

class Tes extends StatefulWidget {
  @override
  State<Tes> createState() => TesState();
}

class TesState extends State<Tes> {
  List<String> menu = ["Soto", "Rawon"];

  List<int> harga = [10000, 15000];

  List<String> gambar = ["assets/images.jpg", "assets/rawon.jpg"];

  List<TextEditingController> porsi = [
    TextEditingController(),
    TextEditingController()
  ];

  int totalPorsi = 0;
  int totalHarga = 0;

  void hitungTotal() {
    totalPorsi = 0;
    totalHarga = 0;

    for (int i = 0; i < menu.length; i++) {
      int jumlah = int.tryParse(porsi[i].text) ?? 0;

      totalPorsi += jumlah;
      totalHarga += jumlah * harga[i];
    }

    setState(() {});
  }

  @override
  void dispose() {
    for (var controller in porsi) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Menu Makanan",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/back.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Daftar Menu Makanan",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    "Silakan pilih menu dan masukkan jumlah porsi.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),

                  SizedBox(height: 20),

                  // Tabel menu makanan
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(8),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Table(
                        border: TableBorder.all(
                          width: 1,
                          color: Colors.black,
                        ),
                        defaultColumnWidth: IntrinsicColumnWidth(),
                        children: [
                          // Header tabel
                          TableRow(
                            decoration: BoxDecoration(
                              color: Colors.blue[100],
                            ),
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text("No"),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text("Gambar"),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text("Menu"),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text("Harga"),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text("Porsi"),
                              ),
                            ],
                          ),

                          // Data menggunakan perulangan
                          for (int i = 0; i < menu.length; i++)
                            TableRow(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text("${i + 1}"),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Image.asset(
                                    gambar[i],
                                    width: 75,
                                    height: 75,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(menu[i]),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text("Rp ${harga[i]}"),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5),
                                  child: SizedBox(
                                    width: 100,
                                    child: TextField(
                                      controller: porsi[i],
                                      keyboardType: TextInputType.number,
                                      onChanged: (value) {
                                        hitungTotal();
                                      },
                                      decoration: InputDecoration(
                                        hintText: "Porsi",
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.all(8),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  // Total pesanan
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(15),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Pesanan",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Total Porsi : $totalPorsi",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Total Harga : Rp $totalHarga",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),

                  Center(
                    child: Text(
                      "Terima Kasih",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
