﻿using AAB_Furniture_Rentals.Model;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace AAB_Furniture_Rentals.View
{
    /// <summary>
    /// The Login Form that allows for an employee's credentials to be entered
    /// </summary>
    /// <seealso cref="System.Windows.Forms.Form" />
    public partial class LoginCredentials : Form
    {
        /// <summary>
        /// CurrentEmployee is assigned after validation; null otherwise.
        /// </summary>
       public Employee CurrentEmployee { get; set; }
        LoginSelector loginSelectorInstance;
        /// <summary>
        /// Initializes a new instance of the <see cref="LoginCredentials"/> class.
        /// </summary>
        /// <param name="selectorInstance">The selector instance.</param>
        public LoginCredentials(LoginSelector selectorInstance)
        {
            InitializeComponent();
            loginSelectorInstance = selectorInstance;
            this.LoginAsLabel.Text = selectorInstance.employeeSelection + " Login:";
           
        }

        private void LoginAsBtn_Click(object sender, EventArgs e)
        {
            try { 
                if (this.UserNameTextBox.Text.Length == 0) {
            
                } else if (this.PasswordTextBox.Text.Length == 0) {
            
                } else {
                    bool isEmployee = Controller.EmployeeController.ValidateEmployeeLogin(this.UserNameTextBox.Text, this.PasswordTextBox.Text);
                       
                    switch (this.loginSelectorInstance.employeeSelection) {
                            case "Employee":
                                if (isEmployee)
                                {

                                //Get Employee from database 
                                this.CurrentEmployee = Controller.EmployeeController.GetEmployeeByUserName(this.UserNameTextBox.Text);

                                    View.EmployeeMainDashboard adminDashboard = new View.EmployeeMainDashboard(this);
                                    // set username on agmin dashboard. 
                                    adminDashboard.Show();
                                    this.Hide();
                                }
                                else
                                {
                                    // After Failed Employee Validation, do something...
                                    MessageBox.Show("Username and/or Password incorrect", "Bad Login Credentials", MessageBoxButtons.OK);
                                }
                                break;
                            case "Admin":
                                if (isEmployee )
                                {
                               this.CurrentEmployee = Controller.EmployeeController.GetEmployeeByUserName(this.UserNameTextBox.Text);
                                //ValidateEmployeeIsAdmin
                                    if (this.CurrentEmployee.Admin) {

                                        //Get Admin name from database after login.
                                        View.AdminMainDashboard adminDashboard = new View.AdminMainDashboard(this);
                                  
                                        adminDashboard.Show();
                                        this.Hide();
                                
                                    } else {
                                        // employee IS NOT an Admin
                                        MessageBox.Show("This Employee does nto have Admin Provlidges", "Employee NOT an Admin", MessageBoxButtons.OK);
                                    }
                            
                                }
                                else
                                {
                                    // After Failed Admin Validation, do something...
                                    MessageBox.Show("Username and/or Password incorrect", "Bad Login Credentials", MessageBoxButtons.OK);
                                }
                                break;
                        }
                }
            }
            catch(Exception ex) {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK,MessageBoxIcon.Error);
            }
        }


        private void GoBack_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            this.Hide();
            this.loginSelectorInstance.Show();
        }


        /// <summary>
        /// Shows the LoginCredentials again after a logout.
        /// </summary>

        public void LogOut()
        {
            this.loginSelectorInstance.Show();
        }

        private void LoginCredentials_FormClosed(object sender, FormClosedEventArgs e)
        {

            Application.Exit();
        }

    }
}
