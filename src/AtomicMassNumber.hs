module AtomicMassNumber (
  AtomicMassNumber(..),
  toAtomicMassNumber
) where

newtype AtomicMassNumber = AtomicMassNumber { massNo::Int } deriving Eq

instance Show AtomicMassNumber where
  show a = show (massNo a)

toAtomicMassNumber :: Int -> AtomicMassNumber
toAtomicMassNumber i = AtomicMassNumber { massNo=i }
