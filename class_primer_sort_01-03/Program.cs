using System;
using System.Collections.Generic;

namespace class_primer_sort_01_03
{
    class Program
    {
        static void Main()
        {
            int N = int.Parse(Console.ReadLine());
            List<User> users = new List<User>();
            for (int i = 0; i < N; i++)
            {
                string[] input = Console.ReadLine().Split(' ');
                string nickname = input[0];
                int old = int.Parse(input[1]);
                string birth = input[2];
                string state = input[3];
                users.Add(new User(nickname, old, birth, state));
            }

            users.Sort((a, b) => a.old - b.old);
            foreach (User user in users)
            {
                Console.WriteLine(user.Info());
            }
        }

        public struct User
        {
            public string nickname, birth, state;
            public int old;

            public User(string nickname, int old, string birth, string state)
            {
                this.nickname = nickname;
                this.old = old;
                this.birth = birth;
                this.state = state;
            }

            public string Info()
            {
                return string.Format("{0} {1} {2} {3}", nickname, old, birth, state);
            }
        }
    }
}
