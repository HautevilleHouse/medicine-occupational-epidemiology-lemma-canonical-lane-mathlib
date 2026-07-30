import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineOccupationalEpidemiologyLemmaCanonicalLaneLean

structure PharmacokineticDosePackage where
  doseAmount : ℕ
  administrationRoute : Prop
  absorptionRate : ℕ
  distributionVolume : ℕ
  eliminationRate : ℕ
  bioavailability : Prop
  therapeuticWindow : Prop

structure PharmacokineticDoseEvidence (P : PharmacokineticDosePackage) where
  doseAmountClosed : P.doseAmount > 0
  administrationRouteClosed : P.administrationRoute
  absorptionRateClosed : P.absorptionRate > 0
  distributionVolumeClosed : P.distributionVolume > 0
  eliminationRateClosed : P.eliminationRate > 0
  bioavailabilityClosed : P.bioavailability
  therapeuticWindowClosed : P.therapeuticWindow

def PharmacokineticDoseClosed (P : PharmacokineticDosePackage) : Prop :=
  P.doseAmount > 0 ∧ P.administrationRoute ∧
  P.absorptionRate > 0 ∧ P.distributionVolume > 0 ∧
  P.eliminationRate > 0 ∧ P.bioavailability ∧ P.therapeuticWindow

theorem pharmacokinetic_dose_closed_from_evidence (P : PharmacokineticDosePackage)
    (E : PharmacokineticDoseEvidence P) : PharmacokineticDoseClosed P := by
  exact And.intro E.doseAmountClosed
    (And.intro E.administrationRouteClosed
      (And.intro E.absorptionRateClosed
        (And.intro E.distributionVolumeClosed
          (And.intro E.eliminationRateClosed
            (And.intro E.bioavailabilityClosed E.therapeuticWindowClosed)))))

end MedicineOccupationalEpidemiologyLemmaCanonicalLaneLean
end HautevilleHouse