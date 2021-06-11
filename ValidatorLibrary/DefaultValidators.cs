using System;
using System.Collections.Generic;
using System.Text;

namespace ValidatorLibrary
{
    /// <summary>
    /// Contains business logic with set rules for validating fields.
    /// </summary>
    public class DefaultValidators
    {
        static private List<IValidationRule> mailRules = new List<IValidationRule>()
                {
                    new NullRule(),
                    new NoEmptyStringRule(),
                    new MaxLengthRule(100),
                    new ValidMailRule(),
                    new NoSqlInjectionRule()
                };
        static private List<IValidationRule> passwordRules = new List<IValidationRule>()
                {
                    new NullRule(),
                    new NoEmptyStringRule(),
                    new MinLengthRule(8),
                    new MaxLengthRule(100),
                    new PasswordBlackListRule()
                };

        /// <summary>
        /// Validates the mail.
        /// Throws exception if an error is reached.
        /// </summary>
        /// <param name="mail">Mail value to validate.</param>
        static public void ValidateMailException(string mail)
        {
            Validator validator = new Validator("Mail", mailRules);
            if (!validator.Validate(mail))
            {
                foreach (var exception in validator.GetExceptions())
                {
                    throw exception;
                }
            }
        }
        /// <summary>
        /// Validates the password.
        /// Throws exception if an error is reached.
        /// </summary>
        /// <param name="password">password value to validate.</param>
        static public void ValidatePasswordException(string password)
        {
            Validator validator = new Validator("Password", passwordRules);
            if (!validator.Validate(password))
            {
                foreach (var exception in validator.GetExceptions())
                {
                    throw exception;
                }
            }
        }
    }
}
