// Simple SPI script to test FPGA implementation of SPI protocol
// Pins are based on Arduino MKR1000
#include "SPI.h"

#define CHIP_SELECT 7

char* message = "Hello there";

void setup() {
  // put your setup code here, to run once:
  SPI.begin();
  Serial.begin(115200);
  pinMode(CHIP_SELECT, OUTPUT); // Chip select
  digitalWrite(CHIP_SELECT, LOW);
}

void loop() {
  // put your main code here, to run repeatedly:
  Serial.print("Sending message: ");
  Serial.print("\"");
  Serial.print(message);
  Serial.println("\"");

  Serial.println("\nReceived:\n");
  for (char* c = message; c != NULL; c++)
  {
    char received = SPI.transfer((uint8_t)*c);
    Serial.print(received);
  }

  delay(10000);
}
