using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Watcher.BLL.Services;
using Watcher.Extensions;
using Watcher.Models.v1.TestExecutions;

namespace Watcher.Controllers.Api.V1
{
	[Route("api/v1/[controller]")]
	[ApiController]
	[Authorize(Roles = "User")]
	public class TestExecutionController: ControllerBase
	{
		private readonly ITestExecutionService _testExecutionService;
		private readonly IMapper _mapper;

		public TestExecutionController(
			ITestExecutionService testExecutionService,
			IMapper mapper)
		{
			_testExecutionService = testExecutionService;
			_mapper = mapper;
		}

		// GET: api/<TestController>
		[HttpGet]
		public async Task<ActionResult<ICollection<TestExecution>>> Get()
		{
			var userId = this.GetUserId();
			var bllCities = await _testExecutionService.GetLatestAsync(userId);
			return _mapper.Map<ActionResult<ICollection<TestExecution>>>(bllCities);
		}
	}
}

