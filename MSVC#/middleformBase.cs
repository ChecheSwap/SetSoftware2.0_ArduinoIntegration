using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MundoMusical.XBASE
{
    public partial class middleformBase : BaseForm
    {
        protected Central2 origen;

        public middleformBase() 
        {
            InitializeComponent();
        }

        protected void middleformBase_Load(object sender, EventArgs e)
        {
            this.ActiveControl = this.addbtn;
        }
    }
}
