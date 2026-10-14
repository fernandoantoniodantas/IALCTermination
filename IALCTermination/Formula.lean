import Mathlib

universe u

variable {Formula : Type u} [DecidableEq Formula]
variable {World : Type u} [DecidableEq World]


variable (closure : Finset Formula)

inductive Sign where
  | T
  | F
deriving DecidableEq

structure SignedFormula (World Formula : Type u) where
  sign : Sign
  world : World
  formula : Formula
  deriving DecidableEq

abbrev Branch (World Formula : Type u) :=
  Finset (SignedFormula World Formula)


def trueFormulasAt
    (B : Branch World Formula)
    (w : World)
    (closure : Finset Formula) : Finset Formula :=
    closure.filter fun α => { sign := Sign.T, world := w, formula := α } ∈ B

def falseFormulasAt
    (B : Branch World Formula)
    (w : World)
    (closure : Finset Formula) : Finset Formula :=
    closure.filter fun α => { sign := Sign.F, world := w, formula := α } ∈ B

abbrev Expanded (World Formula : Type u) :=
  Finset (SignedFormula World Formula)

def expandedFormulasAt
    (expanded : Expanded World Formula)
    (w : World) : Finset (Sign × Formula) :=
  (expanded.filter fun sf => sf.world = w).image
    (fun sf => (sf.sign, sf.formula))
