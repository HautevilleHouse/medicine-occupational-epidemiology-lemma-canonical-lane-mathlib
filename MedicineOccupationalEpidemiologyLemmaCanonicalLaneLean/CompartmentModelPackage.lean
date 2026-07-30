import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOccupationalEpidemiologyLemmaCanonicalLaneLean

structure CompartmentModelPackage where
  compartments : Type
  states : Type
  transitionRates : Type
  susceptibleExposedInfectedRecovered : Prop
  exposedLatentPeriod : Prop
  infectiousPeriod : Prop
  reinfectionPossible : Prop

structure CompartmentModelEvidence (C : CompartmentModelPackage) where
  susceptibleExposedInfectedRecoveredClosed : C.susceptibleExposedInfectedRecovered
  exposedLatentPeriodClosed : C.exposedLatentPeriod
  infectiousPeriodClosed : C.infectiousPeriod
  reinfectionPossibleClosed : C.reinfectionPossible

def CompartmentModelClosed (C : CompartmentModelPackage) : Prop :=
  C.susceptibleExposedInfectedRecovered ∧ C.exposedLatentPeriod ∧
  C.infectiousPeriod ∧ C.reinfectionPossible

theorem compartment_model_closed_from_evidence (C : CompartmentModelPackage)
    (E : CompartmentModelEvidence C) : CompartmentModelClosed C := by
  exact And.intro E.susceptibleExposedInfectedRecoveredClosed
    (And.intro E.exposedLatentPeriodClosed
      (And.intro E.infectiousPeriodClosed E.reinfectionPossibleClosed))

end MedicineOccupationalEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse