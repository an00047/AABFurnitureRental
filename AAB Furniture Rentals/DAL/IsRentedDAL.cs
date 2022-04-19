﻿using AAB_Furniture_Rentals.Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace AAB_Furniture_Rentals.DAL
{
    /// <summary>
    /// isRented handler
    /// </summary>
    class IsRentedDAL
    {
        /// <summary>
        /// Gets the is rented by member identifier.
        /// </summary>
        /// <param name="newMemberID">The new member identifier.</param>
        /// <returns>The list of IsRented items with the matching memberID</returns>
        public List<IsRented> GetIsRentedByMemberID(int newMemberID)
        {
            List<IsRented> rentals = new List<IsRented>();
            string selectStatement = @"SELECT * FROM is_rented
                                        JOIN rentals ON is_rented.transactionID = rentals.rentalTransactionID
                                        WHERE rentals.memberID = @memberID
                                        ORDER BY is_rented.transactionID";
            using (SqlConnection connection = RentMeDBConnection.GetConnection())
            {
                connection.Open();
                using (SqlCommand selectCommand = new SqlCommand(selectStatement, connection))
                {
                    selectCommand.Parameters.AddWithValue("@memberID", newMemberID);
                    using (SqlDataReader reader = selectCommand.ExecuteReader())
                    {
                        var quantityOut = reader.GetOrdinal("quantityOut");
                        var transactionID = reader.GetOrdinal("transactionID");
                        var furnitureID = reader.GetOrdinal("furnitureID");


                        while (reader.Read())
                        {
                            int _quantityOut = Convert.ToInt32(reader.GetValue(quantityOut));
                            int _transactionID = reader.GetInt32(transactionID);
                            int _furnitureID = reader.GetInt32(furnitureID);


                            IsRented newIsRented = new IsRented(
                                 quantityOut: _quantityOut,
                                 transactionID: _transactionID,
                                 furnitureID: _furnitureID
                                ); 
                            rentals.Add(newIsRented);
                        }
                    }
                }
            }

            return rentals;
        }
    }
}
