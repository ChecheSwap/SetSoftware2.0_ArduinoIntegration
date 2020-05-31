namespace MundoMusical.CONSULTAS.VENTAS
{
    partial class consulta_ventas
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
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(consulta_ventas));
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle3 = new System.Windows.Forms.DataGridViewCellStyle();
            this.label3 = new System.Windows.Forms.Label();
            this.txtnumeroventa = new System.Windows.Forms.TextBox();
            this.dtpfecha = new System.Windows.Forms.DateTimePicker();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.cbstatus = new System.Windows.Forms.ComboBox();
            this.label4 = new System.Windows.Forms.Label();
            this.toolTip1 = new System.Windows.Forms.ToolTip(this.components);
            this.button1 = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.btnprintDesglose = new System.Windows.Forms.Button();
            this.btnprevia = new System.Windows.Forms.Button();
            this.button3 = new System.Windows.Forms.Button();
            this.cbidcliente = new System.Windows.Forms.ComboBox();
            this.tabdesglose = new System.Windows.Forms.TabPage();
            this.gboxdatosventa = new System.Windows.Forms.GroupBox();
            this.txtdescextra = new MundoMusical.CUSTOM_CONTROLS.TXTBOXOnlyRead();
            this.label10 = new System.Windows.Forms.Label();
            this.txttotal = new MundoMusical.CUSTOM_CONTROLS.TXTBOXOnlyRead();
            this.label9 = new System.Windows.Forms.Label();
            this.txtiva = new MundoMusical.CUSTOM_CONTROLS.TXTBOXOnlyRead();
            this.label8 = new System.Windows.Forms.Label();
            this.txtsubtotal = new MundoMusical.CUSTOM_CONTROLS.TXTBOXOnlyRead();
            this.label7 = new System.Windows.Forms.Label();
            this.txtnventa = new MundoMusical.CUSTOM_CONTROLS.TXTBOXOnlyRead();
            this.label6 = new System.Windows.Forms.Label();
            this.panellinea = new System.Windows.Forms.Panel();
            this.panel2 = new System.Windows.Forms.Panel();
            this.dgvdesglose = new MundoMusical.CUSTOM_CONTROLS.DGVCustom();
            this.pbox2 = new System.Windows.Forms.PictureBox();
            this.gboxconsulta2 = new System.Windows.Forms.GroupBox();
            this.label11 = new System.Windows.Forms.Label();
            this.txtnumticket = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.txtidventa2 = new System.Windows.Forms.TextBox();
            this.txtmonto = new MundoMusical.CUSTOM_CONTROLS.TXTBOXOnlyRead();
            this.lbluno = new System.Windows.Forms.Label();
            this.lbl2 = new System.Windows.Forms.Label();
            this.txtnumero = new MundoMusical.CUSTOM_CONTROLS.TXTBOXOnlyRead();
            this.tabconsultas.SuspendLayout();
            this.tp1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pbox)).BeginInit();
            this.gb1.SuspendLayout();
            this.tabdesglose.SuspendLayout();
            this.gboxdatosventa.SuspendLayout();
            this.panel2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvdesglose)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbox2)).BeginInit();
            this.gboxconsulta2.SuspendLayout();
            this.SuspendLayout();
            // 
            // tabconsultas
            // 
            this.tabconsultas.Controls.Add(this.tabdesglose);
            this.tabconsultas.Location = new System.Drawing.Point(0, 0);
            this.tabconsultas.Size = new System.Drawing.Size(1130, 481);
            this.tabconsultas.TabStop = false;
            this.tabconsultas.Controls.SetChildIndex(this.tabdesglose, 0);
            this.tabconsultas.Controls.SetChildIndex(this.tp1, 0);
            // 
            // tp1
            // 
            this.tp1.Controls.Add(this.txtnumero);
            this.tp1.Controls.Add(this.lbl2);
            this.tp1.Controls.Add(this.lbluno);
            this.tp1.Controls.Add(this.txtmonto);
            this.tp1.Size = new System.Drawing.Size(1122, 447);
            this.tp1.Text = ">>Consultar Ventas";
            this.tp1.Controls.SetChildIndex(this.gb1, 0);
            this.tp1.Controls.SetChildIndex(this.panel1, 0);
            this.tp1.Controls.SetChildIndex(this.pbox, 0);
            this.tp1.Controls.SetChildIndex(this.btnprint, 0);
            this.tp1.Controls.SetChildIndex(this.txtmonto, 0);
            this.tp1.Controls.SetChildIndex(this.lbluno, 0);
            this.tp1.Controls.SetChildIndex(this.lbl2, 0);
            this.tp1.Controls.SetChildIndex(this.txtnumero, 0);
            // 
            // btnprint
            // 
            this.btnprint.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(224)))), ((int)(((byte)(224)))), ((int)(((byte)(224)))));
            this.btnprint.FlatAppearance.BorderSize = 0;
            this.btnprint.FlatAppearance.MouseDownBackColor = System.Drawing.Color.Transparent;
            this.btnprint.FlatAppearance.MouseOverBackColor = System.Drawing.Color.Transparent;
            this.btnprint.Location = new System.Drawing.Point(827, 24);
            this.btnprint.TabStop = false;
            this.toolTip1.SetToolTip(this.btnprint, "Imprimir");
            this.btnprint.Click += new System.EventHandler(this.btnprint_Click);
            // 
            // pbox
            // 
            this.pbox.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("pbox.BackgroundImage")));
            this.pbox.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.pbox.Location = new System.Drawing.Point(520, 6);
            // 
            // panel1
            // 
            this.panel1.Location = new System.Drawing.Point(6, 243);
            this.panel1.Size = new System.Drawing.Size(1110, 196);
            // 
            // gb1
            // 
            this.gb1.Controls.Add(this.button1);
            this.gb1.Controls.Add(this.cbidcliente);
            this.gb1.Controls.Add(this.label4);
            this.gb1.Controls.Add(this.cbstatus);
            this.gb1.Controls.Add(this.label2);
            this.gb1.Controls.Add(this.label1);
            this.gb1.Controls.Add(this.dtpfecha);
            this.gb1.Controls.Add(this.label3);
            this.gb1.Controls.Add(this.txtnumeroventa);
            this.gb1.Location = new System.Drawing.Point(240, 84);
            this.gb1.Size = new System.Drawing.Size(643, 144);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Times New Roman", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.ForeColor = System.Drawing.Color.Black;
            this.label3.Location = new System.Drawing.Point(79, 27);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(122, 17);
            this.label3.TabIndex = 11;
            this.label3.Text = "Numero de Venta";
            // 
            // txtnumeroventa
            // 
            this.txtnumeroventa.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.txtnumeroventa.Location = new System.Drawing.Point(57, 47);
            this.txtnumeroventa.MaxLength = 9;
            this.txtnumeroventa.Name = "txtnumeroventa";
            this.txtnumeroventa.Size = new System.Drawing.Size(163, 26);
            this.txtnumeroventa.TabIndex = 10;
            // 
            // dtpfecha
            // 
            this.dtpfecha.CalendarMonthBackground = System.Drawing.SystemColors.GradientInactiveCaption;
            this.dtpfecha.CustomFormat = "";
            this.dtpfecha.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpfecha.Location = new System.Drawing.Point(246, 47);
            this.dtpfecha.Name = "dtpfecha";
            this.dtpfecha.Size = new System.Drawing.Size(146, 26);
            this.dtpfecha.TabIndex = 55;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Times New Roman", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.Black;
            this.label1.Location = new System.Drawing.Point(267, 27);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(108, 17);
            this.label1.TabIndex = 56;
            this.label1.Text = "Fecha de Venta";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Times New Roman", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.ForeColor = System.Drawing.Color.Black;
            this.label2.Location = new System.Drawing.Point(277, 90);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(56, 17);
            this.label2.TabIndex = 58;
            this.label2.Text = "Cliente";
            // 
            // cbstatus
            // 
            this.cbstatus.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbstatus.FormattingEnabled = true;
            this.cbstatus.Location = new System.Drawing.Point(412, 46);
            this.cbstatus.Name = "cbstatus";
            this.cbstatus.Size = new System.Drawing.Size(180, 27);
            this.cbstatus.TabIndex = 59;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Times New Roman", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.ForeColor = System.Drawing.Color.Black;
            this.label4.Location = new System.Drawing.Point(448, 26);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(109, 17);
            this.label4.TabIndex = 60;
            this.label4.Text = "Status de Venta";
            // 
            // button1
            // 
            this.button1.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("button1.BackgroundImage")));
            this.button1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.button1.Cursor = System.Windows.Forms.Cursors.Hand;
            this.button1.FlatAppearance.BorderColor = System.Drawing.Color.Silver;
            this.button1.FlatAppearance.BorderSize = 0;
            this.button1.FlatAppearance.MouseDownBackColor = System.Drawing.Color.Transparent;
            this.button1.FlatAppearance.MouseOverBackColor = System.Drawing.Color.Transparent;
            this.button1.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.button1.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button1.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(224)))), ((int)(((byte)(224)))), ((int)(((byte)(224)))));
            this.button1.Location = new System.Drawing.Point(515, 84);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(56, 54);
            this.button1.TabIndex = 62;
            this.toolTip1.SetToolTip(this.button1, "Buscar Cliente");
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // button2
            // 
            this.button2.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("button2.BackgroundImage")));
            this.button2.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.button2.Cursor = System.Windows.Forms.Cursors.Hand;
            this.button2.FlatAppearance.BorderColor = System.Drawing.Color.Silver;
            this.button2.FlatAppearance.BorderSize = 0;
            this.button2.FlatAppearance.MouseDownBackColor = System.Drawing.Color.Transparent;
            this.button2.FlatAppearance.MouseOverBackColor = System.Drawing.Color.Transparent;
            this.button2.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.button2.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button2.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(224)))), ((int)(((byte)(224)))), ((int)(((byte)(224)))));
            this.button2.Location = new System.Drawing.Point(429, 34);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(37, 34);
            this.button2.TabIndex = 63;
            this.toolTip1.SetToolTip(this.button2, "Buscar Venta (Enter)");
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // btnprintDesglose
            // 
            this.btnprintDesglose.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("btnprintDesglose.BackgroundImage")));
            this.btnprintDesglose.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.btnprintDesglose.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnprintDesglose.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(224)))), ((int)(((byte)(224)))), ((int)(((byte)(224)))));
            this.btnprintDesglose.FlatAppearance.BorderSize = 0;
            this.btnprintDesglose.FlatAppearance.MouseDownBackColor = System.Drawing.Color.Transparent;
            this.btnprintDesglose.FlatAppearance.MouseOverBackColor = System.Drawing.Color.Transparent;
            this.btnprintDesglose.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnprintDesglose.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnprintDesglose.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(224)))), ((int)(((byte)(224)))), ((int)(((byte)(224)))));
            this.btnprintDesglose.Location = new System.Drawing.Point(732, 24);
            this.btnprintDesglose.Name = "btnprintDesglose";
            this.btnprintDesglose.Size = new System.Drawing.Size(56, 54);
            this.btnprintDesglose.TabIndex = 67;
            this.toolTip1.SetToolTip(this.btnprintDesglose, "Imprimir Ticket de Venta");
            this.btnprintDesglose.UseVisualStyleBackColor = true;
            this.btnprintDesglose.Click += new System.EventHandler(this.btnprintDesglose_Click);
            // 
            // btnprevia
            // 
            this.btnprevia.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("btnprevia.BackgroundImage")));
            this.btnprevia.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.btnprevia.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnprevia.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(224)))), ((int)(((byte)(224)))), ((int)(((byte)(224)))));
            this.btnprevia.FlatAppearance.BorderSize = 0;
            this.btnprevia.FlatAppearance.MouseDownBackColor = System.Drawing.Color.Transparent;
            this.btnprevia.FlatAppearance.MouseOverBackColor = System.Drawing.Color.Transparent;
            this.btnprevia.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnprevia.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnprevia.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(224)))), ((int)(((byte)(224)))), ((int)(((byte)(224)))));
            this.btnprevia.Location = new System.Drawing.Point(670, 24);
            this.btnprevia.Name = "btnprevia";
            this.btnprevia.Size = new System.Drawing.Size(56, 54);
            this.btnprevia.TabIndex = 68;
            this.toolTip1.SetToolTip(this.btnprevia, "Vista Previa");
            this.btnprevia.UseVisualStyleBackColor = true;
            this.btnprevia.Click += new System.EventHandler(this.button3_Click);
            // 
            // button3
            // 
            this.button3.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("button3.BackgroundImage")));
            this.button3.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.button3.Cursor = System.Windows.Forms.Cursors.Hand;
            this.button3.FlatAppearance.BorderColor = System.Drawing.Color.Silver;
            this.button3.FlatAppearance.BorderSize = 0;
            this.button3.FlatAppearance.MouseDownBackColor = System.Drawing.Color.Transparent;
            this.button3.FlatAppearance.MouseOverBackColor = System.Drawing.Color.Transparent;
            this.button3.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.button3.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button3.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(224)))), ((int)(((byte)(224)))), ((int)(((byte)(224)))));
            this.button3.Location = new System.Drawing.Point(199, 34);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(37, 34);
            this.button3.TabIndex = 66;
            this.toolTip1.SetToolTip(this.button3, "Buscar Venta (Enter)");
            this.button3.UseVisualStyleBackColor = true;
            this.button3.Click += new System.EventHandler(this.button3_Click_1);
            // 
            // cbidcliente
            // 
            this.cbidcliente.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbidcliente.FormattingEnabled = true;
            this.cbidcliente.Location = new System.Drawing.Point(71, 110);
            this.cbidcliente.Name = "cbidcliente";
            this.cbidcliente.Size = new System.Drawing.Size(438, 27);
            this.cbidcliente.TabIndex = 61;
            // 
            // tabdesglose
            // 
            this.tabdesglose.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(224)))), ((int)(((byte)(224)))), ((int)(((byte)(224)))));
            this.tabdesglose.Controls.Add(this.btnprevia);
            this.tabdesglose.Controls.Add(this.btnprintDesglose);
            this.tabdesglose.Controls.Add(this.gboxdatosventa);
            this.tabdesglose.Controls.Add(this.panellinea);
            this.tabdesglose.Controls.Add(this.panel2);
            this.tabdesglose.Controls.Add(this.pbox2);
            this.tabdesglose.Controls.Add(this.gboxconsulta2);
            this.tabdesglose.Location = new System.Drawing.Point(4, 30);
            this.tabdesglose.Name = "tabdesglose";
            this.tabdesglose.Padding = new System.Windows.Forms.Padding(3);
            this.tabdesglose.Size = new System.Drawing.Size(1122, 447);
            this.tabdesglose.TabIndex = 1;
            this.tabdesglose.Text = ">>Desglose de Venta";
            // 
            // gboxdatosventa
            // 
            this.gboxdatosventa.BackColor = System.Drawing.Color.Silver;
            this.gboxdatosventa.Controls.Add(this.txtdescextra);
            this.gboxdatosventa.Controls.Add(this.label10);
            this.gboxdatosventa.Controls.Add(this.txttotal);
            this.gboxdatosventa.Controls.Add(this.label9);
            this.gboxdatosventa.Controls.Add(this.txtiva);
            this.gboxdatosventa.Controls.Add(this.label8);
            this.gboxdatosventa.Controls.Add(this.txtsubtotal);
            this.gboxdatosventa.Controls.Add(this.label7);
            this.gboxdatosventa.Controls.Add(this.txtnventa);
            this.gboxdatosventa.Controls.Add(this.label6);
            this.gboxdatosventa.Font = new System.Drawing.Font("Consolas", 11.25F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.gboxdatosventa.ForeColor = System.Drawing.Color.Brown;
            this.gboxdatosventa.Location = new System.Drawing.Point(8, 184);
            this.gboxdatosventa.Name = "gboxdatosventa";
            this.gboxdatosventa.Size = new System.Drawing.Size(1106, 53);
            this.gboxdatosventa.TabIndex = 66;
            this.gboxdatosventa.TabStop = false;
            // 
            // txtdescextra
            // 
            this.txtdescextra.BackColor = System.Drawing.Color.Silver;
            this.txtdescextra.Cursor = System.Windows.Forms.Cursors.Arrow;
            this.txtdescextra.Font = new System.Drawing.Font("Consolas", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtdescextra.Location = new System.Drawing.Point(977, 14);
            this.txtdescextra.Name = "txtdescextra";
            this.txtdescextra.ReadOnly = true;
            this.txtdescextra.Size = new System.Drawing.Size(123, 25);
            this.txtdescextra.TabIndex = 74;
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Font = new System.Drawing.Font("Consolas", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label10.ForeColor = System.Drawing.Color.Red;
            this.label10.Location = new System.Drawing.Point(835, 18);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(136, 18);
            this.label10.TabIndex = 73;
            this.label10.Text = "Descuento Extra:";
            // 
            // txttotal
            // 
            this.txttotal.BackColor = System.Drawing.Color.Silver;
            this.txttotal.Cursor = System.Windows.Forms.Cursors.Arrow;
            this.txttotal.Font = new System.Drawing.Font("Consolas", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txttotal.Location = new System.Drawing.Point(699, 14);
            this.txttotal.Name = "txttotal";
            this.txttotal.ReadOnly = true;
            this.txttotal.Size = new System.Drawing.Size(136, 25);
            this.txttotal.TabIndex = 72;
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Font = new System.Drawing.Font("Consolas", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label9.ForeColor = System.Drawing.Color.Blue;
            this.label9.Location = new System.Drawing.Point(637, 17);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(56, 18);
            this.label9.TabIndex = 71;
            this.label9.Text = "Total:";
            // 
            // txtiva
            // 
            this.txtiva.BackColor = System.Drawing.Color.Silver;
            this.txtiva.Cursor = System.Windows.Forms.Cursors.Arrow;
            this.txtiva.Font = new System.Drawing.Font("Consolas", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtiva.Location = new System.Drawing.Point(531, 13);
            this.txtiva.Name = "txtiva";
            this.txtiva.ReadOnly = true;
            this.txtiva.Size = new System.Drawing.Size(100, 25);
            this.txtiva.TabIndex = 70;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Font = new System.Drawing.Font("Consolas", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label8.ForeColor = System.Drawing.Color.Blue;
            this.label8.Location = new System.Drawing.Point(469, 20);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(56, 18);
            this.label8.TabIndex = 69;
            this.label8.Text = "I.V.A:";
            // 
            // txtsubtotal
            // 
            this.txtsubtotal.BackColor = System.Drawing.Color.Silver;
            this.txtsubtotal.Cursor = System.Windows.Forms.Cursors.Arrow;
            this.txtsubtotal.Font = new System.Drawing.Font("Consolas", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtsubtotal.Location = new System.Drawing.Point(330, 13);
            this.txtsubtotal.Name = "txtsubtotal";
            this.txtsubtotal.ReadOnly = true;
            this.txtsubtotal.Size = new System.Drawing.Size(133, 25);
            this.txtsubtotal.TabIndex = 68;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("Consolas", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label7.ForeColor = System.Drawing.Color.Blue;
            this.label7.Location = new System.Drawing.Point(244, 21);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(80, 18);
            this.label7.TabIndex = 67;
            this.label7.Text = "Subtotal:";
            // 
            // txtnventa
            // 
            this.txtnventa.BackColor = System.Drawing.Color.Silver;
            this.txtnventa.Cursor = System.Windows.Forms.Cursors.Arrow;
            this.txtnventa.Font = new System.Drawing.Font("Consolas", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtnventa.Location = new System.Drawing.Point(143, 14);
            this.txtnventa.Name = "txtnventa";
            this.txtnventa.ReadOnly = true;
            this.txtnventa.Size = new System.Drawing.Size(100, 25);
            this.txtnventa.TabIndex = 66;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Consolas", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.ForeColor = System.Drawing.Color.Red;
            this.label6.Location = new System.Drawing.Point(6, 20);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(136, 18);
            this.label6.TabIndex = 65;
            this.label6.Text = "Numero de Venta:";
            // 
            // panellinea
            // 
            this.panellinea.BackColor = System.Drawing.SystemColors.WindowFrame;
            this.panellinea.Location = new System.Drawing.Point(0, 168);
            this.panellinea.Name = "panellinea";
            this.panellinea.Size = new System.Drawing.Size(1121, 10);
            this.panellinea.TabIndex = 65;
            // 
            // panel2
            // 
            this.panel2.BackColor = System.Drawing.Color.Silver;
            this.panel2.Controls.Add(this.dgvdesglose);
            this.panel2.Location = new System.Drawing.Point(8, 243);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(1106, 196);
            this.panel2.TabIndex = 54;
            // 
            // dgvdesglose
            // 
            this.dgvdesglose.AllowUserToAddRows = false;
            this.dgvdesglose.AllowUserToResizeColumns = false;
            this.dgvdesglose.AllowUserToResizeRows = false;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle1.BackColor = System.Drawing.Color.WhiteSmoke;
            this.dgvdesglose.AlternatingRowsDefaultCellStyle = dataGridViewCellStyle1;
            this.dgvdesglose.BackgroundColor = System.Drawing.Color.Silver;
            this.dgvdesglose.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.dgvdesglose.ColumnHeadersBorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.Sunken;
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle2.BackColor = System.Drawing.Color.LightSkyBlue;
            dataGridViewCellStyle2.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold);
            dataGridViewCellStyle2.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle2.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle2.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvdesglose.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle2;
            this.dgvdesglose.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle3.BackColor = System.Drawing.Color.Gainsboro;
            dataGridViewCellStyle3.Font = new System.Drawing.Font("Times New Roman", 12F);
            dataGridViewCellStyle3.ForeColor = System.Drawing.Color.Black;
            dataGridViewCellStyle3.SelectionBackColor = System.Drawing.Color.LightSkyBlue;
            dataGridViewCellStyle3.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle3.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.dgvdesglose.DefaultCellStyle = dataGridViewCellStyle3;
            this.dgvdesglose.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dgvdesglose.Font = new System.Drawing.Font("Times New Roman", 12F);
            this.dgvdesglose.Location = new System.Drawing.Point(0, 0);
            this.dgvdesglose.Name = "dgvdesglose";
            this.dgvdesglose.ReadOnly = true;
            this.dgvdesglose.RowHeadersVisible = false;
            this.dgvdesglose.Size = new System.Drawing.Size(1106, 196);
            this.dgvdesglose.TabIndex = 0;
            // 
            // pbox2
            // 
            this.pbox2.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("pbox2.BackgroundImage")));
            this.pbox2.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.pbox2.Location = new System.Drawing.Point(498, 6);
            this.pbox2.Name = "pbox2";
            this.pbox2.Size = new System.Drawing.Size(82, 72);
            this.pbox2.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pbox2.TabIndex = 53;
            this.pbox2.TabStop = false;
            // 
            // gboxconsulta2
            // 
            this.gboxconsulta2.BackColor = System.Drawing.Color.Silver;
            this.gboxconsulta2.Controls.Add(this.button3);
            this.gboxconsulta2.Controls.Add(this.label11);
            this.gboxconsulta2.Controls.Add(this.txtnumticket);
            this.gboxconsulta2.Controls.Add(this.button2);
            this.gboxconsulta2.Controls.Add(this.label5);
            this.gboxconsulta2.Controls.Add(this.txtidventa2);
            this.gboxconsulta2.Font = new System.Drawing.Font("Times New Roman", 12F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.gboxconsulta2.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.gboxconsulta2.Location = new System.Drawing.Point(297, 84);
            this.gboxconsulta2.Name = "gboxconsulta2";
            this.gboxconsulta2.Size = new System.Drawing.Size(491, 78);
            this.gboxconsulta2.TabIndex = 7;
            this.gboxconsulta2.TabStop = false;
            this.gboxconsulta2.Text = "No. Venta";
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Font = new System.Drawing.Font("Times New Roman", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label11.ForeColor = System.Drawing.Color.Black;
            this.label11.Location = new System.Drawing.Point(283, 22);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(128, 17);
            this.label11.TabIndex = 65;
            this.label11.Text = "Numero de Ticket";
            // 
            // txtnumticket
            // 
            this.txtnumticket.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.txtnumticket.Location = new System.Drawing.Point(261, 42);
            this.txtnumticket.MaxLength = 9;
            this.txtnumticket.Name = "txtnumticket";
            this.txtnumticket.Size = new System.Drawing.Size(163, 26);
            this.txtnumticket.TabIndex = 64;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Times New Roman", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.ForeColor = System.Drawing.Color.Black;
            this.label5.Location = new System.Drawing.Point(52, 22);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(122, 17);
            this.label5.TabIndex = 13;
            this.label5.Text = "Numero de Venta";
            // 
            // txtidventa2
            // 
            this.txtidventa2.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.txtidventa2.Location = new System.Drawing.Point(30, 42);
            this.txtidventa2.MaxLength = 9;
            this.txtidventa2.Name = "txtidventa2";
            this.txtidventa2.Size = new System.Drawing.Size(163, 26);
            this.txtidventa2.TabIndex = 12;
            this.txtidventa2.TextChanged += new System.EventHandler(this.txtidventa2_TextChanged);
            // 
            // txtmonto
            // 
            this.txtmonto.Cursor = System.Windows.Forms.Cursors.Arrow;
            this.txtmonto.Location = new System.Drawing.Point(8, 203);
            this.txtmonto.Name = "txtmonto";
            this.txtmonto.ReadOnly = true;
            this.txtmonto.Size = new System.Drawing.Size(227, 25);
            this.txtmonto.TabIndex = 54;
            // 
            // lbluno
            // 
            this.lbluno.AutoSize = true;
            this.lbluno.Font = new System.Drawing.Font("Times New Roman", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbluno.ForeColor = System.Drawing.Color.Blue;
            this.lbluno.Location = new System.Drawing.Point(49, 174);
            this.lbluno.Name = "lbluno";
            this.lbluno.Size = new System.Drawing.Size(134, 17);
            this.lbluno.TabIndex = 63;
            this.lbluno.Text = ">Monto en Ventas:";
            // 
            // lbl2
            // 
            this.lbl2.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.lbl2.AutoSize = true;
            this.lbl2.Font = new System.Drawing.Font("Times New Roman", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbl2.ForeColor = System.Drawing.Color.Blue;
            this.lbl2.Location = new System.Drawing.Point(926, 174);
            this.lbl2.Name = "lbl2";
            this.lbl2.Size = new System.Drawing.Size(143, 17);
            this.lbl2.TabIndex = 64;
            this.lbl2.Text = ">Numero de Ventas:";
            // 
            // txtnumero
            // 
            this.txtnumero.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.txtnumero.Cursor = System.Windows.Forms.Cursors.Arrow;
            this.txtnumero.Location = new System.Drawing.Point(887, 203);
            this.txtnumero.Name = "txtnumero";
            this.txtnumero.ReadOnly = true;
            this.txtnumero.Size = new System.Drawing.Size(227, 25);
            this.txtnumero.TabIndex = 65;
            // 
            // consulta_ventas
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1130, 481);
            this.Name = "consulta_ventas";
            this.Text = "consulta_ventas";
            this.Load += new System.EventHandler(this.consulta_ventas_Load);
            this.tabconsultas.ResumeLayout(false);
            this.tp1.ResumeLayout(false);
            this.tp1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pbox)).EndInit();
            this.gb1.ResumeLayout(false);
            this.gb1.PerformLayout();
            this.tabdesglose.ResumeLayout(false);
            this.gboxdatosventa.ResumeLayout(false);
            this.gboxdatosventa.PerformLayout();
            this.panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgvdesglose)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbox2)).EndInit();
            this.gboxconsulta2.ResumeLayout(false);
            this.gboxconsulta2.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Label label3;
        protected System.Windows.Forms.TextBox txtnumeroventa;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.DateTimePicker dtpfecha;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.ComboBox cbstatus;
        private System.Windows.Forms.ToolTip toolTip1;
        protected System.Windows.Forms.Button button1;
        public System.Windows.Forms.ComboBox cbidcliente;
        private System.Windows.Forms.TabPage tabdesglose;
        public System.Windows.Forms.GroupBox gboxconsulta2;
        protected System.Windows.Forms.PictureBox pbox2;
        private System.Windows.Forms.Label label5;
        protected System.Windows.Forms.TextBox txtidventa2;
        private System.Windows.Forms.Panel panel2;
        private CUSTOM_CONTROLS.DGVCustom dgvdesglose;
        private System.Windows.Forms.Panel panellinea;
        protected System.Windows.Forms.Button button2;
        private System.Windows.Forms.GroupBox gboxdatosventa;
        private CUSTOM_CONTROLS.TXTBOXOnlyRead txtdescextra;
        private System.Windows.Forms.Label label10;
        private CUSTOM_CONTROLS.TXTBOXOnlyRead txttotal;
        private System.Windows.Forms.Label label9;
        private CUSTOM_CONTROLS.TXTBOXOnlyRead txtiva;
        private System.Windows.Forms.Label label8;
        private CUSTOM_CONTROLS.TXTBOXOnlyRead txtsubtotal;
        private System.Windows.Forms.Label label7;
        private CUSTOM_CONTROLS.TXTBOXOnlyRead txtnventa;
        private System.Windows.Forms.Label label6;
        protected System.Windows.Forms.Button btnprintDesglose;
        protected System.Windows.Forms.Button btnprevia;
        protected System.Windows.Forms.Button button3;
        private System.Windows.Forms.Label label11;
        protected System.Windows.Forms.TextBox txtnumticket;
        private CUSTOM_CONTROLS.TXTBOXOnlyRead txtnumero;
        private System.Windows.Forms.Label lbl2;
        private System.Windows.Forms.Label lbluno;
        private CUSTOM_CONTROLS.TXTBOXOnlyRead txtmonto;
    }
}