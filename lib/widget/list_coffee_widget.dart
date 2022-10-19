import 'package:flutter/material.dart';
import 'package:hot_coffee/common/colors.dart';
import 'package:hot_coffee/models/coffee_model.dart';

class ListCoffeeWidget extends StatefulWidget {
  const ListCoffeeWidget({super.key, required this.coffeeList});

  final List<CoffeeResponse> coffeeList;

  @override
  State<ListCoffeeWidget> createState() => _ListCoffeeWidgetState();
}

class _ListCoffeeWidgetState extends State<ListCoffeeWidget> {
  _showModalBottomSheet(int index) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35.0),
          topRight: Radius.circular(35.0),
        ),
      ),
      builder: (context) {
        return _bottomSheetContent(index);
      },
    );
  }

  Widget _bottomSheetContent(int index) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.75,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 8.0),
          Container(
            width: 60.0,
            height: 3.0,
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: const BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.coffeeList[index].image),
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(35.0),
                topRight: Radius.circular(35.0),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Text(
            widget.coffeeList[index].title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
          Container(
            width: 100.0,
            height: 3.0,
            decoration: BoxDecoration(
              color: secondaryColor.withOpacity(0.7),
              borderRadius: const BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              widget.coffeeList[index].description,
              textAlign: TextAlign.justify,
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          const Text('Ingredients'),
          Container(
            width: 100.0,
            height: 3.0,
            decoration: BoxDecoration(
              color: secondaryColor.withOpacity(0.7),
              borderRadius: const BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 30,
            child: ListView(
              shrinkWrap: false,
              scrollDirection: Axis.horizontal,
              children: List.generate(
                widget.coffeeList[index].ingredients.length,
                (i) {
                  return Center(
                    child: Container(
                      margin: const EdgeInsets.only(right: 8.0),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 4.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: secondaryColor.withOpacity(0.7),
                        border: Border.all(
                          color: secondaryColor,
                        ),
                      ),
                      child: Text(
                        widget.coffeeList[index].ingredients[i],
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.coffeeList.length,
      shrinkWrap: false,
      itemBuilder: (BuildContext context, int index) => Container(
        height: 240.0,
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            12.0,
          ),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 231, 231, 231),
              blurRadius: 2.0,
              spreadRadius: 1.0,
              // shadow direction: bottom right
            )
          ],
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  child: ClipOval(
                    child: Image.network(
                      widget.coffeeList[index].image,
                      width: 100.0,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16.0,
                ),
                SizedBox(
                  width: 180.0,
                  child: Text(
                    widget.coffeeList[index].description.length > 100
                        ? '${widget.coffeeList[index].description.substring(0, 100)}...'
                        : widget.coffeeList[index].description,
                    textAlign: TextAlign.left,
                    style: const TextStyle(fontSize: 12.0),
                  ),
                ),
              ],
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Ingredients : ',
                style: TextStyle(decoration: TextDecoration.underline),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 30.0,
              child: ListView(
                shrinkWrap: false,
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  widget.coffeeList[index].ingredients.length,
                  (i) {
                    return Container(
                      margin: const EdgeInsets.only(right: 8.0),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 4.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: secondaryColor.withOpacity(0.7),
                        border: Border.all(
                          color: secondaryColor,
                        ),
                      ),
                      child: Text(
                        widget.coffeeList[index].ingredients[i],
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    );
                  },
                ),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                minimumSize: const Size.fromHeight(
                  0,
                ), // fromHeight use double.infinity as width and 40 is the height
              ),
              onPressed: () {
                _showModalBottomSheet(index);
              },
              child: Text(
                'Show More',
                style: TextStyle(color: Colors.blue[900]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
