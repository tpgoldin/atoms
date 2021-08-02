module AtomicOrbitals where

import Data.Ratio ((%))

newtype PrincipalQuantumNumber = PrincipalQuantumNumber { pqn::Int } deriving Eq

instance Show PrincipalQuantumNumber where
  show x = show $ pqn x

newtype AzimuthalQuantumNumber = AzimuthalQuantumNumber { aqn::Int } deriving Eq

instance Show AzimuthalQuantumNumber where
  show x = show $ aqn x

newtype MagneticQuantumNumber = MagneticQuantumNumber { mqn::Int } deriving Eq

instance Show MagneticQuantumNumber where
  show x = show $ mqn x

newtype SpinQuantumNumber = SpinQuantumNumber { sqn::Rational } deriving Eq

up :: SpinQuantumNumber
up = SpinQuantumNumber { sqn=1%2 }

down :: SpinQuantumNumber
down = SpinQuantumNumber { sqn=(-1)%2 }

instance Show SpinQuantumNumber where
  show x = show $ sqn x

data QuantumNumber = AzimuthalQuantumNumberItem AzimuthalQuantumNumber | MagneticQuantumNumberItem MagneticQuantumNumber |
  PrincipalQuantumNumberItem PrincipalQuantumNumber | SpinQuantumNumberItem SpinQuantumNumber deriving Eq

symbol :: QuantumNumber -> String
symbol (AzimuthalQuantumNumberItem _) = show "l"
symbol (PrincipalQuantumNumberItem _) = show "n"
symbol (MagneticQuantumNumberItem _) = show "ml"
symbol (SpinQuantumNumberItem _) = show "ms"
