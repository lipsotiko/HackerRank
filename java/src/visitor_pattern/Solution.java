package visitor_pattern;

import java.util.ArrayList;
import java.util.*;
import java.util.Scanner;

enum Color {
    RED, GREEN
}

abstract class Tree {

    private final int value;
    private final Color color;
    private final int depth;

    public Tree(int value, Color color, int depth) {
        this.value = value;
        this.color = color;
        this.depth = depth;
    }

    public int getValue() {
        return value;
    }

    public Color getColor() {
        return color;
    }

    public int getDepth() {
        return depth;
    }

    public abstract void accept(TreeVis visitor);
}

class TreeNode extends Tree {

    private ArrayList<Tree> children = new ArrayList<>();

    public TreeNode(int value, Color color, int depth) {
        super(value, color, depth);
    }

    public void accept(TreeVis visitor) {
        visitor.visitNode(this);

        for (Tree child : children) {
            child.accept(visitor);
        }
    }

    public void addChild(Tree child) {
        children.add(child);
    }
}

class TreeLeaf extends Tree {

    public TreeLeaf(int value, Color color, int depth) {
        super(value, color, depth);
    }

    public void accept(TreeVis visitor) {
        visitor.visitLeaf(this);
    }
}

abstract class TreeVis {
    public abstract int getResult();

    public abstract void visitNode(TreeNode node);

    public abstract void visitLeaf(TreeLeaf leaf);

}

class SumInLeavesVisitor extends TreeVis {

    private int result = 0;
    public int getResult() {
        return result;
    }

    public void visitNode(TreeNode node) {
        if (node.getDepth() == 0) {
            result += node.getValue();
        }
    }

    public void visitLeaf(TreeLeaf leaf) {
        //implement this
    }
}

class ProductOfRedNodesVisitor extends TreeVis {

    private int result = 1;

    public int getResult() {
        return result;
    }

    public void visitNode(TreeNode node) {
        if (node.getColor().equals(Color.RED)) {
            result *= node.getValue();
        }
    }

    public void visitLeaf(TreeLeaf leaf) {
        //implement this
    }
}

class FancyVisitor extends TreeVis {

    private int sumOfNonLeafNodes = 0;
    private int sumOfGreenNodes = 0;

    public int getResult() {
        return Math.abs(sumOfNonLeafNodes - sumOfGreenNodes);
    }

    public void visitNode(TreeNode node) {
        if (node.getDepth() != 0 && node.getDepth() % 2 == 0) {
            sumOfNonLeafNodes += node.getValue();
        }

        if (node.getColor().equals(Color.GREEN)) {
            sumOfGreenNodes += node.getValue();
        }
    }

    public void visitLeaf(TreeLeaf leaf) {
        //implement this
    }
}

public class Solution {

    public static Tree solve() {
        Scanner in = new Scanner(System.in);
        int nodeCount = in.nextInt();

        int[] values = new int[nodeCount];
        for (int i = 0; i < nodeCount; i++) {
            values[i] = in.nextInt();
        }

        Color[] colors = new Color[nodeCount];
        for (int i = 0; i < nodeCount; i++) {
            colors[i] = in.nextInt() == 1 ? Color.GREEN : Color.RED;
        }

        int[][] nodeLeaves = new int[nodeCount - 1][2];
        for (int i = 0; i < nodeCount - 1; i++) {
            int left = in.nextInt();
            int right = in.nextInt();
            nodeLeaves[i] = new int[]{left, right};
        }

        int[] depths = new int[nodeCount];
        for(int i = 0; i < nodeCount; i++) {
            int depth = 0;
            depth = countDepth(nodeLeaves, i, depth);
            depths[i] = depth;
        }

        List<TreeNode> treeNodes = new ArrayList<>();
        for(int i = 0; i < nodeCount; i++) {
            treeNodes.add(new TreeNode(values[i], colors[i], depths[i]));
        }

        for (int[] nodeLeaf : nodeLeaves) {
            TreeNode treeNode = treeNodes.get(nodeLeaf[0] - 1);
            treeNode.addChild(treeNodes.get(nodeLeaf[1] - 1));
        }

        return treeNodes.get(0);
    }

    private static int countDepth(int[][] leaves, int i, int depth) {
        for (int[] leaf : leaves) {
            if (leaf[0] - 1 == i) {
                return countDepth(leaves, leaf[1], ++depth);
            }
        }
        return depth;
    }

    public static void main(String[] args) {
        Tree root = solve();
        SumInLeavesVisitor vis1 = new SumInLeavesVisitor();
        ProductOfRedNodesVisitor vis2 = new ProductOfRedNodesVisitor();
        FancyVisitor vis3 = new FancyVisitor();

        root.accept(vis1);
        root.accept(vis2);
        root.accept(vis3);

        int res1 = vis1.getResult();
        int res2 = vis2.getResult();
        int res3 = vis3.getResult();

        System.out.println(res1);
        System.out.println(res2);
        System.out.println(res3);
    }
}