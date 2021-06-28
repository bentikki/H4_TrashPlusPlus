﻿using Acr.UserDialogs;
using Library_H4_TrashPlusPlus.Trash;
using Library_H4_TrashPlusPlus.Trash.Models;
using Library_H4_TrashPlusPlus.Users;
using Library_H4_TrashPlusPlus.Validator;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Text;
using System.Windows.Input;
using Xamarin.Forms;
using Xamarin_H4_TrashPlusPlus.LocalStorage;
using Xamarin_H4_TrashPlusPlus.View;

namespace Xamarin_H4_TrashPlusPlus.ViewModel
{
    class ScanningViewModel : BaseViewModel
    {
        private ITrashService _trashService;
        public ICommand BackCommand { get; set; }
        public ICommand ScanningCompletedCommand { get; set; }
        public ICommand NotAbleToScanCommand { get; set; }

        public ScanningViewModel(IChangePage pageChanger, ITrashService trashService) : base(pageChanger)
        {
            _trashService = trashService;
            BackCommand = new Command(() => _pageChanger.PushPage(new LoginPage()));
            ScanningCompletedCommand = new Command(LookupCodeAsync);
            NotAbleToScanCommand = new Command(() => _pageChanger.PushPage(new ScanningPage()));
        }

        /// <summary>
        /// 
        /// </summary>
        public async void LookupCodeAsync(object obj)
        {
            string barcode = obj.ToString();
            using (UserDialogs.Instance.Loading("Finder sortering..."))
            {
                List<string> errors = DefaultValidators.ValidateBarcode(barcode);
                // Validation on barcode

                //If success
                if (errors.Count == 0)
                {
                    // Call service by barcode
                    ITrash trash = await _trashService.GetTrashByBarcodeAsync(barcode);
                    // If exist
                    if (trash != null)
                    {
                        // Redirect with answer to SortingResult
                        this._pageChanger.PushPage(new SortingResultPage(trash));
                    }
                    else
                    {
                        //If no method exist in DB 
                        // show notfoundpage
                        await UserDialogs.Instance.ConfirmAsync(new ConfirmConfig() { Message = "Stregkode ikke fundet", Title = "fejl"});

                    }
                }
                else
                {
                    //If Fail
                    // Display error message on popup
                    await UserDialogs.Instance.ConfirmAsync(new ConfirmConfig() { Message = "stregkode er ikke vadlid", Title = "fejl" });
                }
            }
        } 
    }
}