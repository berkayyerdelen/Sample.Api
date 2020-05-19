using FluentValidation;

namespace Sample.Core.Domain.Product.Commands.UpsertProduct.Validator
{
    public class UpsertProductValidator : AbstractValidator<UpsertProductRequest>
    {
        public UpsertProductValidator()
        {
            RuleFor(x => x.CreatedDate).NotEmpty().NotNull();
            RuleFor(x => x.Name).NotNull().NotEmpty().MaximumLength(100);
        }
    }
}