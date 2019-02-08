class City{
  int[] cityCoordenates;
  City(){
    cityCoordenates = new int[2];
    //GENERATE COORDENATES
    cityCoordenates[0] = int(random(50, width-51));
    cityCoordenates[1] = int(random(50, height-51));
  }
}
