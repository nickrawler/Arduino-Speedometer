const unsigned int TRIG_PIN = 13;
const unsigned int ECHO_PIN = 12;
const unsigned int BAUD_RATE = 9600;

unsigned long Time;
unsigned long lastTime = 0;
int lastDistance = -1;
int distance;

float velocity;
double promig = 0;

float velocitats[50];
int mostres = 0;

unsigned long duration;


void setup() {
  pinMode(TRIG_PIN, OUTPUT);
  pinMode(ECHO_PIN, INPUT);
  Serial.begin(BAUD_RATE);

}

void loop() {

  ////////
  digitalWrite(TRIG_PIN, LOW);
  delayMicroseconds(2);
  digitalWrite(TRIG_PIN, HIGH);
  delayMicroseconds(10);
  digitalWrite(TRIG_PIN, LOW);


  const unsigned long duration = pulseIn(ECHO_PIN, HIGH);
  int distance = duration / 29 / 2;
    
  if (distance > 50 && distance < 70) {
    if (lastDistance >= 0) {

      Time = millis();

      float velocity = float(distance - lastDistance) / float(Time - lastTime);

      velocity = abs(velocity);
      velocity = velocity * 360; //de cm/ms a km/h

      velocitats[mostres] = velocity;
      mostres++;

      lastTime = Time;
      lastDistance = distance;

    } else {
      lastDistance = distance;
      Time = millis();
    }
  } else {
    if (mostres > 0) {

      double promig = 0;

      for (int i = 0; i < mostres; i++) {

        if (velocitats[i] == 0)
          continue;
        promig = promig + velocitats[i];
      }
      promig = promig / mostres;
      
        Serial.println(promig);
  }
      mostres = 0;
      lastDistance = -1;
    }
  ////////
}
