using System;
using System.Collections.Generic;

namespace class_primer_02_02_constructor
{
    class Program
    {
        static void Main()
        {
            int N = int.Parse(Console.ReadLine());
            List<Employee> employees = new List<Employee>();
            for (int i = 0; i < N; i++)
            {
                string[] input = Console.ReadLine().Split(' ');
                string req = input[0];
                int num = int.Parse(input[1]);

                switch (req)
                {
                    case "make":
                        string name = input[2];
                        employees.Add(new Employee(name, num));
                        break;
                    case "getnum":
                        Console.WriteLine(employees[num - 1].GetNum());
                        break;
                    case "getname":
                        Console.WriteLine(employees[num - 1].GetName());
                        break;
                }
            }
        }

        public class Employee
        {
            private readonly string name;
            private readonly int number;

            public Employee(string name, int number)
            {
                this.name = name;
                this.number = number;
            }

            public int GetNum()
            {
                return number;
            }

            public string GetName()
            {
                return name;
            }
        }
    }
}
