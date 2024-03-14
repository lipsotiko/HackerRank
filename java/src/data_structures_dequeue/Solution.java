package data_structures_dequeue;

import java.util.*;

public class Solution {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        Deque<Integer> deque = new ArrayDeque<>();
        int n = in.nextInt();
        int m = in.nextInt();
        Map<Integer, Integer> counts = new HashMap<>();

        for (int i = 0; i < m; i++) {
            int num = in.nextInt();
            deque.addLast(num);
            updateMap(counts, num);
        }

        int maxUnique = counts.size();

        for (int i = m; i < n; i++) {
            int num = in.nextInt();
            deque.addLast(num);

            Integer first = deque.removeFirst();
            Integer tmpCount = counts.get(first);
            if (tmpCount - 1 == 0) {
                counts.remove(first);
            } else {
                counts.put(first, --tmpCount);
            }

            int tmpMaxUnique = updateMap(counts, num);
            if (tmpMaxUnique > maxUnique) {
                maxUnique = tmpMaxUnique;
            }

            if (maxUnique == m) {
                break;
            }
        }

        System.out.println(maxUnique);
    }

    static int updateMap(Map<Integer, Integer> counts, Integer num) {
        Integer tmpCount = counts.get(num);
        if (tmpCount == null) {
            counts.put(num, 1);
        } else {
            counts.put(num, ++tmpCount);
        }
        return counts.size();
    }
}
