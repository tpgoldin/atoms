module ChemicalElement (
  ChemicalElement(..),
  chemicalElement
) where

import Atom
import PeriodicGroup

data ChemicalElement = ChemicalElement { name::String, symbol::String, atom::Atom, periodicGroup::PeriodicGroup } deriving Eq

instance Show ChemicalElement where
  show ce = mconcat [show $ name ce, show " (", show $ symbol ce, show ")"]

instance Ord ChemicalElement where
  compare ce1 ce2 = atom ce1 `compare` atom ce2

chemicalElement :: String -> String -> Int -> Int -> Int -> PeriodicGroup -> ChemicalElement
chemicalElement n s np nn ne pg = ChemicalElement { name=n, symbol=s, atom=toAtom np nn ne, periodicGroup=pg }
