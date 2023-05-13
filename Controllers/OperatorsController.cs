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
    public class OperatorsController : ControllerBase
    {
        private readonly DMVContext _context;

        public OperatorsController(DMVContext context)
        {
            _context = context;
        }
        [Authorize]
        // GET: api/Operators
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Operator>>> GetOperators()
        {
          if (_context.Operators == null)
          {
              return NotFound();
          }
            return await _context.Operators.ToListAsync();
        }
        [Authorize]
        // GET: api/Operators/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Operator>> GetOperator(string id)
        {
          if (_context.Operators == null)
          {
              return NotFound();
          }
            var @operator = await _context.Operators.FindAsync(id);

            if (@operator == null)
            {
                return NotFound();
            }

            return @operator;
        }
        [Authorize]
        // PUT: api/Operators/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutOperator(string id, Operator @operator)
        {
            if (id != @operator.OperatorId)
            {
                return BadRequest();
            }

            _context.Entry(@operator).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!OperatorExists(id))
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
        // POST: api/Operators
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Operator>> PostOperator(Operator @operator)
        {
          if (_context.Operators == null)
          {
              return Problem("Entity set 'DMVContext.Operators'  is null.");
          }
            _context.Operators.Add(@operator);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (OperatorExists(@operator.OperatorId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetOperator", new { id = @operator.OperatorId }, @operator);
        }
        [Authorize]
        // DELETE: api/Operators/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteOperator(string id)
        {
            if (_context.Operators == null)
            {
                return NotFound();
            }
            var @operator = await _context.Operators.FindAsync(id);
            if (@operator == null)
            {
                return NotFound();
            }

            _context.Operators.Remove(@operator);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool OperatorExists(string id)
        {
            return (_context.Operators?.Any(e => e.OperatorId == id)).GetValueOrDefault();
        }
    }
}
