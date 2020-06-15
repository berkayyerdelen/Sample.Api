using System.Collections.Generic;
using System.Linq;

namespace Sample.Core.Common.BaseDto
{
    public class BaseResponseDto<TData> where TData : new()
    {
        public BaseResponseDto()
        {
            Errors = new List<string>();
            Data = new TData();
        }

        public bool HasError => Errors.Any();
        public List<string> Errors { get; set; }
        public int Total { get; set; }
        public TData Data { get; set; }
    }
}