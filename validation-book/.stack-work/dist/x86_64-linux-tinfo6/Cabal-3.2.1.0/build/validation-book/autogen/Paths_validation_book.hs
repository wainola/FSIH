{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_validation_book (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/nrriquel/Documents/haskell/FSIH/validation-book/.stack-work/install/x86_64-linux-tinfo6/0983cd6fd481be59c0b52f6784e102556c286e62664aae83cbdcbfb26807c08b/8.10.4/bin"
libdir     = "/home/nrriquel/Documents/haskell/FSIH/validation-book/.stack-work/install/x86_64-linux-tinfo6/0983cd6fd481be59c0b52f6784e102556c286e62664aae83cbdcbfb26807c08b/8.10.4/lib/x86_64-linux-ghc-8.10.4/validation-book-0.1.0.0-3Kz75VpXPuV4PufdFRCjYl-validation-book"
dynlibdir  = "/home/nrriquel/Documents/haskell/FSIH/validation-book/.stack-work/install/x86_64-linux-tinfo6/0983cd6fd481be59c0b52f6784e102556c286e62664aae83cbdcbfb26807c08b/8.10.4/lib/x86_64-linux-ghc-8.10.4"
datadir    = "/home/nrriquel/Documents/haskell/FSIH/validation-book/.stack-work/install/x86_64-linux-tinfo6/0983cd6fd481be59c0b52f6784e102556c286e62664aae83cbdcbfb26807c08b/8.10.4/share/x86_64-linux-ghc-8.10.4/validation-book-0.1.0.0"
libexecdir = "/home/nrriquel/Documents/haskell/FSIH/validation-book/.stack-work/install/x86_64-linux-tinfo6/0983cd6fd481be59c0b52f6784e102556c286e62664aae83cbdcbfb26807c08b/8.10.4/libexec/x86_64-linux-ghc-8.10.4/validation-book-0.1.0.0"
sysconfdir = "/home/nrriquel/Documents/haskell/FSIH/validation-book/.stack-work/install/x86_64-linux-tinfo6/0983cd6fd481be59c0b52f6784e102556c286e62664aae83cbdcbfb26807c08b/8.10.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "validation_book_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "validation_book_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "validation_book_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "validation_book_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "validation_book_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "validation_book_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
