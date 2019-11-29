using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SklepInternetowy
{
    public class User
    {
        public string username { get; set; }
        public string salt { get; set; }
        public string hash { get; set; }
        public bool admin { get; set; }

        public User(string username, string salt, string hash, bool admin)
        {
            this.username = username;
            this.salt = salt;
            this.hash = hash;
            this.admin = admin;
        }
    }
}