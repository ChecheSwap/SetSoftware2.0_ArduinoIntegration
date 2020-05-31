namespace MundoMusical.CATEGORY
{
    partial class seecategory
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.txtname = new System.Windows.Forms.TextBox();
            this.txtdesc = new System.Windows.Forms.TextBox();
            this.txtnumero = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.labelx = new System.Windows.Forms.Label();
            this.gb1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.gbx.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pb)).BeginInit();
            this.SuspendLayout();
            // 
            // gb1
            // 
            this.gb1.AutoSize = true;
            this.gb1.Controls.Add(this.labelx);
            this.gb1.Location = new System.Drawing.Point(233, 130);
            this.gb1.Size = new System.Drawing.Size(463, 187);
            this.gb1.Controls.SetChildIndex(this.labelx, 0);
            // 
            // pictureBox1
            // 
            this.pictureBox1.Size = new System.Drawing.Size(708, 105);
            // 
            // groupBox2
            // 
            this.gbx.Controls.Add(this.label5);
            this.gbx.Controls.Add(this.label4);
            this.gbx.Controls.Add(this.label3);
            this.gbx.Controls.Add(this.label2);
            this.gbx.Controls.Add(this.txtnumero);
            this.gbx.Controls.Add(this.txtdesc);
            this.gbx.Controls.Add(this.txtname);
            this.gbx.Size = new System.Drawing.Size(209, 187);
            // 
            // pb
            // 
            this.pb.Location = new System.Drawing.Point(323, 47);
            // 
            // blapse
            // 
            this.blapse.FlatAppearance.BorderColor = System.Drawing.Color.AliceBlue;
            this.blapse.FlatAppearance.BorderSize = 0;
            this.blapse.Location = new System.Drawing.Point(674, 111);
            // 
            // txtname
            // 
            this.txtname.BackColor = System.Drawing.Color.PeachPuff;
            this.txtname.Location = new System.Drawing.Point(103, 64);
            this.txtname.Name = "txtname";
            this.txtname.Size = new System.Drawing.Size(100, 20);
            this.txtname.TabIndex = 2;
            // 
            // txtdesc
            // 
            this.txtdesc.BackColor = System.Drawing.Color.PeachPuff;
            this.txtdesc.Location = new System.Drawing.Point(103, 102);
            this.txtdesc.Name = "txtdesc";
            this.txtdesc.Size = new System.Drawing.Size(100, 20);
            this.txtdesc.TabIndex = 3;
            // 
            // txtnumero
            // 
            this.txtnumero.BackColor = System.Drawing.Color.PeachPuff;
            this.txtnumero.Location = new System.Drawing.Point(103, 139);
            this.txtnumero.Name = "txtnumero";
            this.txtnumero.Size = new System.Drawing.Size(100, 20);
            this.txtnumero.TabIndex = 4;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Modern No. 20", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(4, 67);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(55, 17);
            this.label2.TabIndex = 5;
            this.label2.Text = "Nombre";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Modern No. 20", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(4, 105);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(80, 17);
            this.label3.TabIndex = 6;
            this.label3.Text = "Descripción";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Modern No. 20", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(4, 139);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(87, 17);
            this.label4.TabIndex = 7;
            this.label4.Text = "Numero (ID)";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Vladimir Script", 21.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.ForeColor = System.Drawing.Color.Blue;
            this.label5.Location = new System.Drawing.Point(42, 16);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(126, 35);
            this.label5.TabIndex = 8;
            this.label5.Text = "Categorias";
            // 
            // labelx
            // 
            this.labelx.AutoSize = true;
            this.labelx.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelx.ForeColor = System.Drawing.Color.Red;
            this.labelx.Location = new System.Drawing.Point(131, 87);
            this.labelx.Name = "labelx";
            this.labelx.Size = new System.Drawing.Size(199, 24);
            this.labelx.TabIndex = 1;
            this.labelx.Text = "No existen Categorias.";
            this.labelx.Visible = false;
            // 
            // seecategory
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(708, 335);
            this.Name = "seecategory";
            this.Text = "seecategory";
            this.Load += new System.EventHandler(this.seecategory_Load);
            this.gb1.ResumeLayout(false);
            this.gb1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.gbx.ResumeLayout(false);
            this.gbx.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pb)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        protected System.Windows.Forms.TextBox txtname;
        protected System.Windows.Forms.TextBox txtdesc;
        protected System.Windows.Forms.TextBox txtnumero;
        protected System.Windows.Forms.Label label5;
        protected System.Windows.Forms.Label label4;
        protected System.Windows.Forms.Label label3;
        protected System.Windows.Forms.Label label2;
        protected System.Windows.Forms.Label labelx;
    }
}