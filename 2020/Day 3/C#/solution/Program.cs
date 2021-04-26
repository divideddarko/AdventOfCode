using System;
using System.IO;
using System.Collections.Generic;


namespace solution
{
    class Program
    {
        static void Main(string[] args)
        {
            int results = PartOne();
            long result2 = PartTwo();

            Console.WriteLine($"Found these results {results} & {result2}");
        }

        public static string[] ImportFile()
        {
            string[] content = Array.ConvertAll(File.ReadAllLines("..\\..\\Input.txt"), stringInput => stringInput);
            return content;
        }

        public static int PartOne()
        {
            int results = 0;
            string[] content = ImportFile();
            int position = 0;

            Console.WriteLine($"there are a total of {content.Length} lines");

            foreach (var row in content)
            {
                string currentChar = Convert.ToString(row[position]);

                if (currentChar == "#")
                {
                    results++;
                }

                if (position == 30)
                {
                    position = 2;
                }
                else if (position == 29)
                {
                    position = 1;
                }
                else if (position == 28)
                {
                    position = 0;
                }
                else
                {
                    position = position + 3;
                }
            }

            return results;
        }

        public static long PartTwo()
        {
            long finalResult = 1;            
            List<int> found = new List<int>();
            int[] numToCheck = new int[] { 1, 3, 5, 7, 1 };
            string[] content = ImportFile();            
            int iter = 0;

            foreach (int nTC in numToCheck)
            {
                int results = 0;
                int position = 0;
                int rowcount = 0;
                foreach (var row in content)
                {
                    if ((iter == 4) && (!(rowcount % 2 == 0)))
                    {
                        rowcount++;
                        continue;
                    }

                    string currentChar = Convert.ToString(row[position]);

                    if (currentChar == "#")
                    {
                        results++;
                    }

                    int positionToGo = position + nTC;

                    if (positionToGo >= row.Length)
                    {
                        position = positionToGo - row.Length;
                    }
                    else
                    {
                        position = position + nTC;
                    }
                    rowcount++;
                }
                iter++;
                found.Add(results);
            }

            foreach (var item in found)
            {
                finalResult *= item;
            }

            return finalResult;
        }
    }
}
