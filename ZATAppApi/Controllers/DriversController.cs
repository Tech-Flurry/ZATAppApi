﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ZATApp.Models;
using ZATApp.ViewModels;
using PagedList;
using ZATApp.Common;
using ZATApp.Common.Functions;
using ZATApp.Models.Exceptions;

namespace ZATAppApi.Controllers
{
    public class DriversController : Controller
    {
        /// <summary>
        /// Index method of Drivers controller which will return a list of drivers registered with the system
        /// </summary>
        /// <param name="page"></param>
        /// <returns></returns>
        public ActionResult Index(int? page)
        {
            try
            {
                List<ViewDriversViewModel> lstDrivers = new List<ViewDriversViewModel>();
                foreach (var item in Driver.GetAllDrivers())
                {
                    var vehicle = item.GetVehicle();
                    lstDrivers.Add(new ViewDriversViewModel
                    {
                        CNIC = item.CNIC_Number,
                        ContactNumber = item.ContactNumber.LocalFormatedPhoneNumber,
                        Id = item.UserId,
                        Name = item.FullName.FirstName + " " + item.FullName.LastName,
                        VehicleType = vehicle.Type.Name,
                        IsCleared = item.IsCleared,
                        Balance = item.Balance
                    });
                }
                PagedList<ViewDriversViewModel> model = new PagedList<ViewDriversViewModel>(lstDrivers, page ?? 1, Constants.PAGGING_RANGE);
                return View(model);
            }
            catch (Exception ex)
            {
                return RedirectToAction("ErrorPage", "Error", ex);
            }
        }
        /// <summary>
        /// Action to return the Details about a driver
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult ViewDetails(long id)
        {
            try
            {
                Driver driver = new Driver(id);
                var vehicle = driver.GetVehicle();
                DriverDetailsViewModel model = new DriverDetailsViewModel
                {
                    Balance = driver.Balance,
                    CNIC = driver.CNIC_Number,
                    ContactNumber = driver.ContactNumber.LocalFormatedPhoneNumber,
                    CreditLimit = driver.CreditLimit,
                    Id = driver.UserId,
                    IsBlocked = driver.IsBlocked,
                    Name = driver.FullName.FirstName + " " + driver.FullName.LastName,
                    Rating = decimal.Round(driver.TotalRating, 2),
                    RegisterationNumber = vehicle.RegisterationNumber.FormattedNumber,
                    RidesCompleted = driver.GetCompletedRides().Count,
                    VehcileType = vehicle.Type.Name,
                    VehicleModel = vehicle.Model,
                    IsActive = driver.IsActive,
                    LastLocation = driver.LastLocation
                };
                model.Comments = new List<ZATApp.Models.Common.RatingAndComments>();
                foreach (var item in driver.GetRatingAndComments())
                {
                    model.Comments.Add(new ZATApp.Models.Common.RatingAndComments
                    {
                        Comment = item.Comment,
                        Rating = item.Rating,
                        Rider = item.Rider
                    });
                }
                model.ManualTransactions = new List<ManualTransactionViewModel>(50);
                foreach (var item in driver.GetManualTransactions())
                {
                    model.ManualTransactions.Add(new ManualTransactionViewModel
                    {
                        Amount = decimal.Round(item.Amount, 2),
                        Time = UISupportiveFunctions.GetPassedTimeSpanFromNow(item.TransactionDateTime)
                    });
                }
                model.MobileTransactions = new List<MobileTransactionsViewModel>();
                foreach (var item in driver.GetAllMobileAccountTransactions())
                {
                    if (item.IsVerified)
                    {
                        model.MobileTransactions.Add(new MobileTransactionsViewModel
                        {
                            Amount = decimal.Round(item.Amount, 2),
                            IsVerified = item.IsVerified,
                            ReferenceNumber = item.ReferenceNumber,
                            ServiceName = item.MobileAccountServiceProviderName,
                            Time = UISupportiveFunctions.GetPassedTimeSpanFromNow(item.TransactionRegisteredTime)
                        });
                    }

                }
                return View(model);
            }
            catch (Exception ex)
            {
                return RedirectToAction("ErrorPage", "Error", ex);
            }
        }
        /// <summary>
        /// Action to block a driver
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult Block(long id)
        {
            try
            {
                Driver driver = new Driver(id);
                driver.IsBlocked = true;
                return RedirectToAction("ViewDetails", id);
            }
            catch (Exception ex)
            {
                return RedirectToAction("ErrorPage", "Error", ex);
            }
        }
        /// <summary>
        /// Returns the View for Edit Driver's Details
        /// </summary>
        /// <param name="id">Primary Key</param>
        /// <returns></returns>
        public ActionResult Edit(long id)
        {
            ViewBag.ErrorFlag = false;
            try
            {
                Driver driver = new Driver(id);
                EditDriverViewModel model = new EditDriverViewModel
                {
                    CompanyCode = driver.ContactNumber.CompanyCode,
                    CountryCode = driver.ContactNumber.CountryCode,
                    Number = driver.ContactNumber.PhoneNumber,
                    CreditLimit = driver.CreditLimit,
                    FirstName = driver.FullName.FirstName,
                    LastName = driver.FullName.LastName,
                    Id = driver.UserId
                };
                return View(model);
            }
            catch (Exception ex)
            {
                return RedirectToAction("ErrorPage", "Error", ex);
            }
        }
        /// <summary>
        /// Post Method to be called on form submission
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(EditDriverViewModel model)
        {
            ViewBag.ErrorFlag = false;
            if (!ModelState.IsValid)
            {
                return View();
            }
            try
            {
                Driver driver = new Driver(model.Id);
                driver.FullName = new User.NameFormat
                {
                    FirstName = model.FirstName,
                    LastName = model.LastName
                };
                driver.ContactNumber = new User.ContactNumberFormat(model.CountryCode, model.CompanyCode, model.Number);
                driver.CreditLimit = model.CreditLimit;
                return RedirectToAction("ViewDetails", new { id = model.Id });
            }
            catch (Exception ex)
            {
                return RedirectToAction("ErrorPage", "Error", ex);
            }
        }
        /// <summary>
        /// Action which will return a view to add vehicle or change a vehicle
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult AddVehicle(long id)
        {
            ViewBag.DriverId = id;
            ViewBag.ErrorFlag = false;
            return View();
        }
        /// <summary>
        /// Post Method to be called on submission of the Add vehicle form
        /// </summary>
        /// <param name="id"></param>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddVehicle(long id, AddVehicleViewModel model)
        {
            ViewBag.ErrorFlag = false;
            ViewBag.DriverId = id;
            if (!ModelState.IsValid)
            {
                return View();
            }
            try
            {
                Driver driver = new Driver(id);
                driver.AddOrChangeVehicle(new Vehicle.RegisterationNumberFormat(model.Alphabets, model.Number, (short)model.Year.Year), model.CarModel, (int)model.EngineCC, model.IsAc, model.Color, new VehicleType(model.VehicleType));
                return RedirectToAction("ViewDetails", new { id = id });
            }
            catch (UniqueKeyViolationException ex)
            {
                ViewBag.ErrorFlag = true;
                ModelState.AddModelError(String.Empty, ex.Message);
                return View();
            }
            catch (Exception ex)
            {
                return RedirectToAction("ErrorPage", "Error", ex);
            }
        }
    }
}