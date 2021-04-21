using System;
using System.IO;
using System.Collections;
using System.Linq;
using System.Diagnostics;

namespace solution
{
    class Program
    {
        static void Main(string[] args)
        {
            PartOne();
            var results = PartTwo();
        }

        public static int PartOne()
        {
            int wordsThatMatch = 0;
            string[] content = Array.ConvertAll(File.ReadAllLines("..\\..\\input.txt"), stringInput => stringInput);

            foreach (var item in content)
            {
                int lowNum = Int32.Parse((item.Split('-'))[0]);
                int highNum = Int32.Parse(((item.Split('-'))[1]).Split(' ')[0]);
                char charToFind = Convert.ToChar(((item.Split(' '))[1]).Split(':')[0]);
                var password = (item.Split(": "))[1];

                Hashtable storedString = new Hashtable();

                foreach(char c in password) {   
                    if (storedString.ContainsKey(c))
                    {
                        int count = Int32.Parse(Convert.ToString(storedString[c]));
                        storedString[c] = count + 1;
                    }
                    else
                    {
                        storedString.Add(c, 1);
                    }
                }

                string cTF = Convert.ToString(storedString[charToFind]);

                if (cTF != "")
                {
                    int val = Int32.Parse(cTF);
                    
                    if(val >= lowNum && val <= highNum) {
                        wordsThatMatch++;
                    }
                }


            }
            Console.WriteLine(wordsThatMatch);
            return 0;
        }

        public static int PartTwo()
        {
            int wordsThatMatch = 0;
            
            string[] content = Array.ConvertAll(File.ReadAllLines("..\\..\\input.txt"), stringInput => stringInput);

            foreach (var item in content)
            {
                int foundChar = 0;
                int lowNum = Int32.Parse((item.Split('-'))[0]);
                int highNum = Int32.Parse(((item.Split('-'))[1]).Split(' ')[0]);
                char charToFind = Convert.ToChar(((item.Split(' '))[1]).Split(':')[0]);
                var password = (item.Split(": "))[1];

                int currentChar = 1;
                foreach (char p in password)
                {
                    if (p == charToFind && (currentChar == lowNum || currentChar == highNum))
                    {
                        foundChar++;
                    }
                    currentChar++;
                }

                if (foundChar == 1)
                {
                    wordsThatMatch++;
                }
            }
            Console.WriteLine($"words {wordsThatMatch}");
            return 0;
        }
    }
}
