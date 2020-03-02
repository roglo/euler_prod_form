(* Euler's four square identity *)

Require Import Utf8 ZArith Psatz.
Require Import Misc.

Definition diff x y := if lt_dec x y then y - x else x - y.

Ltac Z_ring_for_Euler H1 H2 H3 H4 :=
  apply Nat2Z.inj_iff;
  rewrite Nat2Z.inj_mul;
  do 9 rewrite Nat2Z.inj_add;
  do 12 rewrite Nat2Z.inj_mul;
  do 12 rewrite <- Z.pow_2_r;
  rewrite Nat2Z.inj_sub; [ | flia H1 ];
  rewrite Nat2Z.inj_sub; [ | flia H2 ];
  rewrite Nat2Z.inj_sub; [ | flia H3 ];
  rewrite Nat2Z.inj_sub; [ | flia H4 ];
  repeat rewrite Nat2Z.inj_add;
  repeat rewrite Nat2Z.inj_mul;
  ring.

Theorem Euler_s_four_square_identity : ∀ a1 a2 a3 a4 b1 b2 b3 b4,
  (a1 ^ 2 + a2 ^ 2 + a3 ^ 2 + a4 ^2) * (b1 ^ 2 + b2 ^ 2 + b3 ^ 2 + b4 ^ 2) =
     diff (a1 * b1) (a2 * b2 + a3 * b3 + a4 * b4) ^ 2 +
     diff (a1 * b2 + a2 * b1 + a3 * b4) (a4 * b3) ^ 2 +
     diff (a1 * b3 + a3 * b1 + a4 * b2) (a2 * b4) ^ 2 +
     diff (a1 * b4 + a2 * b3 + a4 * b1) (a3 * b2) ^ 2.
Proof.
intros.
unfold diff.
do 12 rewrite Nat.pow_2_r.
destruct (lt_dec (a1 * b1) (a2 * b2 + a3 * b3 + a4 * b4)) as [H1| H1]. {
  destruct (lt_dec (a1 * b2 + a2 * b1 + a3 * b4) (a4 * b3)) as [H2| H2]. {
    destruct (lt_dec (a1 * b3 + a3 * b1 + a4 * b2) (a2 * b4)) as [H3| H3]. {
      destruct (lt_dec (a1 * b4 + a2 * b3 + a4 * b1) (a3 * b2)) as [H4| H4]. {
        lia.
      } {
        Z_ring_for_Euler H1 H2 H3 H4.
      }
    } {
      destruct (lt_dec (a1 * b4 + a2 * b3 + a4 * b1) (a3 * b2)) as [H4| H4]. {
        Z_ring_for_Euler H1 H2 H3 H4.
      } {
        Z_ring_for_Euler H1 H2 H3 H4.
      }
    }
  } {
    destruct (lt_dec (a1 * b3 + a3 * b1 + a4 * b2) (a2 * b4)) as [H3| H3]. {
      destruct (lt_dec (a1 * b4 + a2 * b3 + a4 * b1) (a3 * b2)) as [H4| H4]. {
        Z_ring_for_Euler H1 H2 H3 H4.
      } {
        Z_ring_for_Euler H1 H2 H3 H4.
      }
    } {
      destruct (lt_dec (a1 * b4 + a2 * b3 + a4 * b1) (a3 * b2)) as [H4| H4]. {
        Z_ring_for_Euler H1 H2 H3 H4.
      } {
        Z_ring_for_Euler H1 H2 H3 H4.
      }
    }
  }
} {
  destruct (lt_dec (a1 * b2 + a2 * b1 + a3 * b4) (a4 * b3)) as [H2| H2]. {
    destruct (lt_dec (a1 * b3 + a3 * b1 + a4 * b2) (a2 * b4)) as [H3| H3]. {
      destruct (lt_dec (a1 * b4 + a2 * b3 + a4 * b1) (a3 * b2)) as [H4| H4]. {
        Z_ring_for_Euler H1 H2 H3 H4.
      } {
        Z_ring_for_Euler H1 H2 H3 H4.
      }
    } {
      destruct (lt_dec (a1 * b4 + a2 * b3 + a4 * b1) (a3 * b2)) as [H4| H4]. {
        Z_ring_for_Euler H1 H2 H3 H4.
      } {
        Z_ring_for_Euler H1 H2 H3 H4.
      }
    }
  } {
    destruct (lt_dec (a1 * b3 + a3 * b1 + a4 * b2) (a2 * b4)) as [H3| H3]. {
      destruct (lt_dec (a1 * b4 + a2 * b3 + a4 * b1) (a3 * b2)) as [H4| H4]. {
        Z_ring_for_Euler H1 H2 H3 H4.
      } {
        Z_ring_for_Euler H1 H2 H3 H4.
      }
    } {
      destruct (lt_dec (a1 * b4 + a2 * b3 + a4 * b1) (a3 * b2)) as [H4| H4]. {
        Z_ring_for_Euler H1 H2 H3 H4.
      } {
        Z_ring_for_Euler H1 H2 H3 H4.
      }
    }
  }
}
Qed.
