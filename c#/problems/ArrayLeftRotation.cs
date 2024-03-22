class ArrayLeftRotation {


    public static List<int> RotateLeft(int d, List<int> arr)
    {
        int initialSize = arr.Count;
        for(int i = 0; i < d; i++) {
            arr.Add(arr[i]);
        }
        return arr.GetRange(d, initialSize);
    }

    public static void Execute() {
        Console.WriteLine("---ArrayLeftRotation---");
        Console.WriteLine(string.Join(" ",RotateLeft(4, [1, 2, 3, 4, 5]))); 
    }
}
