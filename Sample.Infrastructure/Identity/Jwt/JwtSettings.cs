namespace Sample.Infrastructure.Identity.Jwt
{
    public class JwtSettings
    {
        public string Issuer { get; set; } /*= "http://localhost:51487/";*/
        public string Secret { get; set; } /*= "veryVerySuperSecretKey";*/
        public int ExpirationInDays { get; set; } /*= 1;*/
    }
}