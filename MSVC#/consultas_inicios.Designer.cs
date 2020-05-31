namespace MundoMusical.CONSULTAS.INICIOS_SESION
{
    partial class consultas_inicios
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(consultas_inicios));
            this.dtpinicio = new System.Windows.Forms.DateTimePicker();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.dtpcierre = new System.Windows.Forms.DateTimePicker();
            this.cbusuario = new System.Windows.Forms.ComboBox();
            this.label3 = new System.Windows.Forms.Label();
            this.lblregs = new System.Windows.Forms.Label();
            this.tabconsultas.SuspendLayout();
            this.tp1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pbox)).BeginInit();
            this.gb1.SuspendLayout();
            this.SuspendLayout();
            // 
            // tabconsultas
            // 
            this.tabconsultas.Size = new System.Drawing.Size(1075, 439);
            this.tabconsultas.TabStop = false;
            // 
            // tp1
            // 
            this.tp1.Controls.Add(this.lblregs);
            this.tp1.Size = new System.Drawing.Size(1067, 405);
            this.tp1.Text = ">>Inicios de Sesión";
            this.tp1.Controls.SetChildIndex(this.gb1, 0);
            this.tp1.Controls.SetChildIndex(this.panel1, 0);
            this.tp1.Controls.SetChildIndex(this.pbox, 0);
            this.tp1.Controls.SetChildIndex(this.btnprint, 0);
            this.tp1.Controls.SetChildIndex(this.lblregs, 0);
            // 
            // btnprint
            // 
            this.btnprint.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(224)))), ((int)(((byte)(224)))), ((int)(((byte)(224)))));
            this.btnprint.FlatAppearance.BorderSize = 0;
            this.btnprint.FlatAppearance.MouseDownBackColor = System.Drawing.Color.Transparent;
            this.btnprint.FlatAppearance.MouseOverBackColor = System.Drawing.Color.Transparent;
            this.btnprint.Location = new System.Drawing.Point(837, 33);
            this.btnprint.TabStop = false;
            this.btnprint.Visible = false;
            // 
            // pbox
            // 
            this.pbox.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("pbox.BackgroundImage")));
            this.pbox.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.pbox.Location = new System.Drawing.Point(492, 6);
            // 
            // panel1
            // 
            this.panel1.Location = new System.Drawing.Point(9, 209);
            this.panel1.Size = new System.Drawing.Size(1049, 190);
            // 
            // gb1
            // 
            this.gb1.Controls.Add(this.label3);
            this.gb1.Controls.Add(this.cbusuario);
            this.gb1.Controls.Add(this.label2);
            this.gb1.Controls.Add(this.dtpcierre);
            this.gb1.Controls.Add(this.label1);
            this.gb1.Controls.Add(this.dtpinicio);
            this.gb1.Location = new System.Drawing.Point(173, 93);
            this.gb1.Size = new System.Drawing.Size(720, 93);
            // 
            // dtpinicio
            // 
            this.dtpinicio.CalendarMonthBackground = System.Drawing.SystemColors.GradientInactiveCaption;
            this.dtpinicio.CustomFormat = "";
            this.dtpinicio.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpinicio.Location = new System.Drawing.Point(6, 50);
            this.dtpinicio.Name = "dtpinicio";
            this.dtpinicio.Size = new System.Drawing.Size(136, 26);
            this.dtpinicio.TabIndex = 56;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Times New Roman", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.Black;
            this.label1.Location = new System.Drawing.Point(19, 30);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(108, 17);
            this.label1.TabIndex = 57;
            this.label1.Text = "Fecha de Inicio";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Times New Roman", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.ForeColor = System.Drawing.Color.Black;
            this.label2.Location = new System.Drawing.Point(589, 31);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(114, 17);
            this.label2.TabIndex = 59;
            this.label2.Text = "Fecha de Cierre";
            // 
            // dtpcierre
            // 
            this.dtpcierre.CalendarMonthBackground = System.Drawing.SystemColors.GradientInactiveCaption;
            this.dtpcierre.CustomFormat = "";
            this.dtpcierre.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpcierre.Location = new System.Drawing.Point(578, 50);
            this.dtpcierre.Name = "dtpcierre";
            this.dtpcierre.Size = new System.Drawing.Size(136, 26);
            this.dtpcierre.TabIndex = 58;
            // 
            // cbusuario
            // 
            this.cbusuario.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbusuario.FormattingEnabled = true;
            this.cbusuario.Location = new System.Drawing.Point(160, 50);
            this.cbusuario.Name = "cbusuario";
            this.cbusuario.Size = new System.Drawing.Size(396, 27);
            this.cbusuario.TabIndex = 62;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Times New Roman", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.ForeColor = System.Drawing.Color.Black;
            this.label3.Location = new System.Drawing.Point(286, 30);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(140, 17);
            this.label3.TabIndex = 63;
            this.label3.Text = "Nombre de Usuario ";
            // 
            // lblregs
            // 
            this.lblregs.AutoSize = true;
            this.lblregs.Font = new System.Drawing.Font("Consolas", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblregs.ForeColor = System.Drawing.Color.Red;
            this.lblregs.Location = new System.Drawing.Point(6, 188);
            this.lblregs.Name = "lblregs";
            this.lblregs.Size = new System.Drawing.Size(104, 18);
            this.lblregs.TabIndex = 55;
            this.lblregs.Text = "Registros: 0";
            // 
            // consultas_inicios
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1076, 437);
            this.Name = "consultas_inicios";
            this.Text = "consultas_inicios";
            this.Load += new System.EventHandler(this.consultas_inicios_Load);
            this.tabconsultas.ResumeLayout(false);
            this.tp1.ResumeLayout(false);
            this.tp1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pbox)).EndInit();
            this.gb1.ResumeLayout(false);
            this.gb1.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DateTimePicker dtpinicio;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.DateTimePicker dtpcierre;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label3;
        public System.Windows.Forms.ComboBox cbusuario;
        private System.Windows.Forms.Label lblregs;
    }
}