/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package java1;

/**
 *
 * @author connor.steer
 */
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URISyntaxException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import net.fortuna.ical4j.data.CalendarOutputter;
import net.fortuna.ical4j.model.Dur;
import net.fortuna.ical4j.model.Property;
import net.fortuna.ical4j.model.ValidationException;
import net.fortuna.ical4j.model.component.VEvent;
import net.fortuna.ical4j.model.property.CalScale;
import net.fortuna.ical4j.model.property.Description;
import net.fortuna.ical4j.model.property.Location;
import net.fortuna.ical4j.model.property.Organizer;
import net.fortuna.ical4j.model.property.ProdId;
import net.fortuna.ical4j.model.property.Version;

public class java2 {

 public static void main(String test) throws IOException, ValidationException {
  
  //Initilize values
  String calFile = "C:\\Users\\connor.steer\\Documents\\NetBeansProjects\\CalTest\\web\\mscal.ics";
  
  //start time
  java.util.Calendar startCal = java.util.Calendar.getInstance();
  startCal.set(2012, 04, 23, 20, 00);
  
  //end time
  java.util.Calendar endCal = java.util.Calendar.getInstance();
  endCal.set(2012, 04, 23, 20, 30);
  
  String subject = test;
  String location = "Location - Mumbai";
  String description = "This goes in decription section of the metting like agenda etc.";
  
  String hostEmail = "admin@javaxp.com";
  
  //Creating a new calendar
  net.fortuna.ical4j.model.Calendar calendar = new net.fortuna.ical4j.model.Calendar();
  calendar.getProperties().add(new ProdId("-//Ben Fortuna//iCal4j 1.0//EN"));
  calendar.getProperties().add(Version.VERSION_2_0);
  calendar.getProperties().add(CalScale.GREGORIAN);
  
  SimpleDateFormat sdFormat =  new SimpleDateFormat("yyyyMMdd'T'hhmmss'Z'");
  String strDate = sdFormat.format(startCal.getTime());
  
  net.fortuna.ical4j.model.Date startDt = null;
  try {
   startDt = new net.fortuna.ical4j.model.Date(strDate,"yyyyMMdd'T'hhmmss'Z'");
  } catch (ParseException e) {
   e.printStackTrace();
  }
  
  long diff = endCal.getTimeInMillis() - startCal.getTimeInMillis();
  int min = (int)(diff / (1000 * 60));
  
  Dur dur = new Dur(0,0,min,0);
  
  //Creating a meeting event
  VEvent meeting = new VEvent(startDt,dur,subject);
  
  meeting.getProperties().add(new Location(location));
  meeting.getProperties().add(new Description());
  
  try {
   meeting.getProperties().getProperty(Property.DESCRIPTION).setValue(description);
  } catch (IOException e) {
   e.printStackTrace();
  } catch (URISyntaxException e) {
   e.printStackTrace();
  } catch (ParseException e) {
   e.printStackTrace();
  }
  
  try {
   meeting.getProperties().add(new Organizer("MAILTO:"+hostEmail));
  } catch (URISyntaxException e) {
   e.printStackTrace();
  }
  
  calendar.getComponents().add(meeting);
  
  FileOutputStream fout = null;
  
  try {
   fout = new FileOutputStream(calFile);
  } catch (FileNotFoundException e) {
   e.printStackTrace();
  }
  
  CalendarOutputter outputter = new CalendarOutputter();
  outputter.setValidating(false);
  try {
   outputter.output(calendar, fout);
  } catch (IOException e) {
   e.printStackTrace();
  } catch (ValidationException e) {
   e.printStackTrace();
  }
  
  System.out.println(meeting);
 }
}
