using System.Collections.Generic;

namespace Sample.Infrastructure.Identity.Jwt
{
    public interface ITokenGenerator
    {
        string GenerateJwt(User user, IList<string> roles);
    }
}