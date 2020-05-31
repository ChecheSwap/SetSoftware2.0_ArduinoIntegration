using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MundoMusical.ATOM
{
    public partial class central2OnLoad : BaseForm
    {
        public central2OnLoad(string title)
        {
            InitializeComponent();
            KeyPress += this.onKeyPressed;
            this.Text = title;
            this.KeyPreview = true;
            this.MaximizeBox = false;
            this.FormBorderStyle = FormBorderStyle.Fixed3D;
            this.MinimizeBox = false;
            this.ShowInTaskbar = false;

            this.a.Location = new Point(this.Width / 2 - this.a.Width / 2, this.a.Location.Y);
            this.b.Location = new Point(this.Width / 2 - this.b.Width / 2, this.b.Location.Y);

        }

        private void central2OnLoad_Load(object sender, EventArgs e)
        {}


        private void onKeyPressed(object sender, KeyPressEventArgs args)
        {
            if (args.KeyChar == (char)Keys.Enter)
            {
                this.Close();
            }
        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void a_Click(object sender, EventArgs e)
        {

        }
    }   
}

