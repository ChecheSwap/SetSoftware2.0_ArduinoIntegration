namespace MundoMusical.CATEGORY
{
    partial class updateCategory
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
            this.gb2 = new System.Windows.Forms.GroupBox();
            this.button1 = new System.Windows.Forms.Button();
            this.start = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
           // this.toolTipBASE = new System.Windows.Forms.ToolTip(this.components);
            this.gb.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox)).BeginInit();
            this.gb2.SuspendLayout();
            this.SuspendLayout();
            // 
            // label3
            // 
            this.label3.Size = new System.Drawing.Size(141, 13);
            this.label3.Text = "(Presione F1 para actualizar)";
            // 
            // baccept
            // 
            this.baccept.Text = "Actualizar";
            // 
            // gb2
            // 
            this.gb2.BackColor = System.Drawing.Color.AliceBlue;
            this.gb2.Controls.Add(this.button1);
            this.gb2.Controls.Add(this.start);
            this.gb2.Controls.Add(this.label4);
            this.gb2.FlatStyle = System.Windows.Forms.FlatStyle.System;
            this.gb2.Location = new System.Drawing.Point(73, 158);
            this.gb2.Name = "gb2";
            this.gb2.Size = new System.Drawing.Size(318, 80);
            this.gb2.TabIndex = 34;
            this.gb2.TabStop = false;
            // 
            // button1
            // 
            this.button1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(224)))), ((int)(((byte)(224)))), ((int)(((byte)(224)))));
            this.button1.Cursor = System.Windows.Forms.Cursors.Hand;
            this.button1.Location = new System.Drawing.Point(256, 47);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(17, 20);
            this.button1.TabIndex = 2;
            this.button1.Text = "C";
            //this.toolTipBASE.SetToolTip(this.button1, "Limpiar");
            this.button1.UseVisualStyleBackColor = false;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // start
            // 
            this.start.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(192)))), ((int)(((byte)(192)))));
            this.start.Location = new System.Drawing.Point(67, 47);
            this.start.Name = "start";
            this.start.Size = new System.Drawing.Size(183, 20);
            this.start.TabIndex = 1;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(64, 16);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(186, 16);
            this.label4.TabIndex = 0;
            this.label4.Text = "Ingrese Nombre de Categoria";
            // 
            // updateCategory
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(460, 424);
            this.Controls.Add(this.gb2);
            this.Name = "updateCategory";
            this.Text = "updateCategory";
            this.Load += new System.EventHandler(this.updateCategory_Load);
            this.Controls.SetChildIndex(this.pictureBox, 0);
            this.Controls.SetChildIndex(this.gb, 0);
            this.Controls.SetChildIndex(this.baccept, 0);
            this.Controls.SetChildIndex(this.bcancel, 0);
            this.Controls.SetChildIndex(this.gb2, 0);
            this.gb.ResumeLayout(false);
            this.gb.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox)).EndInit();
            this.gb2.ResumeLayout(false);
            this.gb2.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.Label label4;        
        protected System.Windows.Forms.TextBox start;
        protected System.Windows.Forms.Button button1;
        protected System.Windows.Forms.GroupBox gb2;
    }
}