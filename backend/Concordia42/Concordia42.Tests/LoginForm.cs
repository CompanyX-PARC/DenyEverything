using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using OpenQA.Selenium;
using OpenQA.Selenium.Support;
using OpenQA.Selenium.Support.UI;
using OpenQA.Selenium.Opera;
using System.Threading;
using Concordia42.Models;

namespace Concordia42.Tests
{
    [TestClass]
    public class LoginForm
    {

        private IWebDriver driver;

        [TestInitialize]
        public void TestInitialize()
        {
            driver = new OperaDriver();
            driver.Manage().Timeouts().ImplicitlyWait(TimeSpan.FromSeconds(25));

            ApplicationDbContext db = new ApplicationDbContext();
            //db.Activities.RemoveRange(n => n);
            //db.SaveChanges();
        }
        
        [TestCleanup]
        public void TestCleanup() {
            if (driver != null)
            {
                driver.Close();
                driver.Quit();
            }
        }

        [TestMethod]
        public void TestValidStudentLogin()
        {
            driver.Navigate().GoToUrl("http://localhost:10255/Account/Login");
            Assert.AreEqual("Log in to PARC - Concordia", driver.Title);

            IWebElement userField = driver.FindElement(By.Id("MainContent_Email"));
            IWebElement passField = driver.FindElement(By.Id("MainContent_Password"));

            Assert.IsNotNull(userField);
            Assert.IsNotNull(passField);

            userField.SendKeys("student@concordia.com");
            passField.SendKeys("student");
            passField.SendKeys(Keys.Enter);

            Assert.AreEqual("Home Page - Concordia", driver.Title);
        }

        [TestMethod]
        public void TestValidSILogin()
        {
            driver.Navigate().GoToUrl("http://localhost:10255/Account/Login");
            Assert.AreEqual("Log in to PARC - Concordia", driver.Title);

            IWebElement userField = driver.FindElement(By.Id("MainContent_Email"));
            IWebElement passField = driver.FindElement(By.Id("MainContent_Password"));

            Assert.IsNotNull(userField);
            Assert.IsNotNull(passField);

            userField.SendKeys("leader@concordia.com");
            passField.SendKeys("leader");
            passField.SendKeys(Keys.Enter);

            Assert.AreEqual("Where art thou? - Concordia", driver.Title);

            var selectBox = driver.FindElement(By.Id("MainContent_DropDownList1"));
            SelectElement clickme = new SelectElement(selectBox);
            clickme.SelectByValue("PARC HQ");

            var button = driver.FindElement(By.Id("MainContent_Button1"));
            button.Click();

            Thread.Sleep(5000);

            

        }

        [TestMethod]
        public void TestValidAssistantLogin()
        {
            driver.Navigate().GoToUrl("http://localhost:10255/Account/Login");
            Assert.AreEqual("Log in to PARC - Concordia", driver.Title);

            IWebElement userField = driver.FindElement(By.Id("MainContent_Email"));
            IWebElement passField = driver.FindElement(By.Id("MainContent_Password"));

            Assert.IsNotNull(userField);
            Assert.IsNotNull(passField);

            userField.SendKeys("assistant@concordia.com");
            passField.SendKeys("assistant");
            passField.SendKeys(Keys.Enter);

            Assert.AreEqual("Where art thou? - Concordia", driver.Title);
        }

        [TestMethod]
        public void TestValidAdminLogin()
        {
            driver.Navigate().GoToUrl("http://localhost:10255/Account/Login");
            Assert.AreEqual("Log in to PARC - Concordia", driver.Title);

            IWebElement userField = driver.FindElement(By.Id("MainContent_Email"));
            IWebElement passField = driver.FindElement(By.Id("MainContent_Password"));

            Assert.IsNotNull(userField);
            Assert.IsNotNull(passField);

            userField.SendKeys("admin@concordia.com");
            passField.SendKeys("admin");
            passField.SendKeys(Keys.Enter);

            Assert.AreEqual("Where art thou? - Concordia", driver.Title);
        }

        [TestMethod]
        public void TestBlankUserName()
        {
            driver.Navigate().GoToUrl("http://localhost:10255/Account/Login");
            Assert.AreEqual("Log in to PARC - Concordia", driver.Title);

            IWebElement userField = driver.FindElement(By.Id("MainContent_Email"));
            IWebElement passField = driver.FindElement(By.Id("MainContent_Password"));

            Assert.IsNotNull(userField);
            Assert.IsNotNull(passField);

            //userField.SendKeys("student@concordia.com");
            //passField.SendKeys("student");
            passField.SendKeys(Keys.Enter);

            // should stay on the same page
            Assert.AreEqual("Log in to PARC - Concordia", driver.Title);
        }

        [TestMethod]
        public void TestBlankPassword()
        {
            driver.Navigate().GoToUrl("http://localhost:10255/Account/Login");
            Assert.AreEqual("Log in to PARC - Concordia", driver.Title);

            IWebElement userField = driver.FindElement(By.Id("MainContent_Email"));
            IWebElement passField = driver.FindElement(By.Id("MainContent_Password"));

            Assert.IsNotNull(userField);
            Assert.IsNotNull(passField);

            userField.SendKeys("student@concordia.com");
            //passField.SendKeys("student");
            passField.SendKeys(Keys.Enter);

            // should stay on the same page
            Assert.AreEqual("Log in to PARC - Concordia", driver.Title);
        }
    }
}
