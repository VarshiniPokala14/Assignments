using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hello
{
    class Assign2
    {
        public static void Main(string[] args)
        {
            string s = Console.ReadLine();
            string res = MaxProduct(s);
            Console.WriteLine(res);
        }
        public static string MaxProduct(string s)
        {
            int maxprod = 0;
            string digits = "";
            for(int i = 0; i <= s.Length - 4; i++)
            {
                int prod = 1;
                string currentdig = "";
                for(int j = 0; j < 4; j++)
                {
                    int digit = s[i + j] - '0'; 
                    prod *= digit;
                    currentdig += digit.ToString();

                    if (j < 3)
                    {
                        currentdig += " * ";
                    }
                }
                if (prod > maxprod)
                {
                    maxprod = prod;
                    digits = currentdig;
                }
            }
            string c= $"{digits} = {maxprod}";
            return c;
        }
    }
}
