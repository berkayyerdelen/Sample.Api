using FluentValidation;

namespace Sample.Core.Domain.Product.Commands.DeleteProduct.Validator
{
    public class DeleteProductValidator: AbstractValidator<DeleteProductRequest>
    {
        public DeleteProductValidator()
        {
            RuleFor(x => x.Id).NotNull().NotEmpty();
        }
    }
}