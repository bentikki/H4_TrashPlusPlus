using Xamarin.Forms;

namespace Xamarin_H4_TrashPlusPlus.View
{
    /// <summary>
    /// Can Change the page
    /// </summary>
    interface IChangePage
    {
        void PushPage(Page page);
        void PopPushPage(Page page);
        void PopPage();
    }
}
