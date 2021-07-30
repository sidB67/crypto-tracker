import 'package:bitcoin_ticker/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'coin_data.dart';


class PriceScreen extends StatefulWidget {
  static const String id = 'price-screen';
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  bool isLoading = false;
  List<DropdownMenuItem> getDrowpDownItem(){
    List<DropdownMenuItem<String>> dropdownItems=[];
    for(int i=0;i<currenciesList.length;i++){
      var newItem =DropdownMenuItem(
          child: Text(currenciesList[i]),
        value: currenciesList[i],
      );
      dropdownItems.add(newItem);
    }
    return dropdownItems;
  }

  String btcval= '?';
  String ethval= '?';
  String ltcval= '?';

  void getData()async{
    
    try{
    if(mounted){
      setState(() {
              isLoading = true;
            });
    }
    var data = await CoinData().getPrice('BTC',selectedCurrency);
    var data1 = await CoinData().getPrice('ETH',selectedCurrency);
    var data2 = await CoinData().getPrice('LTC',selectedCurrency);
    if(mounted){
      setState(() {
      
      btcval=data;
      ethval=data1;
      ltcval=data2;
    });
    }
    }catch(e){
      print(e);
  }finally{
    if(mounted){
      setState(() {
              isLoading = false;
            });
    }
  }
  }

@override
  void initState() {
    getData();
  
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Auth>(context).getCurrentUser();
   
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Price'),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(PriceScreen.id);
            },
          ),
          Divider(),
           ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: ()async{
             await Provider.of<Auth>(context,listen: false).signOut();
            },
          ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: isLoading? Center(child: CircularProgressIndicator()): Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = $btcval $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
           Padding(
            padding: EdgeInsets.fromLTRB(18.0,18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 ETH = $ethval $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
           Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 LTC = $ltcval $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: DropdownButton<String>(
                value: selectedCurrency,
                items: getDrowpDownItem(),
                onChanged: (value){
                  print(user.uid);
                  setState(() {
                    selectedCurrency=value;
                    
                  });
                  getData();


                }),
          ),
        ],
      ),
    );
  }
}
