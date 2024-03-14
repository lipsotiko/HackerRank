package data_structures_priority_queue;

import java.util.PriorityQueue;
import java.util.Scanner;

public class Solution {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        int totalEvents = in.nextInt();

        PriorityQueue<Student> queue = new PriorityQueue<>();

        for (int i = 0; i < totalEvents; i++) {
            String operation = in.next();

            if (operation.equals("ENTER")) {
                String name = in.next();
                double cgpa = in.nextDouble();
                int id = in.nextInt();
                queue.add(new Student(id, name, cgpa));
            } else {
                queue.poll();
            }
        }

        if (queue.isEmpty()) {
            System.out.println("EMPTY");
        }

        while(!queue.isEmpty()) {
            System.out.println(queue.peek().getName());
            queue.poll();
        }
    }

    static class Student implements Comparable<Student> {
        private final int id;
        private final String name;
        private final double cgpa;

        public Student(int id, String name, double cgpa) {
            this.id = id;
            this.name = name;
            this.cgpa = cgpa;
        }

        public int getId() {
            return id;
        }

        public String getName() {
            return name;
        }

        public double getCgpa() {
            return cgpa;
        }

        @Override
        public int compareTo(Student s) {
            if (s.getCgpa() == cgpa && s.getName().equals(name)) {
                return Integer.compare(s.getId(), id);
            } else if (s.getCgpa() == cgpa) {
                return name.compareTo(s.getName());
            } else {
                return Double.compare(s.getCgpa(), cgpa);
            }
        }
    }
}
