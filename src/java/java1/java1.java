package java1;




import net.fortuna.ical4j.model.*;
import java.io.IOException;
import net.fortuna.ical4j.data.*;
import net.fortuna.ical4j.model.property.*;
import java.io.FileOutputStream;
import net.fortuna.ical4j.model.component.*;
import net.fortuna.ical4j.util.*;
//import java.util.*;

public class java1 {

    public static void add(String path) throws IOException, ParserException, ValidationException  
     {
        Calendar calendar = new Calendar();
        calendar.getProperties().add(new ProdId("-//Ben Fortuna//iCal4j 1.0//EN"));
        calendar.getProperties().add(Version.VERSION_2_0);
        calendar.getProperties().add(CalScale.GREGORIAN);
        
        

        FileOutputStream fout = new FileOutputStream("mycalendar.ics");
        CalendarOutputter outputter = new CalendarOutputter();
        outputter.output(calendar,fout);
     }

}



