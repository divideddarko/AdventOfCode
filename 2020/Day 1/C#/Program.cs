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
            Console.WriteLine($"Part 1:");
            Stopwatch stopwatch = new Stopwatch();
            stopwatch.Start();
            int results = PartOne();
            stopwatch.Stop();
            Console.WriteLine($"Time: {stopwatch.Elapsed}");
            Console.WriteLine($"Results: {results}");
            Console.WriteLine($"Part 2:");
            stopwatch.Reset();
            stopwatch.Start();
            int r = PartTwo();
            stopwatch.Stop();
            Console.WriteLine($"Time: {stopwatch.Elapsed}");
            Console.WriteLine($"Results: {r}");
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
    }
}
