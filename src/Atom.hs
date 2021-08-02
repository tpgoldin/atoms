module Atom (
  Electron(..),
  Proton(..),
  Neutron(..),
  Atom(..),
  toAtom
) where

import AtomicMassNumber
import AtomicNumber
import Electron
import Proton
import Neutron
import Nucleon
import Data.List (intercalate)

newtype Nucleus = Nucleus { nucleons::[Nucleon] } deriving Eq

nucleus :: [Proton] -> [Neutron] -> Nucleus
nucleus ps ns = Nucleus { nucleons=map protonItem ps ++ map neutronItem ns }

data Atom = Atom { atomicNucleus::Nucleus, electrons::[Electron], atomicNumber::AtomicNumber, atomicMassNumber::AtomicMassNumber } deriving Eq

instance Show Atom where
  show a = intercalate ", " [show n, show "n", show p, show "p", show e, show "e"]
           where n = length $ neutrons a
                 p = length $ protons a
                 e = length $ electrons a

instance Ord Atom where
  compare a1 a2 = atomicNumber a1 `compare` atomicNumber a2

toAtom::Int -> Int -> Int -> Atom
toAtom np nn ne = Atom { atomicNucleus=nucleus ps ns, electrons=es, atomicNumber=toAtomicNumber $ length ps,
 atomicMassNumber=toAtomicMassNumber (np + nn) }
                  where ps = replicate np proton
                        ns = replicate nn neutron
                        es = replicate ne electron

protons :: Atom -> [Proton]
protons a = concatMap toProton ps
            where ps = filter isProton (nucleons $ atomicNucleus a)

neutrons :: Atom -> [Neutron]
neutrons a = concatMap toNeutron ns 
             where ns = filter isNeutron (nucleons $ atomicNucleus a)
    