using System;
using System.Collections.Generic;
using System.Text;

namespace Sample.Core.Common.BaseApiReturn
{
	public class ApiReturn<T>
	{
		public bool Success { get; set; }
		public string Message { get; set; }
		public string InternalMessage { get; set; }
		public T Data { get; set; }
		public List<string> Errors { get; set; }
	}

	public class ApiReturn : ApiReturn<object>
	{
	}
}
