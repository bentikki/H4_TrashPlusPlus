using System;
using System.Collections.Generic;
using System.Text;

namespace ValidationLibrary
{

    public class Validator
    {
        // The client code is usually suited to work with a single handler. In
        // most cases, it is not even aware that the handler is part of a chain.
        public static void Validate(AbstractHandler handler, object value)
        {
            handler.Handle(value);
        }
    }
}
