using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MundoMusical.CUSTOM_CONTROLS;
using System.IO;

namespace MundoMusical.XML_SCHEMA_WRITER
{
    public class dgvtoxml_dataset
    {
        private DataSet tmpdataset;
        private DataTable table;
        private DGVCustom dgv;
        private string path;
        private FileStream mystream;

        private bool makecommit =false;

        public dgvtoxml_dataset(DGVCustom dgv,string name)
        {            
            this.dgv = dgv;           
            this.path = genericDefinitions.XMLSCHEMASPATH + "\\XMLSchema_" + name + "_" + this.dgv.Name+".xml";
        }

        public dgvtoxml_dataset(DataTable table, string name)
        {
            this.table = table;
            this.path = genericDefinitions.XMLSCHEMASPATH + "\\XMLSchema_" + name +".xml";
        }

        public void create()
        {
            try
            {
                if (Directory.Exists(genericDefinitions.XMLSCHEMASPATH))
                {
                    if (File.Exists(this.path))
                    {
                        this.makecommit = true;                        
                    }
                    else
                    {
                        this.mystream = new FileStream(this.path, FileMode.Create);
                    }
                                        
                }
                else
                {
                    Directory.CreateDirectory(genericDefinitions.XMLSCHEMASPATH);
                    this.mystream = new FileStream(this.path, FileMode.Create);
                }

                if (this.dgv != null)
                {
                    this.table = new DataTable();
                    this.gettablefromdgv();
                }

                if (!this.makecommit) //PROCEDE SI EL XML NO EXISTE EN DISCO, CREA EL XML
                {
                    this.tmpdataset = new DataSet();
                    this.tmpdataset.Tables.Clear();
                    this.tmpdataset.Tables.Add(this.table);
                    this.tmpdataset.WriteXmlSchema(this.mystream);
                    this.mystream.Close();
                }           
            }
            catch(Exception ex)
            {
                genericDefinitions.error(ex.ToString());
            }
        }

        private void gettablefromdgv()
        {           
            foreach (DataGridViewColumn column in this.dgv.Columns)
            {
                DataColumn dc = new DataColumn();
                dc.ColumnName = column.HeaderText;
                dc.DataType = typeof(string);                                
                this.table.Columns.Add(dc);
            }

            foreach (DataGridViewRow row in this.dgv.Rows)
            {
                DataRow dr = this.table.Rows.Add();

                for (int x = 0; x < this.dgv.ColumnCount; ++x)
                {
                    if(row.Cells[x].ValueType == typeof(DateTime))
                    {
                        string val = row.Cells[x].Value.ToString();
                        
                        if(val.Length > 8)
                        {
                            dr[x] = val.Remove(10,val.Length-10);
                        }                                                                                                                   
                    }
                    else
                    {
                        dr[x] = row.Cells[x].Value.ToString();
                    }                    
                }
            }            
        }

        public DataTable getdatatable()
        {
            return this.table;
        }
    }
}
