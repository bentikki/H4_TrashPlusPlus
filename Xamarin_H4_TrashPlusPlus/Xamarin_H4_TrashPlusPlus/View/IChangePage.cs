using System;
using System.Collections.Generic;
using System.Text;
using Xamarin.Forms;

namespace Xamarin_H4_TrashPlusPlus.View
{
    interface IChangePage
    {
        void PushPage(Page page);
        void PopPage();
    }
}
