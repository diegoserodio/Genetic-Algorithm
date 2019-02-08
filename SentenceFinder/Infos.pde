void showInfo(){
  fill(255);
  stroke(255);
  rect(0, 0, width/2, height);
  
  // SHOW BEST PHRASE
  fill(0);
  textSize(32);
  text("Melhor Frase:", 10, 50);
  fill(100);
  text(population.getBestMember(), 20, 100);
  
  //SHOW GENERATIONS
  fill(0);
  textSize(32);
  text("Gerações:", 10, 150);
  fill(100);
  text(str(round(genNumber)), 20, 200);
}

void stopEvolving(){
  if(population.getBestMember().indexOf(targetPhrase) != -1){
    found = true;
  }
}
