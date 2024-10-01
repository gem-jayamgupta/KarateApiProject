package com.gemini.utils;

import java.util.Random;

public class MyUtils {

    public static String getCustomMessage(String name) {
        return "Hello, " + name + "! This is a custom message.";
    }

    public static int addNumbers(int a, int b) {
        return a + b;
    }

    public static String generateRandomString(int length) {
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        StringBuilder result = new StringBuilder();
        Random random = new Random();

        for (int i = 0; i < length; i++) {
            int index = random.nextInt(characters.length());
            result.append(characters.charAt(index));
        }

        return result.toString();
    }

}
