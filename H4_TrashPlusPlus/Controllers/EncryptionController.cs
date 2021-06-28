using H4_TrashPlusPlus.Controllers;
using Library_H4_TrashPlusPlus;
using Library_H4_TrashPlusPlus.Users.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace H4_TrashPlusPlus.Controllers
{
    [AllowAnonymous]
    [ApiController]
    [Route("[controller]")]
    public class EncryptionController : BaseController
    {
        [HttpGet("GetPublicKey")]
        public IActionResult GetPublicKey()
        {
            try
            {
                string publickey = CommonSettingsFactory.GetAsyncPublicKey();
                ReworkResponse reworkResponse = new ReworkResponse();
                reworkResponse.Message = publickey;
                return Ok(reworkResponse);
            }
            catch (Exception)
            {
                return BadRequest(new { message = "An unexpected error occured" });
            }
        }
    }
}
