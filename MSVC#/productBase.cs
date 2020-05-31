using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MundoMusical.PRODUCT;
namespace MundoMusical.XBASE
{
    public partial class productBase : customerBase
    {
        public midformProduct origen;

        public productBase()
        {
            InitializeComponent();
            this.KeyDown += (x, y) => { if (y.KeyCode == Keys.Escape) this.Close(); };
        }

        private void productBase_Load(object sender, EventArgs e)
        {

        }
    }
}
