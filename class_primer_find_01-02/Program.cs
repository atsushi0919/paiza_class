using System;

namespace class_primer_find_01_02
{
    class Program
    {
        static void Main()
        {
            int N = int.Parse(Console.ReadLine());

            User[] users = new User[N];
            for (int i = 0; i < N; i++)
            {
                string line = Console.ReadLine();
                string nickname = line.Split(' ')[0];
                int old = int.Parse(line.Split(' ')[1]);
                string birth = line.Split(' ')[2];
                string state = line.Split(' ')[3];
                users[i] = new User(nickname, old, birth, state);
            }
            int K = int.Parse(Console.ReadLine());

            foreach (User user in users)
            {
                if (user.old == K)
                {
                    Console.WriteLine(user.nickname);
                }
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
        }
    }
}
