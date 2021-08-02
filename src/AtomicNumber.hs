module AtomicNumber (
  AtomicNumber(..),
  toAtomicNumber
) where

newtype AtomicNumber = AtomicNumber { atomicNo::Int } deriving Eq

instance Show AtomicNumber where
  show a = show (atomicNo a)

instance Ord AtomicNumber where
  compare an1 an2 = atomicNo an1 `compare` atomicNo an2
  
toAtomicNumber :: Int -> AtomicNumber
toAtomicNumber i = AtomicNumber { atomicNo=i }
