using MundoMusical.LOGIN;
using System;
using System.Collections.Generic;
using System.IO.Ports;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MundoMusical.CTG_CONTROL_ARDUINO
{
    public class ctg
    {
        SerialPort serial;
        private string ardoPort = "COM3";

        private Thread th0;

        private LogInternals frm;

        public ctg(LogInternals frm) {            
            this.frm = frm;
            this.start();
        }

        public ctg()
        {
            this.start();
        }

        public void start()
        {
            try
            {
                genericDefinitions.CTG_FLAG = true;

                this.serial = new SerialPort(this.ardoPort, 9600);
                this.serial.Open();
                this.serial.Write("@");

                this.th0 = new Thread(new ThreadStart(ardoOperations));
                this.th0.IsBackground = true;
                this.th0.Start();
            }
            catch(Exception ex)
            {
                genericDefinitions.error("Error al acceder al recurso Arduino. " + ex.Message.ToString());
            }
        }

        private void ardoOperations()
        {
            while (genericDefinitions.CTG_FLAG)
            {
                string letter = ((char)this.serial.ReadChar()).ToString();

                if (!(letter.Trim() == string.Empty))
                {
                    switch(letter){
                        case ("D"):
                            {
                                break;
                            }
                        case ("*"):
                            {
                                this.enterPass();
                                break;
                            }
                        case ("#"):
                            {
                                this.backSpacePass();
                                break;
                            }
                        default:
                            {
                                this.frm.Invoke(new MethodInvoker(delegate () {
                                    frm.txtArduino.Text += letter;
                                }));
                                
                                break;
                            }
                    }                    
                }
            }
            if (!genericDefinitions.CTG_FLAG)
            {                
                this.serial.Write(('z').ToString());
                this.serial.Close();
                this.th0.Abort();
            }
        }

        public void disconn()
        {
            this.serial.Write(('z').ToString());            
        }

        public void stopAlarm()
        {
            this.serial.Write(('D').ToString());
        }

        public void correctLogin()
        {
            this.serial.Write(('1').ToString());
        }

        public void invalidLogin()
        {
            this.serial.Write(('0').ToString());
        }

        private void backSpacePass()
        {
            this.frm.Invoke(new MethodInvoker(delegate ()
            {
                this.frm.simulateBackSpace();
            }));
        }

        private void enterPass()
        {
            this.frm.Invoke(new MethodInvoker(delegate () {
                this.frm.verify();
            }));
            
        }


    }
}
