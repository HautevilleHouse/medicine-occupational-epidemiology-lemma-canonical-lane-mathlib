import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOccupationalEpidemiologyLemmaCanonicalLaneLean

structure CompartmentModelPackage where
  susceptibleCompartment : Type u
  exposedCompartment : Type v
  infectedCompartment : Type w
  recoveredCompartment : Type x
  transitionRates : Prop
  basicReproductionNumber : ℕ
  steadyStateCondition : Prop

structure CompartmentModelEvidence (M : CompartmentModelPackage) where
  transitionRatesClosed : M.transitionRates
  basicReproductionNumberClosed : M.basicReproductionNumber > 0
  steadyStateConditionClosed : M.steadyStateCondition

def CompartmentModelClosed (M : CompartmentModelPackage) : Prop :=
  M.transitionRates ∧ M.basicReproductionNumber > 0 ∧ M.steadyStateCondition

theorem compartment_model_closed_from_evidence (M : CompartmentModelPackage)
    (E : CompartmentModelEvidence M) : CompartmentModelClosed M := by
  exact And.intro E.transitionRatesClosed
    (And.intro E.basicReproductionNumberClosed E.steadyStateConditionClosed)

end MedicineOccupationalEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse
