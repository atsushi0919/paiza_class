using System;
using System.Collections.Generic;

namespace class_primer_change_01_04
{
    class Program
    {
        static void Main()
        {
            string[] input = Console.ReadLine().Split(' ');
            int N = int.Parse(input[0]);
            int K = int.Parse(input[1]);

            List<User> users = new List<User>();
            for (int i = 0; i < N; i++)
            {
                input = Console.ReadLine().Split(' ');
                string nickname = input[0];
                int old = int.Parse(input[1]);
                string birth = input[2];
                string state = input[3];
                users.Add(new User(nickname, old, birth, state));
            }
            for (int i = 0; i < K; i++)
            {
                input = Console.ReadLine().Split(' ');
                int idx = int.Parse(input[0]) - 1;
                string newName = input[1];
                User user = users[idx];
                user.nickname = newName;
                users[idx] = user;
            }

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
