using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Watcher.BLL.Services;
using Watcher.Extensions;
using Watcher.Models.v1.Tests;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Watcher.Controllers.Api.V1.Dashboard.BeautySalon
{
	[Route("api/v1/[controller]")]
	[ApiController]
	[Authorize(Roles = "User")]
	public class TestController : ControllerBase
	{
		private readonly ITestService _testService;
		private readonly IMapper _mapper;

		public TestController(
			ITestService testService,
			IMapper mapper)
		{
			_testService = testService;
			_mapper = mapper;
		}

		// GET: api/<TestController>
		[HttpGet]
		public async Task<ActionResult<ICollection<Test>>> Get()
		{
			var userId = this.GetUserId();
			var bllCities = await _testService.GetAllAsync(userId);
			return _mapper.Map<ActionResult<ICollection<Test>>>(bllCities);
		}

		// POST api/<TestController>
		[HttpPost]
		public async Task<ActionResult> Post([FromBody] AddTestData value)
		{
			var userId = this.GetUserId();
			var bllAddAppData = _mapper.Map<BLL.Models.Tests.AddTestData>(value);
			var bllResult = await _testService.AddAsync(bllAddAppData, userId);
			return _mapper.Map<ActionResult>(bllResult);
		}

		// PUT api/<TestController>/5
		[HttpPut]
		public async Task<ActionResult> Put([FromBody] Test value)
		{
			var userId = this.GetUserId();
			var bllEntity = _mapper.Map<BLL.Models.Tests.Test>(value);
			var bllUpdateResult = await _testService.UpdateAsync(bllEntity, userId);
			return _mapper.Map<ActionResult>(bllUpdateResult);
		}

		// DELETE api/<TestController>/5
		[HttpDelete("{id}")]
		public async Task<ActionResult> Delete(int id)
		{
			var userId = this.GetUserId();
			var bllFetchResult = await _testService.DeleteAsync(id, userId);
			return _mapper.Map<ActionResult>(bllFetchResult);
		}
	}
}
