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
using Library_H4_TrashPlusPlus.Trash.Models;

namespace H4_TrashPlusPlus.Controllers
{
    [Authorize]
    [ApiController]
    [Route("[controller]")]
    public class BinTypeController : BaseController
    {
        private IBinTypeService _binTypeService;

        public BinTypeController(IBinTypeService binTypeService)
        {
            this._binTypeService = binTypeService;
        }

        [AllowAnonymous]
        [HttpGet("GetAll")]
        public IActionResult GetAll()
        { 
            List<IBinType> binTypes = _binTypeService.GetAllBinTypes();
            return Ok(binTypes);
        }

    }
}
