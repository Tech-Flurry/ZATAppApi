﻿using System;
using ZATAppApi.Models.Common;

namespace ZATAppApi.Common
{
#pragma warning disable CS1591 // Missing XML comment for publicly visible type or member
    public class Constants
    {
        public static readonly string APPLICATION_NAME = "ZAT";
        public static readonly string TAG_LINE = "Ride Booking App";
        public static readonly double AJAX_INTERVAL = 0.30; //min
        public static readonly int PAGGING_RANGE = 50;
        public static readonly string CURRENCY_SYMBOL = "Rs. ";
        public static readonly string GOOGLE_API_KEY = "AIzaSyC9T637lzXkuTe7q2Vy_1fIo3azZzDhHwM";
        public static readonly DateTime MINIMUM_CAR_MODEL_YEAR = new DateTime(2000, 1, 1);
        public static readonly string DEFAULT_PASSWORD = "user123";
        public static readonly string ADMIN_PHONE_NUMBER = "+923011234567";
        public static readonly Location DEFAULT_LOCATION = new Location { Latitude = 31.322384m, Longitude = 73.796661m };
        public static readonly double DEFAULT_DISTANCE_RADIUS = 5;
        public static readonly string DUE_PAYMENT_NOTIFICATION_FORMAT = "AsalamuAlaikum {0}! Ap " + APPLICATION_NAME + " k Rs.{1} apny qareebi JazzCash k agent k zariye transfer kr k apni transaction ki tasdeeq karwain (tasdeeq k liye apny app ma di gai option ko istemal karain). Ap paise " + APPLICATION_NAME + " k head office ma bhi jama karwa sakty hain.";
    }
#pragma warning restore CS1591 // Missing XML comment for publicly visible type or member
}