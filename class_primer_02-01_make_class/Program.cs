using System;
using System.Collections.Generic;
using System.Linq;

namespace class_primer_02_01_make_class
{
    class Program
    {
        static void Main()
        {
            string[] input = Console.ReadLine().Split(' ');
            int N = int.Parse(input[0]);

            List<Employee> employees = new List<Employee>();
            for (int i = 0; i < N; i++)
            {
                input = Console.ReadLine().Split(' ');
                switch (input[0])
                {
                    case "make":
                        Console.WriteLine("Make");
                        employees.Add(new Employee(input[1]));
                        break;
                    case "getnum":
                        Console.WriteLine(Employee.employees[int.Parse(input[1]) - 1].number);
                        break;
                    case "getname":
                        Console.WriteLine("GetName");
                        break;
                }
                foreach (var e in employees)
                {
                    Console.WriteLine(e);
                }
                // string name = input[0];
                // users.Add(new User(nickname, old, birth, state));
            }
            // for (int i = 0; i < K; i++)
            // {
            //     input = Console.ReadLine().Split(' ');
            //     int idx = int.Parse(input[0]) - 1;
            //     string newName = input[1];
            //     User user = users[idx];
            //     user.nickname = newName;
            //     users[idx] = user;
            // }

            // foreach (User user in users)
            // {
            //     Console.WriteLine(user.Info());
            // }
        }

        public class Employee
        {
            public string name;
            public int number;

            // コンストラクタ
            public Employee(string name)
            {
                this.name = name;
                number += 1;
            }
        }
    }
}
