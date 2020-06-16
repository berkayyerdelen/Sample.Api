using System.Net;
using System.Net.Mail;
using System.Security.Policy;
using System.Threading;
using System.Threading.Tasks;
using System.Web;
using MediatR;
using Microsoft.AspNetCore.Identity;
using Sample.Core.Common.BaseDto;
using Sample.Infrastructure.Identity.Domain.Queries.ForgetPassword.Dto;

namespace Sample.Infrastructure.Identity.Domain.Queries.ForgetPassword
{
    public class ForgetPasswordRequestHandler : IRequestHandler<ForgetPasswordRequest, BaseResponseDto<ForgetPasswordDto>>
    {
        private readonly UserManager<User> _userManager;
        private readonly SignInManager<User> _signInManager;

        public ForgetPasswordRequestHandler(UserManager<User> userManager, SignInManager<User> signInManager)
        {
            _signInManager = signInManager;
            _userManager = userManager;
        }
        public async Task<BaseResponseDto<ForgetPasswordDto>> Handle(ForgetPasswordRequest request, CancellationToken cancellationToken)
        {
            var result = new BaseResponseDto<ForgetPasswordDto>();
            var user = await _userManager.FindByEmailAsync(request.Email);
            if (user != null)
            {
                string resetToken = await _userManager.GeneratePasswordResetTokenAsync(user);
                result.Data.Token = resetToken;

                MailMessage mail = new MailMessage()
                {
                    IsBodyHtml = true,
                    To = { user.Email },
                    From = new MailAddress("lejyonerarkantos@gmail.com", "Reset Password"),
                    Subject = "Reset Password request",
                    Body = resetToken,

                };

                SmtpClient smp = new SmtpClient();
                smp.Credentials = new NetworkCredential("lejyonerarkantos@gmail.com", "lejyoner+9");
                smp.Port = 587;
                smp.Host = "smtp.gmail.com";
                smp.EnableSsl = true;
                smp.Send(mail);

            }


            return result;
        }
    }
}