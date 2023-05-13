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
    public class InfractsController : ControllerBase
    {
        private readonly DMVContext _context;

        public InfractsController(DMVContext context)
        {
            _context = context;
        }

        // GET: api/Infracts
        [Authorize]
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Infract>>> GetInfracts()
        {
          if (_context.Infracts == null)
          {
              return NotFound();
          }
            return await _context.Infracts.ToListAsync();
        }

        // GET: api/Infracts/5
        [Authorize]
        [HttpGet("{id}")]
        public async Task<ActionResult<Infract>> GetInfract(string id)
        {
          if (_context.Infracts == null)
          {
              return NotFound();
          }
            var infract = await _context.Infracts.FindAsync(id);

            if (infract == null)
            {
                return NotFound();
            }

            return infract;
        }

        // PUT: api/Infracts/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [Authorize]
        [HttpPut("{id}")]
        public async Task<IActionResult> PutInfract(string id, Infract infract)
        {
            if (id != infract.InfractId)
            {
                return BadRequest();
            }

            _context.Entry(infract).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!InfractExists(id))
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

        // POST: api/Infracts
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [Authorize]
        [HttpPost]
        public async Task<ActionResult<Infract>> PostInfract(Infract infract)
        {
          if (_context.Infracts == null)
          {
              return Problem("Entity set 'DMVContext.Infracts'  is null.");
          }
            _context.Infracts.Add(infract);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (InfractExists(infract.InfractId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetInfract", new { id = infract.InfractId }, infract);
        }

        // DELETE: api/Infracts/5
        [Authorize]
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteInfract(string id)
        {
            if (_context.Infracts == null)
            {
                return NotFound();
            }
            var infract = await _context.Infracts.FindAsync(id);
            if (infract == null)
            {
                return NotFound();
            }

            _context.Infracts.Remove(infract);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool InfractExists(string id)
        {
            return (_context.Infracts?.Any(e => e.InfractId == id)).GetValueOrDefault();
        }
    }
}
