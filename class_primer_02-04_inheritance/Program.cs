using System;
using System.Collections.Generic;

namespace class_primer_02_04_inheritance
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
            var customer = new Customer(25);

            customer.OrderFood();
        }
    }

    class Customer
    {
        private int age, payment;

        public Customer(int age)
        {
            this.age = age;
            payment = 0;
        }

        public void OrderFood()
        {
            Console.WriteLine("Order Food");
        }
    }
}
