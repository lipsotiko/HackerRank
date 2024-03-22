class SparseArrays {

    public static List<int> matchingStrings(List<string> stringList, List<string> queries)
    {
        Dictionary<string, int> counts = new Dictionary<string, int>();

        foreach(string s in stringList) {
            if (counts.ContainsKey(s)) {
                counts[s] += 1;
            } else {
                 counts.Add(s, 1);
            }
        }

        List<int> results = new List<int>();
        foreach(string q in queries) {
            if (counts.ContainsKey(q)) {
                results.Add(counts[q]);
            } else {
                results.Add(0);
            }
        }
        
        return results;
    }

    public static void Execute() {
        Console.WriteLine("---SparseArrays---");
        Console.WriteLine(String.Join(" ", matchingStrings(["aba", "baba", "aba", "xzxb"], ["aba", "xzxb", "ab"])));
    }
}
