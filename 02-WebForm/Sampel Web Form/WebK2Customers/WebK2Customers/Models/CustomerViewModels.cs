using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;

namespace WebK2Customers.Models
{
    public class CustomerViewModels
    {
        [DisplayName("Customer ID")]
        public int CustomerID { get; set; }

        [DisplayName("Customer Name")]
        public string CustomerName { get; set; }

        public CustomerViewModels(int cutomerID, string customerName)
        {
            this.CustomerID = cutomerID;
            this.CustomerName = customerName;
        }
    }

    
}