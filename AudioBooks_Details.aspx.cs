﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReaderZ_LMS
{
    public partial class AudioBooks_Details : System.Web.UI.Page
    {
        helper help = new helper();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                fillData();
            }
            catch (Exception x)
            {

            }
        }

        void fillData()
        {
            DataSet ds = help.Select("select * from tbl_audiobooks where ID = '" + Request.QueryString["ID"] + "'");

            DataList1.DataSource = ds.Tables[0];
            DataList1.DataBind();
        }

        protected void DataList1_ItemCommand1(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "cmd_download")
            {
                try
                {
                    DataSet ds = help.Select("select Audio_File,Downloads from tbl_audiobooks where ID = '" + Request.QueryString["ID"] + "'");

                    String filename = ds.Tables[0].Rows[0][0].ToString();

                    int downloads = Convert.ToInt16(ds.Tables[0].Rows[0][1].ToString());

                    downloads = downloads + 1;

                    int res = help.Execute("update tbl_audiobooks set Downloads = '" + downloads + "' where ID = '" + Request.QueryString["ID"] + "'");

                    if (res > 0)
                    {
                        Response.ContentType = "audio/mpeg";
                        Response.AppendHeader("Content-Disposition", "attachment;filename=audiobook.mp3");
                        Response.TransmitFile(Server.MapPath("~/" + filename));
                        Response.End();
                    }
                }
                catch (Exception x)
                {

                }
            }
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}