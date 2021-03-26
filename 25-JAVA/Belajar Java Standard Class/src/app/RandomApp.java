package app;

import java.util.Random;

public class RandomApp {
    public static void main(String[] args) {
        Random random = new Random();
        for (var i=0; i<100;i++){
            System.out.println(random.nextLong());
        }
    }
}
