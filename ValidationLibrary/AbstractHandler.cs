﻿using System;
using System.Collections.Generic;
using System.Text;

namespace ValidationLibrary
{
    abstract class AbstractHandler : IHandler
    {
        private IHandler _nextHandler;
        public List<string> errorList = new List<string>();
        protected bool stopValidation = false;

        public IHandler SetNext(IHandler handler)
        {
            this._nextHandler = handler;

            // Returning a handler from here will let us link handlers in a
            // convenient way like this:
            // monkey.SetNext(squirrel).SetNext(dog);
            return handler;
        }

        public virtual object Handle(object request)
        {
            if (this._nextHandler != null)
            {
                return this._nextHandler.Handle(request);
            }
            else
            {
                return null;
            }
        }
    }
}