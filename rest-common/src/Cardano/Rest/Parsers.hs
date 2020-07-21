{-# LANGUAGE OverloadedStrings #-}
module Cardano.Rest.Parsers (pWebserverConfig) where

import Cardano.Rest.Types
    ( WebserverConfig (WebserverConfig) )
import Network.Wai.Handler.Warp
    ( HostPreference, Port )
import Options.Applicative
    ( Parser )
import Options.Applicative
    ( auto, help, long, metavar, option, showDefault, value )

pWebserverConfig :: Port -> Parser WebserverConfig
pWebserverConfig defaultPort = WebserverConfig <$> pHostPreferenceOption <*> pPortOption defaultPort

pHostPreferenceOption :: Parser HostPreference
pHostPreferenceOption =
  option auto $
  long "listen-address" <>
  metavar "HOST" <>
  help
    ("Specification of which host to the bind API server to. " <>
     "Can be an IPv[46] address, hostname, or '*'.") <>
  value "127.0.0.1" <> showDefault

pPortOption :: Port -> Parser Port
pPortOption defaultPort =
  option auto $
  long "port" <>
  metavar "INT" <>
  help "Port used for the API server." <> value defaultPort <> showDefault