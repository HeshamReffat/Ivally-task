import 'package:flutter/material.dart';
import 'package:ivallytask/controllers/lowest_price_controller.dart';
import 'package:ivallytask/controllers/recent_controller.dart';
import 'package:ivallytask/models/LowestPriceModel/lowest_price_model.dart';
import 'package:ivallytask/models/recentModel/recent_model.dart';
import 'package:ivallytask/shared/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Shader linearGradient = const LinearGradient(
    colors: <Color>[Colors.white38, Colors.green],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
  TextEditingController searchCon = TextEditingController();

  @override
  void dispose() {
    searchCon.dispose();
    super.dispose();
  }

  @override
  void initState() {
    Provider.of<LowestPriceController>(context, listen: false).fetchData();
    Provider.of<RecentController>(context, listen: false).fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     double cardWidth = MediaQuery.of(context).size.width ;
     double cardHeight = MediaQuery.of(context).size.height;
     var lowestProvider = Provider.of<LowestPriceController>(context);
     var recentProvider = Provider.of<RecentController>(context);
    List<LowestPriceModel> lowestModel =
        Provider.of<LowestPriceController>(context).lowestData;
    List<RecentModel> recentModel =
        Provider.of<RecentController>(context).recentData;
    return lowestModel.isEmpty ||recentModel.isEmpty
        ? const Center(child: LoadingIndicator())
        : SingleChildScrollView(
            child: Column(
              children: [
                /////////////////top Widget///////////////////
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/egypt.png'),
                        fit: BoxFit.cover),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'اكتشف منزلك الجديد بسهوله',
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            foreground: Paint()..shader = linearGradient),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width / 4,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    bottomRight: Radius.circular(15)),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    iconEnabledColor: Colors.black,
                                    iconDisabledColor: Colors.white,
                                    items:
                                        <String>['Empty'].map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (value) {},
                                    hint: const Text(
                                      'للبيع',
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    isDense: true,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Expanded(
                              child: Container(
                                height: 50,
                                //width: MediaQuery.of(context).size.width / 1,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      bottomLeft: Radius.circular(15)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: TextFormField(
                                    controller: searchCon,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'ابحث عن',
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      suffixIcon: Icon(
                                        Icons.search,
                                        size: 30,
                                        color: Colors.black,
                                      ),
                                      isDense: true,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.lightBlue,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Image(
                                    image: AssetImage(
                                        'assets/images/cat_icon.png'),
                                    color: Colors.white,
                                    height: 25,
                                    width: 25,
                                  ),
                                ),
                                Text(
                                  'جميع العقارات',
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.white),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 5,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.lightBlue,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Image(
                                    image: AssetImage(
                                        'assets/images/cat_icon.png'),
                                    color: Colors.white,
                                    height: 25,
                                    width: 25,
                                  ),
                                ),
                                Text(
                                  'للبيع',
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.white),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 4.8,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.lightBlue,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Image(
                                    image: AssetImage(
                                        'assets/images/cat_icon.png'),
                                    color: Colors.white,
                                    height: 25,
                                    width: 25,
                                  ),
                                ),
                                Text(
                                  'للايجار',
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'الاقل سعرا',
                            style: TextStyle(color: Colors.black, fontSize: 24),
                          ),
                          Text(
                            'اظهار الكل',
                            style: TextStyle(color: Colors.blue, fontSize: 24),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  //color: Colors.red,
                  height: 400,
                  child: ListView.builder(
                    //shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            width: 200,
                            height: 390,
                            margin: const EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                  offset: const Offset(0, 5),
                                )
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  alignment: AlignmentDirectional.centerEnd,
                                  children: [
                                    Container(
                                      height: 160,
                                      width: 200,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              lowestModel[index].featuredImage.medium!),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 40.0, left: 15.0, right: 15.0),
                                      child: CircleAvatar(
                                        radius: 20,
                                        backgroundColor: Colors.grey[200],
                                        child: IconButton(
                                          icon: lowestProvider.fav[lowestModel[index].id] == true ?
                                          const Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                          ):const Icon(
                                            Icons.favorite_border,
                                            color: Colors.grey,
                                          ),
                                          onPressed: () {
                                            lowestProvider.setFav(lowestModel[index].id);
                                          },
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 20,
                                      width: 10,
                                      decoration: const BoxDecoration(
                                        color: Colors.lightBlue,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(5.0),
                                            bottomLeft: Radius.circular(5.0)),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      lowestModel[index].type.name!,
                                      style: const TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Spacer(),
                                    Container(
                                      height: 25,
                                      width: 60,
                                      decoration: const BoxDecoration(
                                        color: Colors.lightBlue,
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(5.0),
                                          bottomRight: Radius.circular(5.0),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          lowestModel[index].status,
                                          style: const TextStyle(
                                              color: Colors.white, fontSize: 18.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5.0),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width / 2.5,
                                    child: Text(
                                      lowestModel[index].title,
                                      style: const TextStyle(
                                          fontSize: 18, color: Colors.lightBlue),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    lowestModel[index].price,
                                    style: const TextStyle(
                                        fontSize: 18, color: Colors.black),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Image(
                                      image:
                                          AssetImage('assets/images/location.png'),
                                      height: 30,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 8.0),
                                        child: Text(
                                          lowestModel[index].address,
                                          style: const TextStyle(fontSize: 14),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      children: [
                                        const Image(
                                          image:
                                              AssetImage('assets/images/space.png'),
                                          height: 20,
                                        ),
                                        const SizedBox(
                                          width: 5.0,
                                        ),
                                        Text(
                                          lowestModel[index].size,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Image(
                                          image: AssetImage(
                                              'assets/images/bath_icon.png'),
                                          height: 20,
                                        ),
                                        const SizedBox(
                                          width: 5.0,
                                        ),
                                        Text(
                                          lowestModel[index].bathrooms,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Image(
                                          image:
                                              AssetImage('assets/images/bed.png'),
                                          height: 20,
                                        ),
                                        const SizedBox(
                                          width: 5.0,
                                        ),
                                        Text(
                                          lowestModel[index].bedrooms,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                    itemCount: lowestModel.length,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'احدت العقارات',
                        style: TextStyle(color: Colors.black, fontSize: 24),
                      ),
                      Text(
                        'اظهار الكل',
                        style: TextStyle(color: Colors.blue, fontSize: 24),
                      )
                    ],
                  ),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  //scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: const Offset(0, 5),
                          )
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.centerEnd,
                            children: [
                              Container(
                                height: 160,
                                //width: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        recentModel[index].featuredImage.medium!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 40.0, left: 15.0, right: 15.0),
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.grey[200],
                                  child: IconButton(
                                    icon: recentProvider.fav[recentModel[index].id] == true ?
                                    const Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    ):const Icon(
                                      Icons.favorite_border,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {
                                      recentProvider.setFav(recentModel[index].id);
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 20,
                                width: 10,
                                decoration: const BoxDecoration(
                                  color: Colors.lightBlue,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5.0),
                                      bottomLeft: Radius.circular(5.0)),
                                ),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                recentModel[index].type.name! ,
                                style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              Container(
                                height: 25,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Colors.lightBlue,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5.0),
                                    bottomRight: Radius.circular(5.0),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    recentModel[index].status,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 18.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: Text(
                                recentModel[index].title,
                                style: const TextStyle(
                                    fontSize: 18, color: Colors.lightBlue),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              recentModel[index].price,
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.black),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Row(
                            children: [
                              const Image(
                                image:
                                    AssetImage('assets/images/location.png'),
                                height: 30,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    recentModel[index].address,
                                    style: const TextStyle(fontSize: 14),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  const Image(
                                    image:
                                        AssetImage('assets/images/space.png'),
                                    height: 20,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    recentModel[index].size,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Image(
                                    image: AssetImage(
                                        'assets/images/bath_icon.png'),
                                    height: 20,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    recentModel[index].bathrooms,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Image(
                                    image:
                                        AssetImage('assets/images/bed.png'),
                                    height: 20,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    recentModel[index].bedrooms,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: recentModel.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 20.0,
                      childAspectRatio: (MediaQuery.of(context).orientation ==
                          Orientation.portrait) ? cardWidth/(cardHeight / 1.1):cardHeight/(cardWidth /1.35),
                      crossAxisCount: (MediaQuery.of(context).orientation ==
                              Orientation.portrait)
                          ? 2
                          : 3),
                ),
              ],
            ),
          );
  }
}
