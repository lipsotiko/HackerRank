package data_structures_priority_queue;

import org.junit.jupiter.api.Test;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.PrintStream;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class SolutionTest {

    @Test
    public void test_1() {
        String input = """
               12
               ENTER John 3.75 50
               ENTER Mark 3.8 24
               ENTER Shafaet 3.7 35
               SERVED
               SERVED
               ENTER Samiha 3.85 36
               SERVED
               ENTER Ashley 3.9 42
               ENTER Maria 3.6 46
               ENTER Anik 3.95 49
               ENTER Dan 3.95 50
               SERVED
               """;

        System.setIn(new ByteArrayInputStream(input.getBytes()));

        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        PrintStream ps = new PrintStream(baos);
        System.setOut(ps);

        Solution.main(new String[]{});

        String expected = """
                Dan
                Ashley
                Shafaet
                Maria
                """;
        assertEquals(expected, baos.toString());
    }

    @Test
    public void test_2() {
        String input = """
                30
                SERVED
                SERVED
                SERVED
                SERVED
                SERVED
                SERVED
                SERVED
                SERVED
                SERVED
                SERVED
                SERVED
                SERVED
                SERVED
                SERVED
                SERVED
                SERVED
                SERVED
                SERVED
                SERVED
                SERVED
                SERVED
                SERVED
                SERVED
                SERVED
                SERVED
                SERVED
                SERVED
                SERVED
                SERVED
                SERVED
               """;

        System.setIn(new ByteArrayInputStream(input.getBytes()));

        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        PrintStream ps = new PrintStream(baos);
        System.setOut(ps);

        Solution.main(new String[]{});

        String expected = """
                EMPTY
                """;
        assertEquals(expected, baos.toString());
    }

}
