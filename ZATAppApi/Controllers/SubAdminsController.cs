﻿using System;
using System.Collections.Generic;
using System.Web.Mvc;
using ZATAppApi.Models;
using ZATAppApi.ViewModels;

namespace ZATAppApi.Controllers
{
    [Authorize(Roles = "Admin")]
    public class SubAdminsController : Controller
    {
        /// <summary>
        /// Action to show the list of subadmins registered to the system
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            List<ViewSubAdminViewModel> model = new List<ViewSubAdminViewModel>();
            foreach (var item in SubAdmin.GetAllSubAdmins())
            {
                model.Add(new ViewSubAdminViewModel(item.GetAllAreas())
                {
                    Contact = item.ContactNumber.LocalFormatedPhoneNumber,
                    Name = item.FullName.FirstName + " " + item.FullName.LastName,
                    Id = item.UserId
                });
            }
            return View(model);
        }
        /// <summary>
        /// Action to add an area to the sub admin
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult AddArea(long id)
        {
            try
            {
                AddAreaViewModel model = new AddAreaViewModel
                {
                    SubAdminId = id
                };
                return View(model);
            }
            catch (Exception ex)
            {
                return RedirectToAction("ErrorPage", "Error", ex);
            }
        }
        /// <summary>
        /// POST Method to add area 
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddArea(AddAreaViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }
            try
            {
                SubAdmin subAdmin = new SubAdmin(model.SubAdminId);
                subAdmin.AddArea(model.AreaName);
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                return RedirectToAction("ErrorPage", "Error", ex);
            }
        }
        /// <summary>
        /// Action to show areas to be removed
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult RemoveArea(long id)
        {
            try
            {
                SubAdmin subAdmin = new SubAdmin(id);
                List<AreaViewModel> model = new List<AreaViewModel>();
                foreach (var item in subAdmin.GetAllAreas())
                {
                    model.Add(new AreaViewModel
                    {
                        Id = item.AreaId,
                        Name = item.AreaName,
                        SubAdminId = subAdmin.UserId
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
        /// Method to remove an area under a sub admin
        /// </summary>
        /// <param name="uId">sub admin id</param>
        /// <param name="aId">area id</param>
        /// <returns></returns>
        public ActionResult RemoveArea2(long uId, int aId)
        {

            try
            {
                SubAdmin subAdmin = new SubAdmin(uId);
                subAdmin.RemoveArea(new SubAdmin.Area
                {
                    AreaId = aId
                });
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {

                return RedirectToAction("ErrorPage", "Error", ex);
            }
        }
        [AllowAnonymous]
        public void SetActive()
        {
            try
            {
                var subAdmin = Models.User.GetUser(User.Identity.Name);
                subAdmin.IsActive = true;
            }
            catch (Exception)
            {
                
            }
        }
    }
}