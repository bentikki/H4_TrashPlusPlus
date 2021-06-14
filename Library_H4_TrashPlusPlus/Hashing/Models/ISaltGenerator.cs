using System;
using System.Collections.Generic;
using System.Text;

namespace Library_H4_TrashPlusPlus.Hashing.Models
{
    public interface ISaltGenerator
    {
        byte[] GenerateSalt(int saltLength);
    }
}
