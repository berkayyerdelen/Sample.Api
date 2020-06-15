using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using Microsoft.IdentityModel.Tokens;

namespace Sample.Infrastructure.Identity.Jwt
{
    public class TokenGenerator:ITokenGenerator
    {
        public readonly JwtSettings JwtSettings;

        public TokenGenerator(JwtSettings jwtSettings)
        {
            JwtSettings= jwtSettings;
        }
        public string GenerateJwt(User user, IList<string> roles)
        {
            var claims = new List<Claim>
            {
                new Claim(JwtRegisteredClaimNames.Sub, user.Id.ToString()),
                new Claim(ClaimTypes.Name, user.UserName),
                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
                new Claim(ClaimTypes.NameIdentifier, user.Id.ToString())
            };
            var roleClaims = roles.Select(r => new Claim(ClaimTypes.Role, r));
            claims.AddRange(roleClaims);

            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(JwtSettings.Secret));
            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);
            var expires = DateTime.Now.AddDays(Convert.ToDouble(JwtSettings.ExpirationInDays));

            var token = new JwtSecurityToken(
                issuer: JwtSettings.Issuer,
                audience: JwtSettings.Issuer,
                claims,
                expires: expires,
                signingCredentials: creds
            );

            return new JwtSecurityTokenHandler().WriteToken(token);

        }
    }
}