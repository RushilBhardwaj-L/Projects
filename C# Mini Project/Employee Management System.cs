using System;
using System.Collections;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;


/*
 3 classes - Org -> Empl : perm; not perm
*/


namespace C_
{
    class Employee
    {
        protected string empName;
        public Employee()
        {
            Console.WriteLine("Enter Employee Name: ");
            empName = Console.ReadLine();
        }

        ~Employee()
        {
            Console.WriteLine("Emp Destr");
        }

        public string getEmpName()
        {
            return empName;
        }
    }

    class PEmployee : Employee
    {
        int hra;
        public PEmployee()
        {
            hra = 0;
        }

        public void setHRA()
        {
            Console.WriteLine("Enter HRA:");
            hra = int.Parse(Console.ReadLine());
        }
        public int getHRA()
        {
            return hra;
        }
        ~PEmployee()
        {
            Console.WriteLine("PEmployee Destr");
        }
    }

    class NPEmployee : Employee
    {
        int duration;

        public NPEmployee()
        {
            duration = 0;
        }

        public int getDuration()
        {
            return duration;
        }

        public void setDuration()
        {
            Console.WriteLine("Enter Duration: ");
            duration = int.Parse(Console.ReadLine());
        }

        ~NPEmployee()
        {
            Console.WriteLine("NPEmployee Destr");
        }
    }

    class Org
    {
        ArrayList ar;

        public Org()
        {
            ar = new ArrayList();
        }
        public void addEmployee()
        {
            Employee e2 = null;
            int ch;
            Console.WriteLine("\nEnter 1. For Permanent Employee\n2. For Non-Permanent Employee:\n");
            ch = int.Parse(Console.ReadLine());
            if (ch == 1)
            {
                e2 = new PEmployee();
                ar.Add(e2);
                if (e2.GetType().Name.Equals("PEmployee"))
                    ((PEmployee)e2).setHRA();
            }
            else if (ch == 2)
            {
                e2 = new NPEmployee();
                ar.Add(e2);
                if (e2.GetType().Name.Equals("NPEmployee"))
                    ((NPEmployee)e2).setDuration();
            }
            else
            {
                Console.WriteLine("Enter Correct Choice\n");
            }
        }
        public void dispEmployeeDetails()
        {
            int ch;
            IEnumerator e = ar.GetEnumerator();
            while(e.MoveNext())
            {
                Console.WriteLine("\nEnter 1. For Permanent Employee\n2. For Non-Permanent Employee: ");
                ch = int.Parse(Console.ReadLine());
                Employee e1 = (Employee)e.Current;
                if (ch == 1)
                {
                    Console.WriteLine("Employee Name: " + e1.getEmpName());
                    if (e1.GetType().Name.Equals("PEmployee"))
                        Console.WriteLine("Employee HRA: " + ((PEmployee)e1).getHRA());


                }
                else if (ch == 2)
                {
                    Console.WriteLine("Employee Name: " + e1.getEmpName());
                    if (e1.GetType().Name.Equals("NPEmployee"))
                        Console.WriteLine("Employee Duration: " + ((NPEmployee)e1).getDuration());
                }
                else
                {
                    Console.WriteLine("Enter Correct Choice\n");
                }
            }
        }
    }

    class User
    {
        static void Main()
        {
            Org o = new Org();
            char loopCond = 'y';
            while (loopCond == 'y')
            {
                Console.WriteLine("\nEnter choice:\n1. To Add Employee\n2. To Display Employee Details\n3.To Exit: ");
                int ch = int.Parse(Console.ReadLine());
                if (ch == 1)
                    o.addEmployee();
                else if (ch == 2)
                    o.dispEmployeeDetails();
                else if (ch == 3)
                    break;
                else
                    Console.WriteLine("Wrong Choice!");

                Console.WriteLine("To continue enter 'y' else click any other key: ");
                loopCond = char.Parse(Console.ReadLine());
            }
        }
    }
}
