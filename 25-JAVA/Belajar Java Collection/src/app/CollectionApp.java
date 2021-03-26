package app;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class CollectionApp {
    public static void main(String[] args) {
        Iterable<String> names = List.of("Abdul", "Aziz");
        for (var name : names
        ) {
            System.out.println(name);
        }

        Collection<String> colections = new ArrayList<>();
        colections.add("Abdul");
        colections.add("Aziz");
        for (var value:colections
             ) {
            System.out.println(value);
        }

    }
}
