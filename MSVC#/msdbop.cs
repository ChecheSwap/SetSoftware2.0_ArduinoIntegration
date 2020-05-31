using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MundoMusical.DB
{
    public class msdbop
    {
        private SqlConnection xconn;
        private string mssqlPath = SQLQ.connectionString;

        public void sendMail(string nombre, string alias)
        {
            if (this.connect())
            {
                try
                {
                    using (SqlCommand cmd = new SqlCommand(SQLQ.sendmail, this.xconn))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@msg", "El Usuario "+nombre+" con alias: "+alias+" ha iniciado sesion en el sistema con el metodo automatizado. \n Hora del Evento: ");

                        cmd.ExecuteNonQuery();
                    }
                }
                catch(Exception ex)
                {
                    genericDefinitions.error(ex.Message.ToString());
                }
                finally
                {
                    this.disconn();
                }
            }
        }
        public bool existToken(string token)
        {
            bool flag = false;
            if (this.connect())
            {
                try
                {
                    using (SqlCommand cmd = new SqlCommand(SQLQ.login, this.xconn))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@access_token",token);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.HasRows)
                            {
                                flag = !flag;
                            }
                        }
                    }
                }
                catch(Exception ex)
                {
                    genericDefinitions.error(ex.Message.ToString());
                }
                finally
                {
                    this.disconn();
                }
            }
            return flag;
        }
        public bool connect()
        {
            bool flag = true;
            try
            {
                this.xconn = new SqlConnection(this.mssqlPath);
                this.xconn.Open();
            }
            catch (Exception ex)
            {
                flag = !flag;
                ex.Message.ToString();
            }

            return flag;
        }

        public bool disconn()
        {
            bool flag = true;
            try
            {
                if (this.xconn.State == System.Data.ConnectionState.Open)
                {
                    this.xconn.Close();
                    this.xconn.Dispose();
                }
            }
            catch (Exception ex)
            {
                flag = !flag;
            }

            return flag;
        }
    }
}
