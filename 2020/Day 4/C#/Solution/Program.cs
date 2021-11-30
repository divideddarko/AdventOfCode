using System;
using System.IO;
using System.Text.RegularExpressions;


namespace Solution
{
    class Program
    {
        static void Main(string[] args)
        {
            int result = PartOne();
            int result2 = PartTwo();

            Console.WriteLine($"Part One {result} Part Two {result2}");
        }

        public static string[] ImportFile()
        {
            string[] content = Array.ConvertAll(File.ReadAllLines("..\\..\\Input.txt"), stringInput => stringInput);
            return content;
        }

        public static Boolean checkID(string PassportID, Boolean correct = false)
        {
            bool pidr = PassportID.Contains("pid");
            bool iyr = PassportID.Contains("iyr");
            bool eyr = PassportID.Contains("eyr");
            bool hgt = PassportID.Contains("hgt");
            bool hcl = PassportID.Contains("hcl");
            bool ecl = PassportID.Contains("ecl");
            bool byr = PassportID.Contains("byr");

            if (pidr && iyr && eyr && hgt && hcl && ecl && byr)
            {
                return correct = true;
            }

            return correct;
        }

        public static bool checkIDDetails(string PassportID, Boolean correct = false)
        {
            string[] SplitString = PassportID.Split(' ');

            bool pid = false;
            bool iyr = false;
            bool eyr = false;
            bool hgt = false;
            bool byr = false;
            bool aye = false;
            bool hcl = false;

            foreach (var item in SplitString)
            {
                if (item.Contains("pid:") && item.Length == 13)
                {
                    pid = true;
                }
                if (item.Contains("iyr:") && Int32.Parse(item.Split(':')[1]) >= 2010 && Int32.Parse(item.Split(':')[1]) <= 2020 && item.Length == 8)
                {
                    iyr = true;
                }
                if (item.Contains("eyr:") && Int32.Parse(item.Split(':')[1]) >= 2020 && Int32.Parse(item.Split(':')[1]) <= 2030 && item.Length == 8)
                {
                    eyr = true;
                }
                if (item.Contains("hgt:") && item.Contains("in") && Int32.Parse(item.Split(':')[1].Split("in")[0]) >= 59 && Int32.Parse(item.Split(':')[1].Split("in")[0]) <= 76)
                {
                    hgt = true;
                }
                else if (item.Contains("hgt:") && item.Contains("cm") && Int32.Parse(item.Split(':')[1].Split("cm")[0]) >= 150 && Int32.Parse(item.Split(':')[1].Split("cm")[0]) <= 193)
                {
                    hgt = true;
                }

                Regex hair = new Regex("#[aA-fF0-9]{6}");

                if (item.Contains("hcl:") && hair.IsMatch(item))
                {
                    hcl = true;
                }

                string[] eyes = {"amb", "blu", "brn", "gry", "grn", "hzl", "oth"};

                if (item.Contains("ecl:") && Array.Exists(eyes, eye => eye == item.Split(":")[1]))
                {
                    aye = true;
                }

                if (item.Contains("byr:") && Int32.Parse(item.Split(':')[1]) >= 1920 && Int32.Parse(item.Split(':')[1]) <= 2002 && item.Length == 8)
                {
                    byr = true;
                }

                if (pid && iyr && eyr && hgt && aye && hcl && byr)
                {
                    return true;
                }

            }
            return false;

        }

        public static int PartOne()
        {
            int results = 0;
            string[] content = ImportFile();

            string newInput = "";

            foreach (var item in content)
            {
                if (!String.IsNullOrWhiteSpace(item))
                {
                    newInput = newInput + item + " ";
                }
                else
                {
                    bool correct = checkID(newInput);
                    if (correct)
                    {
                        results++;
                    }
                    newInput = "";
                }
            }

            return results;
        }

        public static int PartTwo()
        {
            int results = 0;
            string newInput = "";
            string[] content = ImportFile();

            foreach (var item in content)
            {
                if (!String.IsNullOrWhiteSpace(item))
                {
                    newInput = newInput + item + " ";
                }
                else
                {
                    bool correct = checkIDDetails(newInput);
                    if (correct)
                    {
                        results++;
                    }
                    newInput = "";
                }
            }

            return results;
        }
    }
}
