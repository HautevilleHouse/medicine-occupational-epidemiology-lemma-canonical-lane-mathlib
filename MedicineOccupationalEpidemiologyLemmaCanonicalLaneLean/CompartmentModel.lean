import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOccupationalEpidemiologyLemmaCanonicalLaneLean

structure CompartmentModel where
  compartments : Nat
  transitionRates : Array (Array ℝ)
  exposedPopulations : Nat → ℕ
  incidenceRate : Prop
  recoveryRate : Prop
  mortalityRate : Prop
  steadyStateCondition : Prop
  equilibriumReached : Prop

structure CompartmentModelEvidence (C : CompartmentModel) where
  incidenceRateClosed : C.incidenceRate
  recoveryRateClosed : C.recoveryRate
  mortalityRateClosed : C.mortalityRate
  steadyStateConditionClosed : C.steadyStateCondition
  equilibriumReachedClosed : C.equilibriumReached

def CompartmentModelClosed (C : CompartmentModel) : Prop :=
  C.incidenceRate ∧ C.recoveryRate ∧ C.mortalityRate ∧ C.steadyStateCondition ∧ C.equilibriumReached

theorem compartment_model_closed_from_evidence (C : CompartmentModel) (E : CompartmentModelEvidence C) : CompartmentModelClosed C := by
  exact And.intro E.incidenceRateClosed (And.intro E.recoveryRateClosed (And.intro E.mortalityRateClosed (And.intro E.steadyStateConditionClosed E.equilibriumReachedClosed)))

end MedicineOccupationalEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse