import controlP5.*;

ControlP5 cp5;

Slider2D s;

Accordion accordion;

Chart myChart;
PImage img;

int knobValue = 100;

Knob myKnobA;

Textlabel myTextlabelA;

Textlabel myTextlabelB;

boolean isOn = true;
int opacity = 255;
int myColor = color(0,0,0);

int sliderValue = 100;
int sliderTicks1 = 100;
int sliderTicks2 = 30;
Slider abc;

void setup() {
  size(1200,700);
  noStroke();
  smooth();
  img = loadImage("Rectangle_5.png");
  gui();
  
  if (isOn == true){
    opacity = 100;
  }
  cp5 = new ControlP5(this);
  
  //add power buttons
  cp5.addButton("ON")
     .setValue(0)
     .setPosition(650,500)
     .setSize(200,30)
     ;
  
  // and add another 2 buttons
  cp5.addButton("OFF")
     .setValue(100)
     .setPosition(650,540)
     .setSize(200,30)
     ;
     
     cp5.addTextlabel("labelA")
       .setText("POWER")
       .setPosition(730,480)
       .setColorValue(255)
       //.setFont(createFont("Georgia",20))
       ;
       
     cp5.addSlider("ship temperature")
     .setHeight(30)
     .setPosition(450,500)
     .setRange(0,255)
     ;
     
     cp5.addSlider("temp. of environment")
     .setHeight(30)
     .setPosition(450,540)
     .setRange(0,255)
     ;
  
  //add knob
  myKnobA = cp5.addKnob("speed")
             .setRange(0,200)
             .setValue(90)
             .setStringValue("99 MPH")
             .setPosition(870,450)
             .setRadius(90)
             .setDragDirection(Knob.VERTICAL)
             .setNumberOfTickMarks(6)
             ;
  //adds 2D slider
  s = cp5.addSlider2D("position")
     .setPosition(450, 100)
     .setSize(400,350)
     .setArrayValue(new float[] {50, 50})//starting position of slider
     .setColorValue(color(255, 255, 255))
     .setColorBackground(color(25, 43, 208, opacity))
     //.disableCrosshair()
     ;
         
  // create another slider with tick marks, now without
  // default value, the initial value will be set according to
  // the value of variable sliderTicks2 then.
  cp5.addSlider("Fuel")
     .setPosition(70,50)
     .setSize(60,580)
     .setRange(0,100)
     .setNumberOfTickMarks(11)
     .setValue(60)
     ;
     
     
  // add a vertical slider
  cp5.addSlider("Atmosphere")
     .setPosition(900,100)
     .setSize(50,300)
     .setRange(0,200)
     .setValue(128)
     ;
     
  // add a vertical slider
  cp5.addSlider("O2 Level")
     .setPosition(1000,50)
     .setSize(50,350)
     .setRange(0,200)
     .setValue(128)
     ;
     
  cp5.addSlider("DESTINATION")
     .setPosition(450,50)
     .setWidth(350)
     .setRange(255,0) // values can range from big to small as well
     .setValue(128)
     .setNumberOfTickMarks(7)
     .setSliderMode(Slider.FLEXIBLE)
     ;
  // use Slider.FIX or Slider.FLEXIBLE to change the slider handle
  // by default it is Slider.FIX
  
  cp5.addTextlabel("label")
       .setText("NAVIGATION")
       .setPosition(450,30)
       .setColorValue(255)
       ;

}


void gui() {
  
  cp5 = new ControlP5(this);
  
  // engine number one, closed for now.
  Group g1 = cp5.addGroup("ENGINE 01")
                .setBackgroundColor(color(50, 255))
                .setBackgroundHeight(200)
                .setHeight(30)
                .setPosition(50, 30)
                ;
     
  // engine number 2, open to show engine diagonstics
  Group g2 = cp5.addGroup("ENGINE 02")
                .setBackgroundColor(color(50, 225))
                .setBackgroundHeight(150)
                .setHeight(30)
                .setPosition(50, 30)
                ;
  
     
  cp5.addSlider("e02_health")
     .setPosition(20,20)
     .setSize(150,20)
     .setRange(100,500)
     .setValue(450)
     .moveTo(g2)
     ;
     
  cp5.addSlider("e02_lifespan")
     .setPosition(20,50)
     .setSize(150,20)
     .setRange(100,500)
     .setValue(350)
     .moveTo(g2)
     ;
     
     cp5.addButton("e02_run diagnostics?")
       .setPosition(20,80)
       .setSize(200,40)
       .setValue(0)
       .moveTo(g2)
       ;
       
     cp5.addSlider("e01_health")
     .setPosition(20,20)
     .setSize(150,20)
     .setRange(100,500)
     .setValue(450)
     .moveTo(g1)
     ;
     
  cp5.addSlider("e01_lifespan")
     .setPosition(20,50)
     .setSize(150,20)
     .setRange(100,500)
     .setValue(350)
     .moveTo(g1)
     ;
     
     cp5.addButton("e01_run diagnostics?")
       .setPosition(20,80)
       .setSize(200,40)
       .setValue(0)
       .moveTo(g1)
       ;
       
       

  // create a new accordion
  // add g1, g2, and g3 to the accordion.
  accordion = cp5.addAccordion("acc")
                 .setPosition(170,50)
                 .setWidth(250)
                 .addItem(g1)
                 .addItem(g2)
                 ;
                 
  cp5.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.open(0,1,2);}}, 'o');
  cp5.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.close(0,1,2);}}, 'c');
  cp5.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.setWidth(300);}}, '1');
  cp5.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.setPosition(0,0);accordion.setItemHeight(190);}}, '2'); 
  cp5.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.setCollapseMode(ControlP5.ALL);}}, '3');
  cp5.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.setCollapseMode(ControlP5.SINGLE);}}, '4');
  cp5.mapKeyFor(new ControlKey() {public void keyEvent() {cp5.remove("myGroup1");}}, '0');
  
  accordion.open(0, 1);
  
  // use Accordion.MULTI to allow multiple group 
  // to be open at a time.
  //accordion.setCollapseMode(Accordion.MULTI);
  
  // when in SINGLE mode, only 1 accordion  
  // group can be open at a time.  
  accordion.setCollapseMode(Accordion.SINGLE);
} 

float cnt;
void draw() {
  background(0);
  
  //tint(255, 127); 
  image(img,0,0);
  fill(myColor);
  rect(0,280,width,70);

}
