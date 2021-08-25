class OfferModel{

  int id = 0;
  String image = "";

  OfferModel(obj){
    this.id = obj["id"];
    this.image = obj["image"];
  }

  static fromJSONList(list)
  {
    List<OfferModel> offerList = [];

    if(list != null)
    {
      list.forEach((element)
      {
        offerList.add(new OfferModel(element));
      });
    }
    return offerList;
  }

}