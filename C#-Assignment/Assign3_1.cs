using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hello
{
    class Assign3_1
    {
        public static void Main(String[] args)
        {
            float m = float.Parse(Console.ReadLine());
            float n = float.Parse(Console.ReadLine());
            Console.WriteLine("Float to Binary Conversion");
            string mBinary = FloattoBinary(m);
            string nBinary = FloattoBinary(n);
            Console.WriteLine(mBinary);
            Console.WriteLine(nBinary);
            Console.WriteLine("Binary Addition");
            string binAdd = Binaryaddition(mBinary, nBinary);
            Console.WriteLine(binAdd);
            Console.WriteLine("Binary to Float Conversion");
            float res=BinarytoFloat(binAdd);
            Console.WriteLine(res);

        }
        public static string FloattoBinary(float f)
        {
            float f1 = Math.Abs(f);
            int i = (int)f1;
            float f2 = f1 - i;
            string s1 = "";
            if (i == 0)
            {
                s1 += "0";
            }
            else
            {
                while (i != 0)
                {
                    int rem = i % 2;
                    s1 += rem;
                    i = i / 2;
                }
            }
            char[] s11 = s1.ToCharArray();
            Array.Reverse(s11);
            string s12 = new string(s11);
            string s2 = ".";
            string s3 = "";
            
            if (f2 == 0.00)
            {
                s3 += "0";
            }
            else
            {
                while (f2 != 1.00)
                {

                    float f3 = f2 * 2;
                    f2 = f3;
                    if (f2 > 1)
                    {
                        f2 = f2 - 1;
                    }
                    string s = Convert.ToString(f3);
                    s3 += s[0];
                   
                }
            }
            string s4 = s12 + s2 + s3;
            return s4;
        }
        public static string Binaryaddition(string s1, string s2)
        {
            string[] p1 = s1.Split('.');
            string[] p2 = s2.Split('.');
            int maxintlen = Math.Max(p1[0].Length, p2[0].Length);
            int maxfraclen = Math.Max(p1[1].Length, p2[1].Length);
            string intp1 = p1[0].PadLeft(maxintlen, '0');
            string intp2 = p2[0].PadLeft(maxintlen, '0');
            string fracp1 = p1[1].PadRight(maxfraclen, '0');
            string fracp2= p2[1].PadRight(maxfraclen, '0');
            string s3 = intp1 + fracp1;
            string s4 = intp2 + fracp2;
            Console.WriteLine(s3);
            Console.WriteLine(s4);
            int maxlen = s3.Length;
            int carry = 0;
            string res = "";
            for (int i = maxlen - 1; i >= 0; i--)
            {
                int bit1 = s3[i] - '0';
                int bit2 = s4[i] - '0';
                int sum = bit1 + bit2 + carry;
                int result = sum % 2;
                carry = sum / 2;
                res += result;
            }
            if (carry > 0)
            {
                res += carry;
            }
            char[] s11 = res.ToCharArray();
            Array.Reverse(s11);
            string s12 = new string(s11);
            int len = s12.Length;
            string finalbin = "";
            for(int i = 0; i < len - maxfraclen; i++)
            {
                finalbin = finalbin + s12[i];
            }
            finalbin += ".";
            for(int i = len - maxfraclen; i < len; i++)
            {
                finalbin+= s12[i];
            }
            Console.WriteLine(s12);
            return finalbin;
        }
        public static float BinarytoFloat(string s)
        {
            string[] p1 = s.Split('.');
            int intlen = p1[0].Length;
            int fraclen = p1[1].Length;
            int sum1 = 0;
            float sum2 = 0.0f;
            float sum = 0.0f;
            string s1 = p1[0];
            string s2 = p1[1];
            Console.WriteLine(s1);
            Console.WriteLine(s2);
            
            for(int i = intlen-1; i >= 0; i--)
            {
                
                int x = intlen - 1 - i;
                int k = s1[i] - '0';
                sum1  = sum1+ (k * (1<<x));
            }
            int index = -1;
            for(int i=0; i< fraclen; i++)
            {
                
                float f = (float)Math.Pow(2, index);
                int k = s2[i] - '0';
                sum2 +=(float) (k*f);
                index--;
            }
            sum = sum1 + sum2;
            return sum;
            

        }
    }
}
