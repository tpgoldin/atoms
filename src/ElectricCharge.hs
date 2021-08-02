module ElectricCharge (
  ElectricCharge(..),
  positiveCharge,
  negativeCharge,
  neutralCharge
) where

newtype ElectricCharge = ElectricCharge Int deriving Eq

positiveCharge::ElectricCharge
positiveCharge = ElectricCharge 1

neutralCharge::ElectricCharge
neutralCharge = ElectricCharge 0

negativeCharge::ElectricCharge
negativeCharge = ElectricCharge (-1)
  
