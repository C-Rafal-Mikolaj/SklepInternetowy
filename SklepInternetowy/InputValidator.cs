using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SklepInternetowy
{
    public class InputValidator
    {

        public static string isValidLogin(string login)
        {
            if (login == "")
            {
                return "Login nie może być pusty!";
            }
            if (login.Length > 30)
            {
                return "Twój login jest zbyt długi";
            }

            return null;
        }

        public static string isValidPassword(string password)
        {
            if (password == "")
            {
                return "Hasło nie może być puste!";
            }

            return null;
        }

    }
}