using System;
using System.Collections.Generic;
using System.Text;

namespace Library_H4_TrashPlusPlus.Api
{
    public abstract class ApiRepositoryMaster
    {
        protected ApiRequester apiRequester;
        protected string apiString;

        public ApiRepositoryMaster(string apidestination)
        {
            this.apiString = apidestination;
            this.apiRequester = new ApiRequester(apidestination);
        }
    }
}
