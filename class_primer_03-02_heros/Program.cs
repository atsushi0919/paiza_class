using System;
using System.Collections.Generic;

namespace class_primer_03_02_heros
{
    class Program
    {
        static void Main()
        {
            string[] input = Console.ReadLine().Split();
            int N = int.Parse(input[0]);
            int K = int.Parse(input[1]);

            List<Hero> heroes = new List<Hero>();
            for (int i = 0; i < N; i++)
            {
                int[] status = Array.ConvertAll(
                    Console.ReadLine().Split(), int.Parse);
                heroes.Add(new Hero(status));
            }

            for (int i = 0; i < K; i++)
            {
                input = Console.ReadLine().Split();
                Hero hero = heroes[int.Parse(input[0]) - 1];
                switch (input[1])
                {
                    case "levelup":
                        hero.LevelUp(int.Parse(input[2]),
                                     int.Parse(input[3]),
                                     int.Parse(input[4]),
                                     int.Parse(input[5]),
                                     int.Parse(input[6]),
                                     int.Parse(input[7]));
                        break;
                    case "muscle_training":
                        hero.MuscleTraning(int.Parse(input[2]),
                                           int.Parse(input[3]));
                        break;
                    case "running":
                        hero.Running(int.Parse(input[2]),
                                     int.Parse(input[3]));
                        break;
                    case "study":
                        hero.Study(int.Parse(input[2]));
                        break;
                    case "pray":
                        hero.Pray(int.Parse(input[2]));
                        break;
                }
            }
            foreach (Hero hero in heroes)
            {
                Console.WriteLine(
                    String.Join(" ", hero.GetStatus()));
            }
        }
    }
    class Hero
    {
        private int lv, hp, ap, dp, sp, cp, fp;

        public Hero(int[] status)
        {
            lv = status[0];
            hp = status[1];
            ap = status[2];
            dp = status[3];
            sp = status[4];
            cp = status[5];
            fp = status[6];
        }

        public int[] GetStatus()
        {
            return new int[] { lv, hp, ap, dp, sp, cp, fp };
        }

        public void LevelUp(int addHp,
                            int addAp,
                            int addDp,
                            int addSp,
                            int addCp,
                            int addFp)
        {
            lv++;
            MuscleTraning(addHp, addAp);
            Running(addDp, addSp);
            Study(addCp);
            Pray(addFp);
        }

        public void MuscleTraning(int addHp, int addAp)
        {
            hp += addHp;
            ap += addAp;
        }

        public void Running(int addDp, int addSp)
        {
            dp += addDp;
            sp += addSp;
        }

        public void Study(int addCp)
        {
            cp += addCp;
        }

        public void Pray(int addFp)
        {
            fp += addFp;
        }
    }
}
