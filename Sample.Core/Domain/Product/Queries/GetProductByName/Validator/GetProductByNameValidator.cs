using System;
using System.Collections.Generic;
using System.Text;
using FluentValidation;

namespace Sample.Core.Domain.Product.Queries.GetProductByName.Validator
{
    public class GetProductByNameValidator: AbstractValidator<GetProductByNameRequest>
    {
        public GetProductByNameValidator()
        {
            RuleFor(x => x.ProductName).NotEmpty().NotNull().MinimumLength(5).MaximumLength(100);
        }
    }
}
