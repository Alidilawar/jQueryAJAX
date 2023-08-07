using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Ajax
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        static string cs = ConfigurationManager.ConnectionStrings["dbms"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static string Getdata(string UName, string SName)
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "Insert into Person Values(@UName, @SName)";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@UName", UName);
            cmd.Parameters.AddWithValue("@SName", SName);
            con.Open();
            int a = cmd.ExecuteNonQuery();
            con.Close();
            if (a > 0)
            {
                Thread.Sleep(3000);
                return "Record Has Been Inserted Successfully";
            }
            else
            {
                return "Record Insertion Failed";
            }
            //Thread.Sleep(3000);
            //return "Your name is: " + UName + " and your SurName is: " + SName;
        } 
    }
}