using System;
using System.Collections.Generic;

namespace class_primer_02_05_set_default
{
    class Program
    {
        static void Main()
        {
            string[] input = Console.ReadLine().Split();
            int N = int.Parse(input[0]);
            int K = int.Parse(input[1]);
            List<Customer> customers = new List<Customer>();

            for (int i = 0; i < N; i++)
            {
                int age = int.Parse(Console.ReadLine());
                if (age < 20)
                {
                    customers.Add(new Customer(age));
                }
                else
                {
                    customers.Add(new AdultCustomer(age));
                }

            }
            for (int i = 0; i < K; i++)
            {
                input = Console.ReadLine().Split();
                int index = int.Parse(input[0]) - 1;
                string order = input[1];

                if (order == "0")
                {
                    customers[index].OrderAlcohol();
                }
                else
                {
                    int price = int.Parse(input[2]);
                    switch (order)
                    {
                        case "food":
                            customers[index].OrderFood(price);
                            break;
                        case "softdrink":
                            customers[index].OrderSoftDrink(price);
                            break;
                        case "alcohol":
                        case "0":
                            customers[index].OrderAlcohol(price);
                            break;
                    }
                }
            }

            foreach (Customer customer in customers)
            {
                Console.WriteLine(customer.GetPayment());
            }
        }
    }

    class Customer
    {
        protected readonly int age;
        protected int payment;

        public Customer(int age)
        {
            this.age = age;
            payment = 0;
        }

        public int GetPayment()
        {
            return payment;
        }

        public virtual void OrderFood(int price)
        {
            payment += price;
        }

        public void OrderSoftDrink(int price)
        {
            payment += price;
        }

        public virtual void OrderAlcohol(int price = 500)
        {
            // Console.WriteLine("お酒は20歳になってから");
        }
    }

    class AdultCustomer : Customer
    {
        private bool discount;

        public AdultCustomer(int age) : base(age)
        {
            discount = false;
        }

        public override void OrderFood(int price)
        {
            payment += discount ? price - 200 : price;
        }

        public override void OrderAlcohol(int price)
        {
            payment += price;
            if (!discount)
            {
                discount = true;
            }
        }
    }
}
