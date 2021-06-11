using System;
using System.Collections.Generic;
using System.Text;

namespace ValidationLibrary
{
    public class NullValidator : AbstractHandler
    {

        public override object Handle(object request)
        {
            if ((request as string) == null)
            {
                this.errorList.Add("Input must not be null.");
                this.stopValidation = true;
            }

            return base.Handle(request);
            
        }
        
    }
}
