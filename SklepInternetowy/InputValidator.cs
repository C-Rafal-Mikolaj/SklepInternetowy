using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SklepInternetowy
{
    public class InputValidator
    {

        public static string isValidLogin(string login, string lang)
        {
            if (login == "")
            {
                if (lang == "eng")
                {
                    return "Login cannot be empty!";
                }
                return "Login nie może być pusty!";
            }
            if (login.Length > 30)
            {
                if (lang == "eng")
                {
                    return "Your login is too long!";
                }
                return "Twój login jest zbyt długi";
            }

            return null;
        }

        public static string isValidPassword(string password, string lang)
        {
            if (password == "")
            {
                if (lang == "eng")
                {
                    return "Password cannot be empty!";
                }
                return "Hasło nie może być puste!";
            }

            return null;
        }

    }
}