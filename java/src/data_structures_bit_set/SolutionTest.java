package data_structures_bit_set;

import org.junit.jupiter.api.Test;

import java.io.*;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class SolutionTest {

    @Test
    public void test_1() {
        String input = """
                5 4
                AND 1 2
                SET 1 4
                FLIP 2 2
                OR 2 1
                """;
        System.setIn(new ByteArrayInputStream(input.getBytes()));

        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        PrintStream ps = new PrintStream(baos);
        System.setOut(ps);

        Solution.main(new String[]{});

        String expected = """
                0 0
                1 0
                1 1
                1 2
                """;
        assertEquals(expected, baos.toString());
    }

}
