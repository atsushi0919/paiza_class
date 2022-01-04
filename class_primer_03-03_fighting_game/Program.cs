using System;

namespace class_primer_03_03_fighting_game
{
    class Player
    {
        private const int SkillCount = 3;
        public int hp { get; private set; }
        public int[] f { get; private set; }
        public int[] a { get; private set; }

        public Player(int hp,
                      int f1, int a1,
                      int f2, int a2,
                      int f3, int a3)
        {
            this.hp = hp;
            f = new int[SkillCount] { f1, f2, f3 };
            a = new int[SkillCount] { a1, a2, a3 };
        }

        public void Reinforce()
        {
            for (int i = 0; i < SkillCount; i++)
            {
                if (f[i] > 0)
                {
                    f[i] = Math.Max(1, f[i] - 3);
                    a[i] += 5;
                }
            }
        }

        public void TakeDamage(int damage)
        {
            hp = Math.Max(0, hp - damage);
        }
    }

    class FightingGame
    {
        public Player[] players { get; }

        public FightingGame(int numberOfPlayers)
        {
            players = new Player[numberOfPlayers];
        }

        public int CountActivePlayers()
        {
            int count = 0;
            foreach (Player player in players)
            {
                if (player.hp > 0) count++;
            }
            return count;
        }

        public void Fighting(int pi1, int si1, int pi2, int si2)
        {
            // ターンエンド
            if (ShouldTurnEnd(pi1, si1, pi2, si2)) return;

            // 戦闘
            Player p1 = players[pi1];
            Player p2 = players[pi2];

            // 攻撃順入れ替え
            if (p1.f[si1] > p2.f[si2])
            {
                Player pTmp = p1;
                p1 = p2;
                p2 = pTmp;
                int siTmp = si1;
                si1 = si2;
                si2 = siTmp;
            }

            // スキル処理
            int f1 = p1.f[si1];
            int a1 = p1.a[si1];
            int f2 = p2.f[si2];
            int a2 = p2.a[si2];
            if (f1 > 0)
            {
                // p1 攻撃
                p2.TakeDamage(a1);
            }
            else
            {
                // p1 強化
                p1.Reinforce();
                if (a2 == 0)
                {
                    // p2 強化
                    p2.Reinforce();
                }
                else
                {
                    // p2 攻撃
                    p1.TakeDamage(a2);
                }

            }
        }

        private bool ShouldTurnEnd(int pi1, int si1, int pi2, int si2)
        {
            Player p1 = players[pi1];
            Player p2 = players[pi2];
            if (p1.hp == 0 || p2.hp == 0) return true;
            if (p1.f[si1] == p2.f[si2] && p1.f[si1] != 0) return true;
            return false;
        }
    }
    class Program
    {
        static void Main()
        {
            string[] input = Console.ReadLine().Split();
            int N = int.Parse(input[0]);
            int K = int.Parse(input[1]);
            FightingGame game = new FightingGame(N);
            for (int i = 0; i < N; i++)
            {
                input = Console.ReadLine().Split();
                int hp = int.Parse(input[0]);
                int f1 = int.Parse(input[1]);
                int a1 = int.Parse(input[2]);
                int f2 = int.Parse(input[3]);
                int a2 = int.Parse(input[4]);
                int f3 = int.Parse(input[5]);
                int a3 = int.Parse(input[6]);
                game.players[i] = new Player(hp, f1, a1, f2, a2, f3, a3);
            }

            // ゲームを進める
            for (int i = 0; i < K; i++)
            {
                input = Console.ReadLine().Split();
                int pi1 = int.Parse(input[0]) - 1;
                int si1 = int.Parse(input[1]) - 1;
                int pi2 = int.Parse(input[2]) - 1;
                int si2 = int.Parse(input[3]) - 1;
                game.Fighting(pi1, si1, pi2, si2);
            }
            Console.WriteLine(game.CountActivePlayers());
        }
    }
}