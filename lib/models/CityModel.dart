class CityModel{

    int id = 0;
    String name = "";
    String image = "";


    CityModel(obj){
      this.id = obj["cities"];
      this.name = obj["name"];
      this.image = obj["image"];
    }

    static fromJSONList(list)
    {
      List<CityModel> cityList = [];

      if(list != null)
      {
        list.forEach((element)
        {
          cityList.add(new CityModel(element));
        });
      }
      return cityList;
    }
}

