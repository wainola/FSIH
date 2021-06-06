{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_hid (
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

bindir     = "/home/nrriquel/Documents/haskell/FSIH/hid/.stack-work/install/x86_64-linux-tinfo6/2f60216f48a558b7b3c7e4e7bd21be5b0bcc411bbdf3ed5bdfd7af6c9630e4dc/8.6.5/bin"
libdir     = "/home/nrriquel/Documents/haskell/FSIH/hid/.stack-work/install/x86_64-linux-tinfo6/2f60216f48a558b7b3c7e4e7bd21be5b0bcc411bbdf3ed5bdfd7af6c9630e4dc/8.6.5/lib/x86_64-linux-ghc-8.6.5/hid-0.1.0.0-57FPfQxUsTFIW6mFY78CuT-hid"
dynlibdir  = "/home/nrriquel/Documents/haskell/FSIH/hid/.stack-work/install/x86_64-linux-tinfo6/2f60216f48a558b7b3c7e4e7bd21be5b0bcc411bbdf3ed5bdfd7af6c9630e4dc/8.6.5/lib/x86_64-linux-ghc-8.6.5"
datadir    = "/home/nrriquel/Documents/haskell/FSIH/hid/.stack-work/install/x86_64-linux-tinfo6/2f60216f48a558b7b3c7e4e7bd21be5b0bcc411bbdf3ed5bdfd7af6c9630e4dc/8.6.5/share/x86_64-linux-ghc-8.6.5/hid-0.1.0.0"
libexecdir = "/home/nrriquel/Documents/haskell/FSIH/hid/.stack-work/install/x86_64-linux-tinfo6/2f60216f48a558b7b3c7e4e7bd21be5b0bcc411bbdf3ed5bdfd7af6c9630e4dc/8.6.5/libexec/x86_64-linux-ghc-8.6.5/hid-0.1.0.0"
sysconfdir = "/home/nrriquel/Documents/haskell/FSIH/hid/.stack-work/install/x86_64-linux-tinfo6/2f60216f48a558b7b3c7e4e7bd21be5b0bcc411bbdf3ed5bdfd7af6c9630e4dc/8.6.5/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "hid_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "hid_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "hid_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "hid_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "hid_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "hid_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
