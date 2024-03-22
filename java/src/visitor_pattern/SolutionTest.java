package visitor_pattern;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.Timeout;

import java.io.*;

import static helpers.Helpers.importTestFile;
import static org.junit.jupiter.api.Assertions.assertEquals;

class SolutionTest {

    @Test
    public void test_1() {
        String input = """
                5
                4 7 2 5 12
                0 1 0 0 1
                1 2
                1 3
                3 4
                3 5
                """;

        System.setIn(new ByteArrayInputStream(input.getBytes()));

        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        PrintStream ps = new PrintStream(baos);
        System.setOut(ps);

        Solution.main(new String[]{});

        String expected = """
                24
                40
                15
                """;

        assertEquals(expected, baos.toString());
    }

//    @Test
//    @Timeout(5)
//    public void test_2() throws FileNotFoundException {
//        ByteArrayOutputStream baos = importTestFile("src/visitor_pattern/test_2.txt");
//
//        Solution.main(new String[]{});
//
//        String expected = """
//                39755013
//                433579985
//                14530307
//                """;
//
//        assertEquals(expected, baos.toString());
//    }

    @Test
    public void test_3() throws FileNotFoundException {
        ByteArrayOutputStream baos = importTestFile("src/visitor_pattern/test_3.txt");

        Solution.main(new String[]{});

        String expected = """
                45136
                56618427
                14333
                """;

        assertEquals(expected, baos.toString());
    }

}
