using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using System.IdentityModel.Tokens.Jwt;
using System.Text;
using Microsoft.IdentityModel.Tokens;
using System.Security.Claims;

using HWills_Final_DMV;

namespace HWills_Final_DMV.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoginController : ControllerBase
    {
        private readonly JwtAuthenticationManager jwtAuthenticationManager;
        public LoginController(JwtAuthenticationManager jwtAuthenticationManager)
        {
            this.jwtAuthenticationManager = jwtAuthenticationManager;
        }


        [AllowAnonymous]
        [HttpPost("Authorize")]
        public IActionResult HWills_Final_DMV([FromBody] Users usr)
        {
            var token = jwtAuthenticationManager.Authenticate(usr.username, usr.password);
            if (token == null)
            {
                return Unauthorized();
            }
            return Ok(new { Token = token, Message = "Success" });
        }
        [Authorize]
        [HttpDelete("Logout")]
        public IActionResult Logout()
        {
            jwtAuthenticationManager.RemoveAuthentication(User.Identity.Name);
            return Ok(new { Message = "Logout successful" });
        }


    }
    public class Users
    {
        public string username { get; set; }
        public string password { get; set; }
    }
}