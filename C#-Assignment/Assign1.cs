using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
class Assign1
    {
    public static void Main(String[] args)
    {
        string s1 = "abaaabbbbabab";
        string s2 = "ab";
        int c = 0;
        int index = s1.IndexOf(s2);
        List<int> list=new List<int>();
        
        while (index != -1)
        {
            c++;
            list.Add(index);
            index = s1.IndexOf(s2,index+s2.Length);
            
        }
        Console.WriteLine("No.of times: "+c);
        Console.WriteLine(String.Join(", ", list));
    }
}

