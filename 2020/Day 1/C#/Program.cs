using System;
using System.IO;
using System.Linq;
using System.Diagnostics;

namespace Day1
{
    class Program
    {
        static void Main(string[] args)
        {
            int results;
            Console.WriteLine($"Part 1:");
            Stopwatch stopwatch = new Stopwatch();
            stopwatch.Start();
            results = PartOne();
            Console.WriteLine($"Time: {stopwatch.Elapsed}");
            Console.WriteLine($"1A: Results: {results}");
            stopwatch.Stop();
            stopwatch.Reset();
            stopwatch.Start();
            results = PartOneB();
            Console.WriteLine($"Time: {stopwatch.Elapsed}");
            Console.WriteLine($"1B: Results: {results}");
            Console.WriteLine($"Part 2:");
            stopwatch.Stop();
            stopwatch.Reset();
            stopwatch.Start();
            results = PartTwo();
            stopwatch.Stop();
            Console.WriteLine($"Time: {stopwatch.Elapsed}");
            Console.WriteLine($"Results: {results}");
            stopwatch.Reset();
            stopwatch.Start();
            results = PartTwoB();
            stopwatch.Stop();
            Console.WriteLine($"Time: {stopwatch.Elapsed}");
            Console.WriteLine($"Results: {results}");
        }

        public static int PartOne()
        {
            int[] content = Array.ConvertAll(File.ReadAllLines("..\\input.txt"), stringInput => int.Parse(stringInput));
            foreach (int item in content)
            {
                foreach (var item2 in content)
                {
                    int value = item + item2;
                    if (value == 2020)
                    {
                        int results = item * item2;
                        return results;
                    }
                }
            }
            return 0;
        }

        public static int PartOneB()
        { 
            int[] content = Array.ConvertAll(File.ReadAllLines("..\\input.txt"), stringInput => int.Parse(stringInput));
            foreach (int item in content)
            {
                int toFind = 2020 - item;
                if (content.Contains(toFind))
                {
                    int results = item * toFind;
                    return results;
                }
            }
            return 0;
        }

        public static int PartTwo()
        {
            int[] content = Array.ConvertAll(File.ReadAllLines("..\\input.txt"), stringInput => int.Parse(stringInput));
            foreach (int item in content)
            {
                foreach (var item2 in content)
                {
                    foreach (var item3 in content) {
                        int value = item + item2 + item3;
                        if (value == 2020)
                        {
                            int results = item * item2 * item3;
                            return results;
                        }
                    }
                }
            }
            return 0;
        }

        public static int PartTwoB()
        {
            int[] content = Array.ConvertAll(File.ReadAllLines("..\\input.txt"), stringInput => int.Parse(stringInput));
            foreach (int item in content)
            {
                foreach (var item2 in content)
                {
                    int toFind = 2020 - item - item2;
                    if (content.Contains(toFind))
                    {
                        int results = item * item2 * toFind;
                        return results;
                    }
                }
            }
            return 0;
        }
    }
}
