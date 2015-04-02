using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using OpenQA.Selenium;
using OpenQA.Selenium.Opera;
using System.Threading;

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
        }
        
        [TestCleanup]
        public void TestCleanup() {
            if (driver != null)
            {
             //   driver.Close();
            }
        }

        [TestMethod]
        public void TestStudentLogins()
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

            // todo remove
            Thread.Sleep(500);

            Assert.AreEqual("Home Page - Concordia", driver.Title);
        }
    }
}
