package data_structures_comparators;

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
                amy 100
                david 100
                heraldo 50
                aakansha 75
                aleksa 150""";
        System.setIn(new ByteArrayInputStream(input.getBytes()));

        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        PrintStream ps = new PrintStream(baos);
        System.setOut(ps);

        Solution.main(new String[]{});

        String expected = """
                aleksa 150
                amy 100
                david 100
                aakansha 75
                heraldo 50
                """;
        assertEquals(expected, baos.toString());
    }

}
