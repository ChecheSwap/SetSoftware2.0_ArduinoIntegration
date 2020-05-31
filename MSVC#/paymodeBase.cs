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
    public partial class paymodeBase : customerBase
    {
        public paymodeBase()
        {
            InitializeComponent();
            this.KeyDown += (x, y) => { if (y.KeyCode == Keys.Escape) this.Close(); };
        }

        private void paymodeBase_Load(object sender, EventArgs e)
        {

        }
    }
}
