package helpers;

import java.io.*;

public class Helpers {

    public static ByteArrayOutputStream importTestFile(String resourcePath) throws FileNotFoundException {
        BufferedReader reader = new BufferedReader(new FileReader(resourcePath));

        StringBuilder sb = new StringBuilder();
        reader.lines().forEach((l) -> sb.append(l).append(" "));

        System.setIn(new ByteArrayInputStream(sb.toString().getBytes()));

        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        PrintStream ps = new PrintStream(baos);
        System.setOut(ps);

        return baos;
    }
}
