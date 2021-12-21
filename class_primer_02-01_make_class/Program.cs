using System;
using System.Collections.Generic;

namespace class_primer_02_01_make_class
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
                        Console.WriteLine(employees[num - 1].Number);
                        break;
                    case "getname":
                        Console.WriteLine(employees[num - 1].Name);
                        break;
                }
            }
        }

        public class Employee
        {
            public string Name
            {
                get;
            }
            public int Number
            {
                get;
            }

            public Employee(string name, int number)
            {
                this.Name = name;
                this.Number = number;
            }
        }
    }
}