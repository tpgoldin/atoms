module AtomicMassUnit (
  AtomicMassUnit(..),
  atomicMassUnit
) where

newtype AtomicMassUnit = AtomicMassUnit Int deriving Eq

atomicMassUnit :: Int -> AtomicMassUnit
atomicMassUnit = AtomicMassUnit
