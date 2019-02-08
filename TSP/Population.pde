class Population{
  City cities[];
  DNA member[];
  int citiesNumber, membersQnt, mutationRate, selectionRange = 0, highestFitnessIndex;
  float highestFitness = 0;
  String[] pool;
  Population(int c_citiesNumber, int c_membersQnt, int c_mutationRate){
    citiesNumber = c_citiesNumber;
    membersQnt = c_membersQnt;
    mutationRate = c_mutationRate;
    member = new DNA[membersQnt];
    cities = new City[numberOfCities];
    pool = new String[1];
  }
  
  //GENERATE CITIES
  void generateCities(){
    for(int i = 0; i < citiesNumber; i++){
      cities[i] = new City();
    }
  }
  
  //GENERATE POPULATION
  void generateMembers(){
    String selectedParent = pool[int(random(selectionRange))];
    for(int i = 0; i < membersQnt; i++){
      member[i] = new DNA(citiesNumber, selectedParent, mutationRate);
    }
    selectionRange = 0;
  }
  
  //CALCULATE FITNESS
  void calculateFitness(){
    float[] fitness = new float[membersQnt];
    for(int i = 0; i < membersQnt; i++){
      float fitnessValue = 1 / (getDistance(member[i].dna)+1);
      if(fitnessValue >= highestFitness){
        highestFitnessIndex = i;
        highestFitness = fitnessValue;
      }
      fitness[i] = fitnessValue;
    }
    generatePool(fitness);
  }
  
  //CREATE POOL
  void generatePool(float[] fitValues){
    int[] percentage = new int[fitValues.length];
    int[] frequencies = new int[fitValues.length];
    int sum = 0, poolIndex = 0, poolSize = 0;
    //NORMALIZE FITNESS
    for(int i = 0; i < fitValues.length; i++){
      percentage[i] = int(map(fitValues[i], 0, max(fitValues), 0, 100));
    }
    for(int i = 0; i < fitValues.length; i++){
      sum += percentage[i];
    }
    for(int i = 0; i < fitValues.length; i++){
      frequencies[i] = (percentage[i]*100)/sum;
      poolSize += (percentage[i]*100)/sum;
      selectionRange += (percentage[i]*100)/sum;
    }
    //GENERATE POOL
    pool = new String[poolSize];
    for(int i = 0; i < fitValues.length; i++){
      for(int k = 0; k < frequencies[i]; k++){
        pool[poolIndex] = member[i].getDna();
        poolIndex++;
      }
    }
  }
  
  //GET TOTAL DISTANCE
  float getDistance(int[] path){
    float distance = 0;
    for(int i = 0; i < path.length-1; i++){
      float xDist = cities[path[i+1]].cityCoordenates[0] - cities[path[i]].cityCoordenates[0];
      float yDist = cities[path[i+1]].cityCoordenates[1] - cities[path[i]].cityCoordenates[1];
      distance += pow(xDist, 2) + pow(yDist, 2);
    }
    return distance;
  }
  
  //SHOW BEST PATH FOUND
  void showBest(){
    showPath(member[highestFitnessIndex].dna);
  }
  
  //SHOW A ESPECIFIC PATH
  void showPath(int[] path){
    stroke(0);
    strokeWeight(3);
    for(int i = 0; i < path.length-1; i++){
      fill(200);
      line(cities[path[i]].cityCoordenates[0], cities[path[i]].cityCoordenates[1], cities[path[i+1]].cityCoordenates[0], cities[path[i+1]].cityCoordenates[1]);
    }
  }
  
  //DISPLAY THE CITIES
  void displayCities(){
    noStroke();
    fill(255);
    rect(0, 0, width, height);
    stroke(0);
    strokeWeight(3);
    for(int i = 0; i < citiesNumber; i++){
      fill(100);
      ellipse(cities[i].cityCoordenates[0], cities[i].cityCoordenates[1], 50, 50);
    }
  }
}
