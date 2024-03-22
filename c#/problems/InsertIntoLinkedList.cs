internal class InsertIntoLinkedList
{
    public static SinglyLinkedListNode insertNodeAtPosition(SinglyLinkedListNode llist, int data, int position)
    {

        if (position == 1) {
            SinglyLinkedListNode newHeadNode = new()
            {
                data = data,
                next = llist
            };
            llist = newHeadNode;
            return llist;
        }

        int currentPositionIndex = 0;
        SinglyLinkedListNode current = llist;
        while (currentPositionIndex != position - 2)
        {

            current = current.GetNext();
            currentPositionIndex++;
        }

         SinglyLinkedListNode newNode = new()
         {
            data = data
        };

        if (current.GetNext() == null) {
            current.next = newNode;
            return llist;
        }

        SinglyLinkedListNode tmp = current.GetNext();
        current.next = newNode;
        newNode.next = tmp;

        return llist;
    }

    public static void Execute()
    {
        Console.WriteLine("---InsertIntoLinkedList---");
        SinglyLinkedList llist = new();

        foreach (int data in new List<int>([111, 222, 333, 444]))
        {
            llist.InsertNode(data);
        }

        print(insertNodeAtPosition(llist.head, 7656, 3));
        print(insertNodeAtPosition(llist.head, 9876, 6));
        print(insertNodeAtPosition(llist.head, 8888, 1));
        print(insertNodeAtPosition(llist.head, 9999, 3));
    }

    static void print(SinglyLinkedListNode node) {
        SinglyLinkedListNode current = node;
        List<int> data = [current.data];
        while(current.GetNext() != null) {
            data.Add(current.GetNext().data);
            current = current.GetNext();
        }
        Console.WriteLine(string.Join(", ", data));
    }

}

internal class SinglyLinkedList
{
    public SinglyLinkedListNode head;
    public SinglyLinkedListNode tail;

    public void InsertNode(int data)
    {
        if (head == null)
        {
            head = new SinglyLinkedListNode
            {
                data = data
            };
            tail = head;
        }
        else if (head.next == null)
        {
            head.next = new SinglyLinkedListNode
            {
                data = data
            };
            tail = head.next;
        }
        else
        {
            tail.next = new SinglyLinkedListNode
            {
                data = data
            };

            tail = tail.next;
        }
    }
}

class SinglyLinkedListNode
{
    public int data;
    public SinglyLinkedListNode next;

    public SinglyLinkedListNode GetNext() {
        return next;
    }

}

