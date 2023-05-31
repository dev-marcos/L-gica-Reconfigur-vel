#define LED0 6
#define LED1 7
#define LED2 8
#define LED3 9

int x = 0;

void setup() {                
  Serial.begin(9600);
  Serial.setTimeout(50);
  pinMode(LED0, OUTPUT);
  pinMode(LED1, OUTPUT);
  pinMode(LED2, OUTPUT);
  pinMode(LED3, OUTPUT);
}

void loop() {
  if (Serial.available()>0){
  x = Serial.parseInt();
  Serial.println(x);  
  }
  if(x==1){
  digitalWrite(LED0, HIGH);
  digitalWrite(LED1, LOW);
  digitalWrite(LED2, LOW);
  digitalWrite(LED3, LOW);
  }
  if(x==2){
  digitalWrite(LED0, LOW);
  digitalWrite(LED1, HIGH);
  digitalWrite(LED2, LOW);
  digitalWrite(LED3, LOW);
  }
  if(x==3){
  digitalWrite(LED0, LOW);
  digitalWrite(LED1, LOW);
  digitalWrite(LED2, HIGH);
  digitalWrite(LED3, LOW);
  }
  if(x==4){
  digitalWrite(LED0, LOW);
  digitalWrite(LED1, LOW);
  digitalWrite(LED2, LOW);
  digitalWrite(LED3, HIGH);
  }
}
