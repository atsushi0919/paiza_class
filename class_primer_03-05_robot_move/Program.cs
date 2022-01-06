using System;
using System.Collections.Generic;
using System.Linq;

namespace class_primer_03_05_robot_move
{
    class Robot
    {
        // N,S,E,W
        private readonly int[] VX = new int[] { 0, 0, 1, -1 };
        private readonly int[] VY = new int[] { -1, 1, 0, 0 };
        // Lv 1,2,3,4
        private readonly int[] Mobility = new int[] { 1, 2, 5, 10 };

        private int _mobility;
        public int Lv { get; private set; }
        public int X { get; private set; }
        public int Y { get; private set; }

        public Robot(int x, int y, int lv)
        {
            X = x;
            Y = y;
            Lv = lv;
            _mobility = Mobility[lv - 1];
        }

        public string GetStatus()
        {
            return $"{X} {Y} {Lv}";
        }

        public void Move(string direction)
        {
            int index = GetDirectionIndex(direction);
            X += VX[index] * _mobility;
            Y += VY[index] * _mobility;
        }

        public void LvelUp()
        {
            if (Lv < 4)
            {
                Lv++;
                _mobility = Mobility[Lv - 1];
            }
        }

        private int GetDirectionIndex(string direction)
        {
            if (direction == "N")
            {
                return 0;
            }
            else if (direction == "S")
            {
                return 1;
            }
            else if (direction == "E")
            {
                return 2;
            }
            else
            {
                return 3;
            }
        }
    }

    struct Point
    {
        public int X, Y;

        public Point(int x, int y)
        {
            X = x;
            Y = y;
        }
    }
    class Program
    {
        static void Main()
        {
            const int NumOfToolBox = 10;
            string[] inputLines = Console.ReadLine().Split();
            int H = int.Parse(inputLines[0]);
            int W = int.Parse(inputLines[1]);
            int N = int.Parse(inputLines[2]);
            int K = int.Parse(inputLines[3]);

            Point[] toolBoxPoints = new Point[NumOfToolBox];
            for (int i = 0; i < NumOfToolBox; i++)
            {
                inputLines = Console.ReadLine().Split();
                int x = int.Parse(inputLines[0]);
                int y = int.Parse(inputLines[1]);
                toolBoxPoints[i] = new Point(x, y);
            }

            Robot[] robots = new Robot[N];
            for (int i = 0; i < N; i++)
            {
                inputLines = Console.ReadLine().Split();
                int x = int.Parse(inputLines[0]);
                int y = int.Parse(inputLines[1]);
                int lv = int.Parse(inputLines[2]);
                robots[i] = new Robot(x, y, lv);
            }

            for (int i = 0; i < K; i++)
            {
                inputLines = Console.ReadLine().Split();
                int index = int.Parse(inputLines[0]) - 1;
                string direction = inputLines[1];
                Robot robot = robots[index];
                robot.Move(direction);
                if (toolBoxPoints.Contains(new Point(robot.X, robot.Y)))
                {
                    robot.LvelUp();
                }
            }

            foreach (Robot robot in robots)
            {
                Console.WriteLine(robot.GetStatus());
            }
        }
    }
}