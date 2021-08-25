class HotelModel{

    int id=0;
    String name="";
    String image="";
    double realPrice = 0;
    double salePrice = 0;
    String address="";
    double rating = 0;

    HotelModel(obj){
      this.id = obj["id"];
      this.image = obj["image"];
      this.name = obj["name"];
      this.salePrice = obj["sale_price"];
      this.realPrice = obj["real_price"];
      this.address = obj["address"];
      this.rating = obj["rating"];
    }

    static fromJSONList(list)
    {
      List<HotelModel> hotelList = [];

      if(list != null)
      {
        list.forEach((element)
        {
          hotelList.add(new HotelModel(element));
        });
      }
      return hotelList;
    }

}