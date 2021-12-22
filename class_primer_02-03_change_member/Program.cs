using System;
using System.Collections.Generic;

namespace class_primer_02_03_change_member
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
                    case "change_num":
                        int newNumber = int.Parse(input[2]);
                        employees[num - 1].ChangeNum(newNumber);
                        break;
                    case "change_name":
                        string newName = input[2];
                        employees[num - 1].ChangeName(newName);
                        break;
                }
            }
        }

        public class Employee
        {
            private string name;
            private int number;

            public Employee(string name, int number)
            {
                this.name = name;
                this.number = number;
            }

            public int GetNum()
            {
                return number;
            }

            public void ChangeNum(int newNumber)
            {
                number = newNumber;
            }

            public string GetName()
            {
                return name;
            }

            public void ChangeName(string newName)
            {
                name = newName;
            }
        }
    }
}
