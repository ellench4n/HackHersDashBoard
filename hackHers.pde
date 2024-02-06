// UI code for HackHers Challenge 3: Smart Space Dashboard
import controlP5.*;

ControlP5 cp5;
Slider2D s;
Accordion accordion;
Chart myChart;
Knob myKnobA;
Textlabel myTextlabelA;
Textlabel myTextlabelB;
Slider abc;

boolean isOn = true;
int knobValue = 100;
int opacity = 255;
int sliderValue = 100;
int sliderTicks1 = 100;
int sliderTicks2 = 30;


void setup() {
  size(1200,700);
  noStroke();
  smooth();
  gui();
  
  if (isOn == true){
    opacity = 100;
  }

  cp5 = new ControlP5(this);
  
  //add on/off buttons
  cp5.addButton("ON")
     .setValue(0)
     .setPosition(650,500)
     .setSize(200,30)
     ;
  
  cp5.addButton("OFF")
     .setValue(100)
     .setPosition(650,540)
     .setSize(200,30)
     ;
  
  cp5.addTextlabel("labelA")
     .setText("POWER")
     .setPosition(730,480)
     .setColorValue(255)
     //.setFont(createFont("Georgia", 20))
     ;
       
  // add horizontal sliders for temperature
  cp5.addSlider("ship temperature")
     .setHeight(30)
     .setPosition(450,500)
     .setRange(0,255)
     .setValue(76)
     ;
     
  cp5.addSlider("temp. of environment")
     .setHeight(30)
     .setPosition(450,540)
     .setRange(0,255)
     .setValue(43)
     ;
  
  // add knob for speed
  myKnobA = cp5.addKnob("speed")
     .setRange(0,200)
     .setValue(80)
     .setStringValue("99 MPH")
     .setPosition(880,440)
     .setRadius(90)
     .setDragDirection(Knob.VERTICAL)
     .setNumberOfTickMarks(6)
     ;
     
  // add 2D slider for position
  s = cp5.addSlider2D("position")
     .setPosition(450, 100)
     .setSize(400,350)
     .setArrayValue(new float[] {50, 50})//starting position of slider
     .setColorValue(color(255, 255, 255))
     .setColorBackground(color(25, 43, 208, opacity))
     ;
         
  // add vertical slider for fuel
  cp5.addSlider("Fuel")
     .setPosition(70,50)
     .setSize(60,560)
     .setRange(0,100)
     .setNumberOfTickMarks(11)
     .setValue(60)
     ;
     
  // add vertical slider for atmosphere and O2 levels
  cp5.addSlider("Atmosphere")
     .setPosition(900,100)
     .setSize(50,300)
     .setRange(0,200)
     .setValue(128)
     ;

  cp5.addSlider("O2 Level")
     .setPosition(1000,50)
     .setSize(50,350)
     .setRange(0,200)
     .setValue(128)
     ;

  // add horizontal slider for destination
  cp5.addSlider("DESTINATION")
     .setPosition(450,50)
     .setWidth(400)
     .setRange(255,0) // values can range from big to small as well
     .setValue(128)
     .setNumberOfTickMarks(7)
     .setSliderMode(Slider.FLEXIBLE)
     ;

  // add label for navigation
  cp5.addTextlabel("label")
     .setText("NAVIGATION")
     .setPosition(620,30)
     .setColorValue(255)
     ;
}

// shows engine diagnostics
void gui() {
  cp5 = new ControlP5(this);
  
  // create engine 1 group
  Group g1 = cp5.addGroup("ENGINE 01")
     .setBackgroundColor(color(50, 255))
     .setBackgroundHeight(250)
     .setHeight(30)
     .setPosition(50, 30)
     ;
     
  // create engine 2 group
  Group g2 = cp5.addGroup("ENGINE 02")
     .setBackgroundColor(color(50, 225))
     .setBackgroundHeight(250)
     .setHeight(30)
     .setPosition(50, 30)
     ;
  
  // add slider for engine 2 health
  cp5.addSlider("e02_health")
     .setPosition(20,20)
     .setSize(150,20)
     .setRange(100,500)
     .setValue(450)
     .moveTo(g2)
     ;

  // add slider for engine 2 lifespan
  cp5.addSlider("e02_lifespan")
     .setPosition(20,50)
     .setSize(150,20)
     .setRange(100,500)
     .setValue(350)
     .moveTo(g2)
     ;

  // add button for engine 2 diagnostics
  cp5.addButton("e02_run diagnostics?")
     .setPosition(20,80)
     .setSize(200,40)
     .setValue(0)
     .moveTo(g2)
     ;

  // add slider for engine 1 health
  cp5.addSlider("e01_health")
     .setPosition(20,20)
     .setSize(150,20)
     .setRange(100,500)
     .setValue(450)
     .moveTo(g1)
     ;

  // add slider for engine 1 lifespan
  cp5.addSlider("e01_lifespan")
     .setPosition(20,50)
     .setSize(150,20)
     .setRange(100,500)
     .setValue(350)
     .moveTo(g1)
     ;

  // add button for engine 1 diagnostics
  cp5.addButton("e01_run diagnostics?")
     .setPosition(20,80)
     .setSize(200,40)
     .setValue(0)
     .moveTo(g1)
     ;

  // create a new accordion and add g1 and g2
  accordion = cp5.addAccordion("acc")
     .setPosition(170,50)
     .setWidth(250)
     .addItem(g1)
     .addItem(g2)
     ;
                 
  // controls to open/close engine display
  cp5.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.open(0, 1);}}, 'o');
  cp5.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.close(0, 1);}}, 'c');
  
  // opens both engine displays
  accordion.open(0, 1);
  
  // allows multiple groups to be open at once
  accordion.setCollapseMode(Accordion.MULTI);
} 

// draws background
void draw() {
  background(0);
}

// controls knob value with up/down keys
void keyPressed(){
  if (key == CODED) {
    if (keyCode == UP) {
      if (knobValue<200){knobValue += 5;}
    } else if (keyCode == DOWN) {
      if (knobValue>0){knobValue -= 5;}
    } myKnobA.setValue(knobValue);
  }
}
