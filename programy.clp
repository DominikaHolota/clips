
;; ======================================================
;;       Programming language chooser - Expert System

;;         Those expert system helps in choosing first
;;         programming language to learn.

;; ======================================================

;;****************
;;* DEFFUNCTIONS *
;;****************

(deffunction ask-question (?question $?allowed-values)
   (print ?question)
   (bind ?answer (read))
   (if (lexemep ?answer)
       then (bind ?answer (lowcase ?answer)))
   (while (not (member$ ?answer ?allowed-values)) do
      (print ?question)
      (bind ?answer (read))
      (if (lexemep ?answer)
          then (bind ?answer (lowcase ?answer))))
   ?answer)

(deffunction yes-or-no-p (?question)
   (bind ?response (ask-question ?question yes no y n))
   (if (or (eq ?response yes) (eq ?response y))
       then yes
       else no))

;;;***************
;;;* QUERY RULES *
;;;***************

(defrule dla_dzieci ""
   (not (dla_dzieci ?))
   (not (choosej ?))
   =>
   (assert (dla_dzieci (yes-or-no-p "Czy szukasz języka programowania dla
dzieci? (yes/no)? "))))

(defrule czy_programuja ""
   (dla_dzieci yes)
   (not (choosej ?))
   =>
   (assert (czy_programuja(yes-or-no-p "Czy miały już styczność
 z programowaniem? (yes/no)? "))))

(defrule czy_korpo ""
   (dla_dzieci no)
   (czy_ziemniak yes)
   (not (choosej ?))
   =>
   (assert (czy_olej (yes-or-no-p "Czy ma byc smazone na oleju? (yes/no)? "))))


(defrule czy_kukurydza ""
   (czy_slodkie no)
   (czy_ziemniak no)
   (not (choosej ?))
   =>
   (assert (czy_kukurydza (yes-or-no-p "Czy ma byc z kukurydzy? (yes/no)? "))))

(defrule czy_podluzne ""
   ( czy_slodkie no)
   (czy_ziemniak no)
   (czy_kukurydza no)
   (not (choosej ?))
   =>
   (assert (czy_podluzne (yes-or-no-p "Czy ma byc podluzne (yes/no)? "))))


(defrule czy_drozdzowe ""
   (czy_slodkie yes)
   (not (choosej ?))
   =>
   (assert (czy_drozdzowe (yes-or-no-p "Czy chcesz ciasto drożdżowe? (yes/no)? "))))

(defrule ma_nadzienie ""
   (czy_slodkie yes)
   (czy_drozdzowe no)
   (not (choosej ?))
   =>
   (assert (ma_nadzienie (yes-or-no-p "Czy chcesz deser z nadzieniem? (yes/no)? "))))

(defrule ma_lukier ""
   (czy_slodkie yes)
   (czy_drozdzowe yes)
   (not (choosej ?))
   =>
   (assert (ma_lukier (yes-or-no-p "Czy ciasto ma być z lukrem? (yes/no)? "))))

(defrule ma_wypelnienie ""
   (czy_slodkie yes)
   (czy_drozdzowe yes)
   (ma_lukier yes)
   (not (choosej ?))
   =>
   (assert (ma_wypelnienie (yes-or-no-p "Czy ma mieć nadzienie? (yes/no)? "))))

(defrule ma_dziurke ""
   (czy_slodkie yes)
   (czy_drozdzowe yes)
   (ma_lukier yes)
   (not (choosej ?))
   =>
   (assert (ma_dziurke (yes-or-no-p "Czy ma mieć dziurke? (yes/no)? "))))





;;;********************************
;;;* CHOOSE RULES / ZASADY WYBORU *
;;;********************************

(defrule python ""
   (dla_dzieci yes)
   (czy_programuja yes)
   (not (choosej ?))
   =>
   (assert (choosej "Python")))

(defrule paluszki ""
   (czy_slodkie no)
   (czy_ziemniak no)
   (czy_kukurydza no)
   (czy_podluzne yes)
   (not (choosej ?))
   =>
   (assert (choosej "Paluszki")))


(defrule chrupki ""
   (czy_slodkie no)
   (czy_ziemniak no)
   (czy_kukurydza yes)
     (not (choosej ?))
   =>
   (assert (choosej "Chrupki")))

(defrule chips ""
   (czy_slodkie no)
   (czy_ziemniak yes)
   (czy_olej yes)
     (not (choosej ?))
   =>
   (assert (choosej "Chipsy")))

(defrule chips ""
   (czy_slodkie no)
   (czy_ziemniak yes)
   (czy_olej no)
     (not (choosej ?))
   =>
   (assert (choosej "Prazynki")))

(defrule donat""
   (czy_slodkie yes)
   (czy_drozdzowe yes)
   (ma_lukier yes)
   (ma_dziurke yes)
   (not (choosej ?))
   =>
  (assert (choosej "Donat")))

(defrule paczek""
   (czy_slodkie yes)
   (czy_drozdzowe yes)
   (ma_lukier yes)
   (ma_dziurke yes)
   (not (choosej ?))
   =>
  (assert (choosej "Paczek")))

(defrule drozdzowka""
   (czy_slodkie yes)
   (czy_drozdzowe yes)
   (ma_lukier no)
   (ma_wypelnienie yes)
   (not (choosej ?))
   =>
  (assert (choosej "Drozdzowka")))

(defrule ekler ""
   (czy_slodkie yes)
   (czy_drozdzowe no)
   (ma_nadzienie yes)
   (not (choosej ?))
   =>
   (assert (choosej "EKLER")))

(defrule crossaint ""
   (czy_slodkie yes)
   (czy_drozdzowe no)
   (ma_nadzienie no)
   (not (choosej ?))
   =>
   (assert (choosej "CROSSAINT")))


(defrule chalka ""
   (czy_slodkie yes)
   (czy_drozdzowe yes)
   (ma_lukier no)
   (ma_wypelnienie no)
   (not (choosej ?))
   =>
   (assert (choosej "CHALKA")))


;;;*********************************************************
;;;* STARTUP AND CONCLUSION RULES / URUCHOMIENIE I WNIOSKI *
;;;*********************************************************

(defrule system-banner ""
  (declare (salience 10))
  =>
  (println crlf "Jaka przekaska bedziemy sie delektowac" crlf))

(defrule print-choosej ""
  (declare (salience 10))
  (choosej ?item)
  =>
  (println crlf "Wybrany rodzaj przekaski:" crlf)
  (println " " ?item crlf))
