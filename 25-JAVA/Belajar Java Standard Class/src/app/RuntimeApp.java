package app;

public class RuntimeApp {
    public static void main(String[] args) {
        System.out.println(Runtime.getRuntime().availableProcessors());
        System.out.println(Runtime.getRuntime().freeMemory() / 1024);
        System.out.println(Runtime.getRuntime().maxMemory() /1024);
    }
}
