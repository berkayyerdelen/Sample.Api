using System;
using Sample.Core.Domain.Product.Commands.DeleteProduct;
using Sample.Core.Domain.Product.Commands.DeleteProduct.Validator;
using Sample.Core.Domain.Product.Commands.UpsertProduct;
using Sample.Core.Domain.Product.Commands.UpsertProduct.Validator;
using Sample.Core.Domain.Product.Queries.GetProductByName;
using Sample.Core.Domain.Product.Queries.GetProductByName.Validator;
using Sample.Infrastructure.Identity.Domain.Commands.SignUp;
using Sample.Infrastructure.Identity.Domain.Commands.SignUp.Validator;
using Xunit;

namespace SampleApi.UniTests
{
    public class ValidatorTests
    {
        [Fact]
        public void SignUp_Validator()
        {
            var signUpValidator = new SignUpValidator();
            var signUpRequest = new SignUpRequest()
            {
                Email = "berkayyerdelen@gmail.com",
                Password = "123456",
                FirstName = "Berkay",
                LastName = "Yerdelen",
                UserName = "berkayyerdelen@gmail.com"
            };
            var result = signUpValidator.Validate(signUpRequest);
            Assert.True(result.IsValid);
        }
        [Fact]
        public void Delete_Product_Validator()
        {
            var validator = new DeleteProductValidator();
            var deleteProductRequest = new DeleteProductRequest()
            {
                Id = 1
            };
            var result = validator.Validate(deleteProductRequest);
            Assert.True(result.IsValid);
        }

        [Fact]
        public void Upsert_Product_Validator()
        {
            var validator = new UpsertProductValidator();
            var upsertProductRequest = new UpsertProductRequest()
            {
                CreatedDate = DateTime.Now,
                Id = 1,
                Name = "Test"
            };
            var result = validator.Validate(upsertProductRequest);
            Assert.True(result.IsValid);

        }

        [Fact]
        public void Get_ProductByName_Validator()
        {
            var validator = new GetProductByNameValidator();
            var getProductByNameRequest = new GetProductByNameRequest("The Lord of The Rings");
            var result = validator.Validate(getProductByNameRequest);
            Assert.True(result.IsValid);
        }

    }
}
