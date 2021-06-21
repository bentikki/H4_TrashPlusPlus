using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using H4_TrashPlusPlus.Models;
using Microsoft.AspNetCore.Http;
using System;
using Library_H4_TrashPlusPlus.Users;
using H4_TrashPlusPlus.Entities;
using System.Data;
using Library_H4_TrashPlusPlus.Users.Models;
using Library_H4_TrashPlusPlus.Users.Entities;
using Microsoft.Net.Http.Headers;
using Library_H4_TrashPlusPlus.Encryption;
using Library_H4_TrashPlusPlus;
using Library_H4_TrashPlusPlus.BinType;
using Library_H4_TrashPlusPlus.BinType.Models;
using System.Collections.Generic;
using Library_H4_TrashPlusPlus.Trash;
using Library_H4_TrashPlusPlus.Trash.Models;

namespace H4_TrashPlusPlus.Controllers
{
    [Authorize]
    [ApiController]
    [Route("[controller]")]
    public class TrashController : BaseController
    {
        private ITrashService _trashService;
        private IUserService _userService;

        public TrashController(ITrashService trashService, IUserService userService)
        {
            this._trashService = trashService;
            this._userService = userService;
        }

        [AllowAnonymous]
        [HttpGet("GetByBarcode/{barcode}")]
        public IActionResult GetAll(string barcode)
        {
            ITrash trash = _trashService.GetTrashByBarcode(barcode);
            return Ok(trash);
        }

        [HttpPost("RegisterTrashSorting")]
        public IActionResult CreateTrash(CreateTrashRequest request)
        {
            try
            {
                request.UserID = this.GetCurrentUser(_userService).Id;

                ITrash newTrash = _trashService.CreateTrash(request);
                return Ok(newTrash);
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }
    }
}
