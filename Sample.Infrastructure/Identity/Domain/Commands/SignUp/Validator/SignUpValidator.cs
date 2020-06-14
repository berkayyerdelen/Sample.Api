using FluentValidation;

namespace Sample.Infrastructure.Identity.Domain.Commands.SignUp.Validator
{
    public class SignUpValidator : AbstractValidator<SignUpRequest>
    {
        public SignUpValidator()
        {
            RuleFor(x => x.Password).NotNull().NotEmpty();
            RuleFor(x => x.Email).EmailAddress();
            RuleFor(x => x.FirstName).NotNull().NotEmpty();
            RuleFor(x => x.LastName).NotNull().NotEmpty();
        }
    }
}