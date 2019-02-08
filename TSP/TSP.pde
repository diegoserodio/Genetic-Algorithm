int numberOfCities = 10;
int numberOfMembers = 100;
int mutationRate = 1;

Population population = new Population(numberOfCities, numberOfMembers, mutationRate);

void setup(){
  size(1200, 700);
  background(255);
  population.generateCities();
}

void draw(){
  population.generateMembers();
  population.calculateFitness();
  population.displayCities();
  population.showBest();  
}
