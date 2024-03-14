package data_structures_sort;

import org.junit.jupiter.api.Test;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.PrintStream;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class SolutionTest {
    @Test
    public void test() {
        String input = """
                5
                33 Rumpa 3.68
                85 Ashis 3.85
                56 Samiha 3.75
                19 Samara 3.75
                22 Fahim 3.76
                """;

        System.setIn(new ByteArrayInputStream(input.getBytes()));

        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        PrintStream ps = new PrintStream(baos);
        System.setOut(ps);

        Solution.main(new String[]{});

        String expected = """
                Ashis
                Fahim
                Samara
                Samiha
                Rumpa
                """;

        assertEquals(expected, baos.toString());
    }
}
