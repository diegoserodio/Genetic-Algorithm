Population population;
long genNumber = 0;
boolean found = false;

String targetPhrase = "Sentence";
int mutationRate = 5;
int populationSize = 300;

void setup(){
  size(1200, 650);
  background(255);
  population = new Population(populationSize, targetPhrase.length());
}

void draw(){
  if(found != true){
    population.generate(mutationRate);
    population.calculateFitness(targetPhrase);
    population.show();
    genNumber++;
    showInfo();
    stopEvolving();
  }
}
