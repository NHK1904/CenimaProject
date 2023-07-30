using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using PRNFinalProject.Data;
using PRNFinalProject.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PRNFinalProject.Controllers
{
    public class SecurityController : Controller
    {
        private readonly CenimaDBContext context;

        public SecurityController(CenimaDBContext _context)
        {
            context = _context;
        }
        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Login(Person person)
        {
            var checklogin = context.Persons.Where(x => x.Email.Equals(person.Email) && x.Password.Equals(person.Password)).FirstOrDefault();
            if (checklogin != null)
            {
            Person account = context.Persons.FirstOrDefault(x => x.Email.Equals(person.Email) && x.Password.Equals(person.Password));
            if (account.IsActive == true)
            {
                    if (account.Type == 1)
                    {
                        HttpContext.Session.SetString("account", JsonConvert.SerializeObject(account));
                        HttpContext.Session.SetString("1", JsonConvert.SerializeObject(account));
                        return RedirectToAction("Admin", "Admin");
                    }
                    else
                    {
                        HttpContext.Session.SetString("account", JsonConvert.SerializeObject(account));
                        return RedirectToAction("Index", "Home");
                    }

            }
            else
            {
                ViewBag.Notification = "Your Account is Block";
                return View();
            }
            }
            else
            {
                ViewBag.Notification = "Wrong Email or password";
                return View();
            }
        }


        public IActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Register(Person person, String repass)
        {
            if(context.Persons.Any(x => x.Email == person.Email))
            {
                ViewBag.Notification = "This account has already existed";
                return View();
            }
            else
            {
                if (person.Password != repass)
                {
                    ViewBag.Notification = "Passwords do not match.";
                    return View();
                }

                person.IsActive = true;
                person.Type = 2;
                context.Persons.Add(person);
                context.SaveChanges();

                Person account = context.Persons.FirstOrDefault(x => x.Email.Equals(person.Email) && x.Password.Equals(person.Password));
                //HttpContext.Session.SetString("account", JsonConvert.SerializeObject(account));

                ViewData["username"] = HttpContext.Session.GetString("username");
                ViewBag.Notification = "Register successfully, go to login";
                return View();
            }
        }

        public IActionResult ChangePassword()
        {
            return View();
        }


        [HttpPost]
        public IActionResult ChangePassword(Person person, String OldPassword, String confirmPassword)
        {
            // Find the existing account based on the email provided
            var existingAccount = context.Persons.FirstOrDefault(x => x.Email == person.Email);

            if (existingAccount == null)
            {
                ViewBag.Notification = "Account not found!";
                return View();
            }

            // Check if the provided old password matches the existing account's password
            if (existingAccount.Password != OldPassword)
            {
                ViewBag.Notification = "Incorrect old password!";
                return View();
            }

            if (person.Password != confirmPassword)
            {
                ViewBag.Notification = "Passwords do not match.";
                return View();
            }
            // Update the password with the new password
            existingAccount.Password = person.Password;
            context.SaveChanges();

            ViewBag.Notification = "Password changed successfully!";
            return View();
        }

        public IActionResult Logout()
        {
            HttpContext.Session.Clear();
            return RedirectToAction("Index","Home");
        }
    }
}
