﻿using AAB_Furniture_Rentals.Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AAB_Furniture_Rentals.DAL
{
    class MembersDAL
    {
        /// <summary>
        /// Gets the member with a designated memberID.
        /// </summary>
        /// <param name="customerID"></param>
        /// <returns></returns>
        public Member GetCustomerByID(int customerID)
        {

            string selectStatement =
              "SELECT memberID, fName, lName, sex, dob, address, phone " +
              "FROM Member " +
              "WHERE memberID = @customerID ";


            using (SqlConnection connection = RentMeDBConnection.GetConnection())
            {
                Member currentMember = new Member();
                connection.Open();
                using (SqlCommand selectCommand = new SqlCommand(selectStatement, connection))

                {

                    selectCommand.Parameters.AddWithValue("@customerID", customerID);
                    selectCommand.Parameters["@customerID"].Value = customerID;
                    using (SqlDataReader reader = selectCommand.ExecuteReader())
                    {


                        while (reader.Read())
                        {
                            currentMember.MemberID = (int)reader["memberID"];
                            currentMember.FirstName = reader["fname"].ToString();
                            currentMember.LastName = reader["lname"].ToString();
                            currentMember.Gender = Convert.ToChar(reader["sex"]);
                            currentMember.DateOfBirth = (DateTime)reader["dob"];
                            currentMember.Address = reader["address"].ToString();
                            currentMember.PhoneNumber = reader["phone"].ToString();

                        }
                        
                    }

                }


                return currentMember;

            }
        }
        /// <summary>
        /// Edits a member with a designated memberID.
        /// </summary>
        /// <param name="customer"></param>
        public void EditCustomer(Member customer)
        {

            string query = "UPDATE Member " +
                "SET fName=@firstName, lname=@lastName, sex=@gender, dob=@dateOfBirth, address=@address, phone=@phoneNumber  " +
                "WHERE memberID=@memberID ";

            using (SqlConnection connection = RentMeDBConnection.GetConnection())
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(query, connection))

                {

                    command.Parameters.AddWithValue("@firstName", customer.FirstName);
                    command.Parameters["@firstName"].Value = customer.FirstName;

                    command.Parameters.AddWithValue("@lastName", customer.LastName);
                    command.Parameters["@lastName"].Value = customer.LastName;

                    command.Parameters.AddWithValue("@gender", customer.Gender);
                    command.Parameters["@gender"].Value = customer.Gender;

                    command.Parameters.AddWithValue("@dateOfBirth", customer.DateOfBirth);
                    command.Parameters["@dateOfBirth"].Value = customer.DateOfBirth;

                    command.Parameters.AddWithValue("@address", customer.Address);
                    command.Parameters["@address"].Value = customer.Address;

                    command.Parameters.AddWithValue("@phoneNumber", customer.PhoneNumber);
                    command.Parameters["@phoneNumber"].Value = customer.PhoneNumber;

                    command.Parameters.AddWithValue("@memberID", customer.MemberID);
                    command.Parameters["@memberID"].Value = customer.MemberID;

                    command.ExecuteScalar();
                   

                }
            }
        }
        /// <summary>
        /// Adds a new member to the database.
        /// </summary>
        /// <param name="customer"></param>
        public void AddCustomer(Member customer)
        {

            string query = "INSERT INTO " +
                "Member (fName, lName, sex, dob, address, phone) " +
                "VALUES(@firstName, @lastName, @gender, @dateOfBirth, @address, @phoneNumber)";

            using (SqlConnection connection = RentMeDBConnection.GetConnection())
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(query, connection))

                {
           
                    command.Parameters.AddWithValue("@firstName", customer.FirstName);
                   
                    command.Parameters.AddWithValue("@lastName", customer.LastName);
               
                    command.Parameters.AddWithValue("@gender", customer.Gender);
         
                    command.Parameters.AddWithValue("@dateOfBirth", customer.DateOfBirth);
            
                    command.Parameters.AddWithValue("@address", customer.Address);
                 
                    command.Parameters.AddWithValue("@phoneNumber", customer.PhoneNumber);

                    command.ExecuteScalar();
                   

                }
            }

        }
        /// <summary>
        /// Returns a list of all members in the database.
        /// </summary>
        /// <returns></returns>
        public List<Member> GetAllMembers() {
            List<Member> allMembers = new List<Member>();
            string query = "SELECT  memberID, fName, lName, sex, dob, address, phone " +
                "FROM Member ";


            using (SqlConnection connection = RentMeDBConnection.GetConnection())
            {

                connection.Open();
                using (SqlCommand selectCommand = new SqlCommand(query, connection))

                {

                    using (SqlDataReader reader = selectCommand.ExecuteReader())
                    {

                        while (reader.Read())
                        {
                            Member currentMember = new Member();
                            currentMember.MemberID = (int)reader["memberID"];
                            currentMember.FirstName = reader["fname"].ToString();
                            currentMember.LastName = reader["lname"].ToString();
                            currentMember.Gender = Convert.ToChar(reader["sex"]);
                            currentMember.DateOfBirth = (DateTime)reader["dob"];
                            currentMember.Address = reader["address"].ToString();
                            currentMember.PhoneNumber = reader["phone"].ToString();
                            allMembers.Add(currentMember);

                        }
                    }
                }
            }
            return allMembers;
        }
        /// <summary>
        /// Checks to see if a designated memberID exists in the database.
        /// </summary>
        /// <param name="customerID"></param>
        /// <returns></returns>
        public int CheckCustomerID(int customerID)
        {

            string selectStatement =
              "SELECT COUNT(*) FROM Member " +
              "WHERE MemberID=@customerID ";

            using (SqlConnection connection = RentMeDBConnection.GetConnection())
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(selectStatement, connection))

                {

                    command.Parameters.AddWithValue("@customerID", customerID);
                    command.Parameters["@customerID"].Value = customerID;


                    int count = Convert.ToInt32(command.ExecuteScalar());
                    if (count == 0)
                    {
                        throw new Exception("There is no customer with that ID.");
                    }
                    return count;
                }

            }

        }
    }
}