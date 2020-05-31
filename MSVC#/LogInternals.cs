using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;
using System.Windows.Forms;
using MundoMusical.DB;
using System.Threading;
using MundoMusical.EFFECTS;
using MundoMusical.CTG_CONTROL_ARDUINO;

namespace MundoMusical.LOGIN
{
    public partial class LogInternals : BaseForm
    {
        protected Login1 firstbase;
        private dbop DB;
        private msdbop msdb;

        private ctg arduino;

        public LogInternals(Login1 parentForm)
        {
            InitializeComponent();            
            this.Text = "Iniciar sesión";            
            this.Move += this.onMove;
            this.firstbase = parentForm;
            this.DB = new dbop();
            this.msdb = new msdbop();

            genericDefinitions.arduino = new ctg(this);

            this.arduino = genericDefinitions.arduino;

            this.FormClosing += this.onClose;

            this.txtArduino.TextChanged += (a, b) =>
            {
                if (this.panelArduino.Visible == false)
                {
                    this.panelArduino.Visible = true;
                }
            };

            this.txtuser.KeyUp += (sender, args) =>
            {
                if (args.KeyCode == Keys.Enter && this.txtuser.Text.Trim() != "")
                {
                    this.txtpass.Focus();
                }
            };

            this.txtpass.KeyUp += (sender, args) =>
            {
                if (args.KeyCode == Keys.Enter)
                {
                    this.verify();
                }
            };

            this.MinimizeBox = true;

            this.SizeChanged += (sender, args) =>
            {
                if(this.WindowState == FormWindowState.Minimized)
                {
                    this.firstbase.WindowState = FormWindowState.Minimized;
                }
            };

            
        }
        private void clear()
        {
            this.txtuser.Text = "";
            this.txtpass.Text = "";
            this.txtuser.Focus();
        }

        public void simulateBackSpace()
        {
            if (this.txtArduino.Text.Length > 0)
            {
                this.txtArduino.Text = this.txtArduino.Text.Substring(0,this.txtArduino.Text.Length - 1);
            }
        }
        public void verify() //CHECA USUARIO
        {
            if (this.panelArduino.Visible)
            {                
                if (this.msdb.existToken(this.txtArduino.Text.Trim()))
                {

                    if (!(this.DB.getInterfacedUserAlias() == string.Empty))
                    {
                        MessageBox.Show(this.DB.getInterfacedUserAlias());
                        this.generalAcces(this.DB.getInterfacedUserAlias());
                        this.arduino.correctLogin();

                        usuario usr = this.DB.usrget(this.DB.getInterfacedUserAlias());

                        msdb.sendMail(usr.nombre + "  " + usr.apellido , usr.alias);
                    }
                    else
                    {
                        genericDefinitions.error("No se cuenta con un Usuario Interfaceado, contacte al SysAdmin");
                    }                    
                }
                else
                {
                    arduino.invalidLogin();
                    genericDefinitions.dangerInfo("Token Invalido, Corrija...","SetSw Arduino Interops Service");
                    arduino.stopAlarm();                    
                }
            }
            else
            {
                if (this.DB.usrexist(this.txtuser.Text.Trim().Replace(" ", "")))
                {
                    if (this.DB.usrpasscorrecto(this.txtuser.Text.Trim().Replace(" ", ""), this.txtpass.Text.Trim()))
                    {
                        generalAcces(this.txtuser.Text.Trim());
                    }
                    else
                    {
                        genericDefinitions.dangerInfo("Password de acceso Invalido", "Aviso");
                        this.txtpass.Text = "";
                        this.txtuser.Focus();
                    }
                }
                else
                {
                    genericDefinitions.dangerInfo("Usuario Invalido", "Aviso");
                    this.clear();
                }
            }
        }

        private void generalAcces(string usuario)
        {
            xfe.slide(this.firstbase, 250);
            this.firstbase.exitFlag = exitState.highest;
            this.exitFlag = exitState.highest;
            genericDefinitions.ALIAS = usuario.Replace(" ", "");
            this.firstbase.Visible = false;
            this.firstbase.ShowInTaskbar = false;
            Central2 central = new Central2(genericDefinitions.ALIAS);
            central.Show();
        }       

