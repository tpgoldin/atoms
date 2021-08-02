module Nucleon (
  Nucleon(..),
  protonItem,
  isProton,
  toProton,
  neutronItem,
  isNeutron,
  toNeutron
) where

import Proton
import Neutron

data Nucleon = ProtonItem Proton | NeutronItem Neutron deriving Eq

protonItem::Proton -> Nucleon
protonItem = ProtonItem

neutronItem::Neutron -> Nucleon
neutronItem = NeutronItem

isProton :: Nucleon -> Bool
isProton (ProtonItem _) = True
isProton (NeutronItem _) = False

toProton :: Nucleon -> [Proton]
toProton (ProtonItem p) = [p]
toProton (NeutronItem _) = []

isNeutron :: Nucleon -> Bool
isNeutron (ProtonItem _) = False
isNeutron (NeutronItem _) = True

toNeutron :: Nucleon -> [Neutron]
toNeutron (ProtonItem _) = []
toNeutron (NeutronItem n) = [n]
