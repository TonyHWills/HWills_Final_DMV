using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using HWills_Final_DMV.Data;
using HWills_Final_DMV.Models;
using Microsoft.AspNetCore.Authorization;

namespace HWills_Final_DMV.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class InfractLinksController : ControllerBase
    {
        private readonly DMVContext _context;

        public InfractLinksController(DMVContext context)
        {
            _context = context;
        }
        [Authorize]
        // GET: api/InfractLinks
        [HttpGet]
        public async Task<ActionResult<IEnumerable<InfractLink>>> GetInfractLinks()
        {
          if (_context.InfractLinks == null)
          {
              return NotFound();
          }
            return await _context.InfractLinks.ToListAsync();
        }
        [Authorize]
        // GET: api/InfractLinks/5
        [HttpGet("{id}")]
        public async Task<ActionResult<InfractLink>> GetInfractLink(string id)
        {
          if (_context.InfractLinks == null)
          {
              return NotFound();
          }
            var infractLink = await _context.InfractLinks.FindAsync(id);

            if (infractLink == null)
            {
                return NotFound();
            }

            return infractLink;
        }
        [Authorize]
        // PUT: api/InfractLinks/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutInfractLink(string id, InfractLink infractLink)
        {
            if (id != infractLink.UserId)
            {
                return BadRequest();
            }

            _context.Entry(infractLink).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!InfractLinkExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }
        [Authorize]
        // POST: api/InfractLinks
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<InfractLink>> PostInfractLink(InfractLink infractLink)
        {
          if (_context.InfractLinks == null)
          {
              return Problem("Entity set 'DMVContext.InfractLinks'  is null.");
          }
            _context.InfractLinks.Add(infractLink);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (InfractLinkExists(infractLink.UserId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetInfractLink", new { id = infractLink.UserId }, infractLink);
        }

        // DELETE: api/InfractLinks/5
        [Authorize]
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteInfractLink(string id)
        {
            if (_context.InfractLinks == null)
            {
                return NotFound();
            }
            var infractLink = await _context.InfractLinks.FindAsync(id);
            if (infractLink == null)
            {
                return NotFound();
            }

            _context.InfractLinks.Remove(infractLink);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool InfractLinkExists(string id)
        {
            return (_context.InfractLinks?.Any(e => e.UserId == id)).GetValueOrDefault();
        }
    }
}
