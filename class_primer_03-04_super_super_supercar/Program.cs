using System;

namespace class_primer_03_04_super_super_supercar
{
    class SuperCar
    {
        protected int _fuel;
        protected int _gasMileage;
        public int Mileage { get; protected set; }

        public SuperCar(int fuel, int gasMileage)
        {
            _fuel = fuel;
            _gasMileage = gasMileage;
            Mileage = 0;
        }

        public void Run()
        {
            if (_fuel > 0)
            {
                _fuel -= 1;
                Mileage += _gasMileage;
            }
        }

        public virtual void Fly() { }

        public virtual void Teleport() { }
    }

    class SuperSuperCar : SuperCar
    {
        public SuperSuperCar(int fuel, int gasMileage) : base(fuel, gasMileage) { }
        public override void Fly()
        {
            if (_fuel >= 5)
            {
                _fuel -= 5;
                Mileage += (int)Math.Pow(_gasMileage, 2);
            }
            else
            {
                Run();
            }
        }
    }

    class SuperSuperSuperCar : SuperCar
    {
        public SuperSuperSuperCar(int fuel, int gasMileage) : base(fuel, gasMileage) { }

        public override void Fly()
        {
            if (_fuel >= 5)
            {
                _fuel -= 5;
                Mileage += (int)Math.Pow(_gasMileage, 2) * 2;
            }
            else
            {
                Run();
            }
        }

        public override void Teleport()
        {
            if (_fuel >= Math.Pow(_gasMileage, 2))
            {
                _fuel -= (int)Math.Pow(_gasMileage, 2);
                Mileage += (int)Math.Pow(_gasMileage, 4);
            }
            else
            {
                Fly();
            }
        }
    }

    class Program
    {
        static void Main()
        {
            string[] inputLines = Console.ReadLine().Split();
            int N = int.Parse(inputLines[0]);
            int K = int.Parse(inputLines[1]);
            SuperCar[] cars = new SuperCar[N];

            for (int i = 0; i < N; i++)
            {
                inputLines = Console.ReadLine().Split();
                string carType = inputLines[0];
                int fuel = int.Parse(inputLines[1]);
                int gasMileage = int.Parse(inputLines[2]);

                switch (carType)
                {
                    case "supercar":
                        cars[i] = new SuperCar(fuel, gasMileage);
                        break;
                    case "supersupercar":
                        cars[i] = new SuperSuperCar(fuel, gasMileage);
                        break;
                    case "supersupersupercar":
                        cars[i] = new SuperSuperSuperCar(fuel, gasMileage);
                        break;
                }
            }

            for (int i = 0; i < K; i++)
            {
                inputLines = Console.ReadLine().Split();
                int index = int.Parse(inputLines[0]) - 1;
                string operation = inputLines[1];

                switch (operation)
                {
                    case "run":
                        cars[index].Run();
                        break;
                    case "fly":
                        cars[index].Fly();
                        break;
                    case "teleport":
                        cars[index].Teleport();
                        break;
                }
            }

            foreach (var car in cars)
            {
                Console.WriteLine(car.Mileage);
            }
        }
    }
}