        #region Assembly Attribute Accessors

        public string AssemblyTitle
        {
            get
            {
                object[] attributes = Assembly.GetExecutingAssembly().GetCustomAttributes(typeof(AssemblyTitleAttribute), false);
                if (attributes.Length > 0)
                {
                    AssemblyTitleAttribute titleAttribute = (AssemblyTitleAttribute)attributes[0];
                    if (titleAttribute.Title != "")
                    {
                        return titleAttribute.Title;
                    }
                }
                return System.IO.Path.GetFileNameWithoutExtension(Assembly.GetExecutingAssembly().CodeBase);
            }
        }

        public string AssemblyVersion
        {
            get
            {
                return Assembly.GetExecutingAssembly().GetName().Version.ToString();
            }
        }

        public string AssemblyDescription
        {
            get
            {
                object[] attributes = Assembly.GetExecutingAssembly().GetCustomAttributes(typeof(AssemblyDescriptionAttribute), false);
                if (attributes.Length == 0)
                {
                    return "";
                }
                return ((AssemblyDescriptionAttribute)attributes[0]).Description;
            }
        }

        public string AssemblyProduct
        {
            get
            {
                object[] attributes = Assembly.GetExecutingAssembly().GetCustomAttributes(typeof(AssemblyProductAttribute), false);
                if (attributes.Length == 0)
                {
                    return "";
                }
                return ((AssemblyProductAttribute)attributes[0]).Product;
            }
        }

        public string AssemblyCopyright
        {
            get
            {
                object[] attributes = Assembly.GetExecutingAssembly().GetCustomAttributes(typeof(AssemblyCopyrightAttribute), false);
                if (attributes.Length == 0)
                {
                    return "";
                }
                return ((AssemblyCopyrightAttribute)attributes[0]).Copyright;
            }
        }

        public string AssemblyCompany
        {
            get
            {
                object[] attributes = Assembly.GetExecutingAssembly().GetCustomAttributes(typeof(AssemblyCompanyAttribute), false);
                if (attributes.Length == 0)
                {
                    return "";
                }
                return ((AssemblyCompanyAttribute)attributes[0]).Company;
            }
        }
        #endregion
        private void LogInternals_Load(object sender, EventArgs e)
        {
            this.ActiveControl = this.txtuser;            
        }

        private void logoPictureBox_Click(object sender, EventArgs e)
        {
        }

        private void onMove(object sender, EventArgs arg)
        {
            this.CenterToScreen();
        }
        protected override void WndProc(ref Message message)
        {
            const int WM_SYSCOMMAND = 0x0112;
            const int SC_MOVE = 0xF010;

            switch (message.Msg)
            {
                case WM_SYSCOMMAND:
                    int command = message.WParam.ToInt32() & 0xfff0;
                    if (command == SC_MOVE)
                        return;
                    break;
            }

            base.WndProc(ref message);
        }

        private void button1_Click(object sender, EventArgs e)
        {}

        private void button3_Click(object sender, EventArgs e)
        {}
        private void button2_Click_1(object sender, EventArgs e)
        { }

        private void button6_Click(object sender, EventArgs e)
        {
            this.verify();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            this.clear();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            genericDefinitions.ok("Ingrese 'Alias' o nombre completo de usuario y 'Contraseña' para iniciar al sistema.", "Información  de inicio");
            this.txtuser.Focus();
        }

        private void button1_Click_1(object sender, EventArgs e)
        {

            if (genericDefinitions.ARDUINO_AUTH)
            {
                this.panelOculto();
            }
            else
            {
                this.panelVisible();
            }

        }

        public void panelVisible()
        {
            this.panelArduino.Visible = true;
            genericDefinitions.ARDUINO_AUTH = true;
        }

        public void panelOculto()
        {
            this.panelArduino.Visible = false;
            genericDefinitions.ARDUINO_AUTH = false;
        }
    }
}
