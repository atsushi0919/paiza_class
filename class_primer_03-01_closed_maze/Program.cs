using System;
using System.Collections.Generic;

namespace class_primer_03_01_closed_maze
{
    class Program
    {
        static void Main()
        {
            string[] input = Console.ReadLine().Split();
            int N = int.Parse(input[0]);
            int K = int.Parse(input[1]);
            int S = int.Parse(input[2]);

            List<Point> points = new List<Point>();
            for (int i = 0; i < N; i++)
            {
                input = Console.ReadLine().Split();
                string spell = input[0];
                int path1 = int.Parse(input[1]);
                int path2 = int.Parse(input[2]);
                points.Add(new Point(spell, new int[] { path1, path2 }));
            }

            Player player = new Player();
            player.Move(points[S - 1]);
            for (int i = 0; i < K; i++)
            {
                int destination = int.Parse(Console.ReadLine());
                int nextPoint = player.GetNextPoint(destination);
                player.Move(points[nextPoint]);
            }

            Console.WriteLine(player.CastMagicSpell());
        }
    }

    public struct Point
    {
        public string spell;
        public int[] paths;

        public Point(string spell, int[] paths)
        {
            this.spell = spell;
            this.paths = new int[paths.Length];
            Array.Copy(paths, this.paths, paths.Length);
        }
    }

    class Player
    {
        private Point currentPoint;
        private readonly List<string> spells;

        public Player()
        {
            spells = new List<string>();
        }

        public int GetNextPoint(int destination)
        {
            return currentPoint.paths[destination - 1] - 1;
        }

        public void Move(Point point)
        {
            spells.Add(point.spell);
            currentPoint = point;
        }

        public string CastMagicSpell()
        {
            return string.Join("", spells);
        }
    }
}
