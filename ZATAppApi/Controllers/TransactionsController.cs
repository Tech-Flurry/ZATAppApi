﻿using System;
using System.Collections.Generic;
using System.Web.Mvc;
using ZATAppApi.Models;
using ZATAppApi.ViewModels;
using ZATAppApi.Common.Functions;
namespace ZATAppApi.Controllers
{
    [Authorize(Roles = "Admin")]
    public class TransactionsController : Controller
    {
        // GET: Transactions
        public ActionResult Index()
        {
            return View();
        }
        /// <summary>
        /// Method to be called by using AJAX to getting UI updated
        /// </summary>
        /// <returns></returns>
        public int GetUnverifiedTransactionsCount()
        {
            int i = 0;
            try
            {
                i = MobileAccountTransactionLog.GetAllUnverifiedMobileAccountTransactions().Count;
            }
            catch (Exception)
            {

            }
            return i;
        }
        /// <summary>
        /// Method to show a list of unverified transactions in the system
        /// </summary>
        /// <returns></returns>
        public ActionResult ViewUnverifiedTransactions()
        {
            try
            {
                List<MobileTransactionsViewModel> model = new List<MobileTransactionsViewModel>();
                foreach (var item in MobileAccountTransactionLog.GetAllUnverifiedMobileAccountTransactions())
                {
                    model.Add(new MobileTransactionsViewModel
                    {
                        Id = item.TransactionId,
                        Amount = item.Amount,
                        DriverName = item.Driver.FullName.FirstName + " " + item.Driver.FullName.LastName,
                        IsVerified = item.IsVerified,
                        ReferenceNumber = item.ReferenceNumber,
                        ServiceName = item.MobileAccountServiceProviderName,
                        Time = UISupportiveFunctions.GetPassedTimeSpanFromNow(item.TransactionRegisteredTime)
                    });
                }
                return View(model);
            }
            catch (Exception ex)
            {
                return RedirectToAction("ErrorPage", "Error", ex);
            }
        }
        /// <summary>
        /// Action to be called through AJAX whenever there's a click on Verify button on verify transaction page
        /// </summary>
        /// <param name="id"></param>
        [HttpGet]
        public void VerifyTransaction(long id)
        {
            try
            {
                MobileAccountTransactionLog log = new MobileAccountTransactionLog(id);
                log.IsVerified = true;
            }
            catch (Exception)
            {

            }
        }
        /// <summary>
        /// Returns the view with the form to receive manual payment
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult ReceivePayment()
        {
            ViewBag.ErrorFlag = false;
            return View();
        }
        /// <summary>
        /// Action to be called on form submission of receive payment method
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ReceivePayment(ReceivePaymentViewModel model)
        {
            ViewBag.ErrorFlag = false;
            if (!ModelState.IsValid)
            {
                return View();
            }
            try
            {
                Driver driver = null;
                try
                {
                    driver = Driver.GetDriver(model.Cnic);
                }
                catch (Exception)
                {
                    ModelState.AddModelError(String.Empty, "The entered CNIC Number is not registered with the system.");
                    ViewBag.ErrorFlag = true;
                    return View();
                }
                if (driver == null)
                {
                    ModelState.AddModelError(String.Empty, "The entered CNIC Number is not registered with the system.");
                    ViewBag.ErrorFlag = true;
                    return View();
                }
                ManualTransactionLog log = new ManualTransactionLog(model.Amount, DateTime.Now, driver);
                return View("PaymentConfirmation", log);
            }
            catch (Exception ex)
            {
                return RedirectToAction("ErrorPage", "Error", ex);
            }
        }
        /// <summary>
        /// Action to return a list of Mobile Transactions over the time
        /// </summary>
        /// <returns></returns>
        public ActionResult ViewAllMobilePayments()
        {
            try
            {
                var model = new List<MobileTransactionsViewModel>();
                foreach (var item in MobileAccountTransactionLog.GetAllMobileAccountTransactions())
                {
                    model.Add(new MobileTransactionsViewModel
                    {
                        Amount = item.Amount,
                        DriverName = item.Driver.FullName.FirstName + " " + item.Driver.FullName.LastName,
                        Id = item.TransactionId,
                        IsVerified = item.IsVerified,
                        ReferenceNumber = item.ReferenceNumber,
                        ServiceName = item.MobileAccountServiceProviderName,
                        Time = UISupportiveFunctions.GetPassedTimeSpanFromNow(item.TransactionRegisteredTime)
                    });
                }
                return View(model);
            }
            catch (Exception ex)
            {
                return RedirectToAction("ErrorPage", "Error", ex);
            }
        }
        /// <summary>
        /// Action returns a list of Manual Transactions
        /// </summary>
        /// <returns></returns>
        public ActionResult ViewAllManualPayments()
        {
            try
            {
                List<ManualTransactionViewModel> model = new List<ManualTransactionViewModel>();
                foreach (var item in ManualTransactionLog.GetAllTransactions())
                {
                    model.Add(new ManualTransactionViewModel
                    {
                        Amount = item.Amount,
                        DriverName = item.Driver.FullName.FirstName + " " + item.Driver.FullName.LastName,
                        Time = UISupportiveFunctions.GetPassedTimeSpanFromNow(item.TransactionDateTime)
                    });
                }
                return View(model);
            }
            catch (Exception ex)
            {
                return RedirectToAction("ErrorPage", "Error", ex);
            }
        }
    }
}