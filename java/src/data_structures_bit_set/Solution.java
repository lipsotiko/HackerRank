package data_structures_bit_set;

import java.util.*;

public class Solution {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int n = in.nextInt();
        int m = in.nextInt();

        BitSet b1 = new BitSet(n);
        BitSet b2 = new BitSet(n);

        for (int i = 0; i < m; i++) {
            String operation = in.next();
            int set1 = in.nextInt();
            int setOrIndex = in.nextInt();

            if (operation.equals("AND") || operation.equals("OR") || operation.equals("XOR")) {

                BitSet left;
                BitSet right;

                if (set1 == 1) {
                    left = b1;
                    right = b2;
                } else {
                    left = b2;
                    right = b1;
                }

                if (operation.equals("AND")) {
                    left.and(right);
                } else if (operation.equals("OR")) {
                    left.or(right);
                } else {
                    left.xor(right);
                }
            }

            BitSet b;
            if (set1 == 1) {
                b = b1;
            } else {
                b = b2;
            }

            if (operation.equals("SET")) {
                b.set(setOrIndex);
            }

            if (operation.equals("FLIP")) {
                b.flip(setOrIndex);
            }

            System.out.println(convert(b1) + " " + convert(b2));
        }
    }

    public static long convert(BitSet bitSet) {
        int intValue = 0;
        for (int bit = 0; bit < bitSet.length(); bit++) {
            if (bitSet.get(bit)) {
                intValue++;
            }
        }
        return intValue;
    }
}
