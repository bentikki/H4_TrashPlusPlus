using System;
using System.Collections.Generic;
using System.Text;

namespace Library_H4_TrashPlusPlus.Validator
{
    public interface IValidationRule
    {
        void Check(object value, ref Validator validator);
    }
}
