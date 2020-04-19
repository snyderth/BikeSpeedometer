#include <avr/interrupt.h> // for ISR
#include <Wire.h>     // For OLED comms
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h> // For OLED control


// INT0 is on PIN D2 of the arduino nano
// http://w, 55
// Setting up the interrupt:
//    EICRA: 0b00000010 // falling edge trigger on D2
//    EIMSK: 0b00000001 // enable interrupt
//    
// For the timer/counter interrupt:http://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-7810-Automotive-Microcontrollers-ATmega328P_Datasheet.pdf
// pages 54
 //   TCCR1A: 0b0000xx00 ; OC pins disconnected and CTC mode
 //   TCCR1B: 0b00x01101 ; 1024 prescale and CTC mode
 //   TCCR1C: Let alone. Unnecessary for application
 // OCR1A Computed:
 //    f_OC1A = F_clk/(2 * N * (1 + OCR1A))
 // => OCR1A = ((F_clk * T_OC1A) / (2N)) - 1
 //    So, with N = 1024, a 5 second T means OCR1A = 39061.5 ~$9895

uint64_t revCount = 0;
const float smp_per = 4; // seconds;
const uint16_t pre_scl = 1024;

//static uint16_t TCNT1_TOP_VAL  = (( (F_CPU * smp_per) / (2 * pre_scl) ) - 1);



#define SCREEN_WIDTH 128
#define SCREEN_HEIGHT 32


#define MILE_PER_INCH 1.57828e-5f
#define WHL_DIAM_INCH 26u
#define OLED_RESET 5
Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, OLED_RESET);

//// ISR Names: http://www.gammon.com.au/forum/?id=11488
//ISR( TIMER1_COMPA_vect ) {
//  // Timer counter 0 interrupt vector.
//  // Run the calculation
//
//  // Standard bike tire has a diameter of 26 inches
//  // Circumference is thus 26pi inches = C
//  // So, to calculate the speed:
//  //    D = 26pi * revCount
//  //    Speed (in/s) = D * Sampling Period
//
//  byte in = PORTB;
//  PORTB = ~in & (1 << PB5);
//
//
//  sei();
//}

ISR( INT0_vect ){
  // Interrupt routine when high to low transition on D2

  revCount++;
  PORTB = ~PORTB & (1 << PB5); 
}


void setup() {
  // put your setup code here, to run once:
  EICRA = 0x02;
  EIMSK = 0x01;

  // For DEBUG
  DDRB = (1 << PB5);
  PORTD = (1 << PD2); // set internal pullups
  
//  TCCR1A = TCCR1A & (0b00001100); // Clear necessary bits, leave bits 2,3 alone
//  
//  TCCR1B = 0b00001101; // OR with necessary
//  // NOTE: Writing high byte of 16-bit register first!!
//  OCR1AH = (TCNT1_TOP_VAL >> 8);
//  OCR1AL = (0b0000000011111111 & TCNT1_TOP_VAL);
//
//  TIMSK1 |= 0b00000010; // Enable interrupt on OCR1A
  
  
  sei(); // enable global interrupts
  Wire.begin(); // A4 SDA; A5 SCL
  display.begin();
  display.clearDisplay();
  
  display.display();
//  delay(2000);
  Serial.begin(115200);
  
  
}

long long distanceTimer = millis();
float distance = 0.0;

long timer1 = millis();
float spd = 0.0; // current speed

// Keeps track of how many times we have
// computed the speed an added it to the 
// speed accumulator. Used in average speed.
long long speedCountAvg = 0;  

// Speed accumulator 
float accumSpd = 0.0;

// Average speed
float spdAvg = 0.0;

void loop() {

  if(millis() - timer1 > (1000 * smp_per)){
    
    /* Compute  the speed */
    spd = (float)WHL_DIAM_INCH * PI * (float) revCount * (float) smp_per * (float) MILE_PER_INCH;
    /* Reset the revCount */
    revCount = 0;
    /* Add one to the accumulator counter */
    speedCountAvg++;
    /* Accumulate the speed */
    accumSpd += spd;
    /* Calculate the average speed */
    spdAvg = accumSpd / speedCountAvg;
    /* Reset Timer 1 for next sampling period */
    timer1 = millis();
  }

  /* Compute the distance based on the average speed */
  distance = (millis() - distanceTimer) / 1000 / 60 / 60 * spdAvg;

  /* Write to the screen. */ 
  draw_stats();
  
}


void draw_stats(){
  display.clearDisplay();
  
  display.setTextSize(1);
  display.setTextColor(SSD1306_WHITE);
  display.setCursor(0,0);
  display.cp437(true);

  display.print(F("Speed: "));
  display.print(spd);
  display.println(F(" MPH"));
  
  display.print(F("Avg.: "));
  display.print(spdAvg);
  display.println(F(" MPH"));


  display.print(F("Distance: "));
  display.print(distance);
  display.println(F(" Miles"));
  
  display.display();
  
}
