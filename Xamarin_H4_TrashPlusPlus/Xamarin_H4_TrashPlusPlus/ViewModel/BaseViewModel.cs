using System.ComponentModel;
using System.Runtime.CompilerServices;
using Xamarin_H4_TrashPlusPlus.View;

namespace Xamarin_H4_TrashPlusPlus.ViewModel
{
    /// <summary>
    /// Base class for view models
    /// </summary>
    abstract class BaseViewModel : INotifyPropertyChanged
    {
        protected IChangePage _pageChanger;

        /// <summary>
        /// Base class for view models
        /// </summary>
        /// <param name="pageChanger">The object that can Change page</param>
        protected BaseViewModel(IChangePage pageChanger)
        {
            _pageChanger = pageChanger;
        }

        public event PropertyChangedEventHandler PropertyChanged;
        protected void NotifyPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
