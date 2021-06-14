
using Library_H4_TrashPlusPlus.Hashing.Handlers.SaltGenerators;
using Library_H4_TrashPlusPlus.Hashing.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace Library_H4_TrashPlusPlus.Hashing
{
    /// <summary>
    /// Returns salt generator in use
    /// </summary>
    static class SaltGeneratorFactory
    {
        public static ISaltGenerator GetSaltGenerator() => new SaltGeneratorRNGCryptoService();
    }
}
