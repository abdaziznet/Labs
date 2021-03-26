package app;

import java.util.Calendar;
import java.util.Date;

public class DateApp {
    public static void main(String[] args) {
        Date tanggal = new Date();

        System.out.println(tanggal);

        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.YEAR,3000);
        calendar.set(Calendar.MONTH,Calendar.DECEMBER);
        calendar.set(Calendar.DAY_OF_MONTH,31);
        calendar.set(Calendar.HOUR_OF_DAY,0);
        calendar.set(Calendar.MINUTE,0);
        calendar.set(Calendar.SECOND,0);
        calendar.set(Calendar.MILLISECOND,0);

        Date date = calendar.getTime();
        System.out.println(date);

    }
}
