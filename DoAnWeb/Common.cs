using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DoAnWeb.Models;

namespace DoAnWeb
{
    public class Common
    {
        public static List<Answer> GetAnswers()
        {
            List<Answer> list = new List<Answer>();
            list.Add(new Answer() { Id = 1, Name = "Rất hài lòng", Css = "check w3" });
            list.Add(new Answer() { Id = 2, Name = "Hài lòng", Css = "check w3ls" });
            list.Add(new Answer() { Id = 3, Name = "Chưa hài lòng", Css = "check wthree" });
            list.Add(new Answer() { Id = 4, Name = "Rất tệ", Css = "check w3_agileits" });
            return list;
        }

    }
}