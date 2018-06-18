
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

(deffunction tak-or-nie-p (?question)
   (bind ?response (ask-question ?question tak nie y n))
   (if (or (eq ?response tak) (eq ?response y))
       then tak
       else nie))

;;;***************
;;;* QUERY RULES *
;;;***************

(defrule dla_dzieci ""
   (not (dla_dzieci ?))
   (not (choosej ?))
   =>
   (assert (dla_dzieci (tak-or-nie-p "Czy szukasz języka programowania dla
dzieci? (tak/nie)? "))))

(defrule czy_programuja ""
   (dla_dzieci tak)
   (not (choosej ?))
   =>
   (assert (czy_programuja(tak-or-nie-p "Czy miały już stycznieść
 z programowaniem? (tak/nie)? "))))

 (defrule python ""
   (dla_dzieci tak)
   (czy_programuja tak)
   (not (choosej ?))
   =>
   (assert (choosej "Python")))

 (defrule scratch ""
   (dla_dzieci tak)
   (czy_programuja nie)
   (not (choosej ?))
   =>
   (assert (choosej "Scratch")))

(defrule czy_praca ""
   (dla_dzieci nie)
   (not (choosej ?))
   =>
   (assert (czy_praca (tak-or-nie-p "Czy chcesz się uczyć programowania, żeby znaleźć pracę? (tak/nie)? "))))

 (defrule ook ""
   (dla_dzieci nie)
   (czy_praca nie)
   (not (choosej ?))
   =>
   (assert (choosej "Ook! Lub inne hobbystyczne.")))

(defrule czy_korpo ""
   (dla_dzieci nie)
   (czy_praca tak)
   (not (choosej ?))
   =>
   (assert (czy_korpo (tak-or-nie-p "Czy chcesz pracować w korporacji? (tak/nie)? "))))

(defrule czy_windows ""
   (dla_dzieci nie)
   (czy_praca tak)
   (czy_korpo tak)
   (not (choosej ?))
   =>
   (assert (czy_windows (tak-or-nie-p "Czy lubisz produkty firmy Microsoft? (tak/nie)? "))))

(defrule microsoft_c ""
   (dla_dzieci nie)
   (czy_praca tak)
   (czy_korpo tak)
   (czy_windows tak)
   (not (choosej ?))
   =>
   (assert (choosej "C#")))

(defrule java ""
   (dla_dzieci nie)
   (czy_praca tak)
   (czy_korpo tak)
   (czy_windows nie)
   (not (choosej ?))
   =>
   (assert (choosej "Java")))

(defrule czy_web ""
   (dla_dzieci nie)
   (czy_praca tak)
   (czy_korpo nie)
   (not (choosej ?))
   =>
   (assert (czy_web (tak-or-nie-p "Czy chcesz pisać aplikacje webowe? (tak/nie)? "))))

(defrule czy_backend ""
   (dla_dzieci nie)
   (czy_praca tak)
   (czy_korpo nie)
   (czy_web tak)
   (not (choosej ?))
   =>
   (assert (czy_backend (tak-or-nie-p "Chcesz pisać back-end aplikacji? (tak/nie)? "))))

(defrule czy_niewe ""
   (dla_dzieci nie)
   (czy_praca tak)
   (czy_korpo nie)
   (czy_web tak)
   (czy_backend tak)
   (not (choosej ?))
   =>
   (assert (czy_niewe (tak-or-nie-p "Interesując Cię najniewsze technielogie? (tak/nie)? "))))

(defrule JS_backend ""
   (dla_dzieci nie)
   (czy_praca tak)
   (czy_korpo nie)
   (czy_web tak)
   (czy_backend tak)
   (czy_niewe tak)
   (not (choosej ?))
   =>
   (assert (choosej "JS (np. niede.js)")))

(defrule czy_hostingi ""
   (dla_dzieci nie)
   (czy_praca tak)
   (czy_korpo nie)
   (czy_web tak)
   (czy_backend tak)
   (czy_niewe nie)
   (not (choosej ?))
   =>
   (assert (czy_hostingi (tak-or-nie-p "Chcesz w prosty sposób instalować apllikacje na popularnych hostingach? (tak/nie)? "))))

(defrule PHP ""
   (dla_dzieci nie)
   (czy_praca tak)
   (czy_korpo nie)
   (czy_web tak)
   (czy_backend tak)
   (czy_niewe nie)
   (czy_hostingi tak)
   (not (choosej ?))
   =>
   (assert (choosej "PHP")))

(defrule Ruby ""
   (dla_dzieci nie)
   (czy_praca tak)
   (czy_korpo nie)
   (czy_web tak)
   (czy_backend tak)
   (czy_niewe nie)
   (czy_hostingi nie)
   (not (choosej ?))
   =>
   (assert (choosej "Ruby")))

(defrule Front ""
   (dla_dzieci nie)
   (czy_praca tak)
   (czy_korpo nie)
   (czy_web tak)
   (czy_backend nie)
   (not (choosej ?))
   =>
   (assert (choosej "Front-end: HTML, CSS, JS.")))

(defrule czy_mobilne ""
   (dla_dzieci nie)
   (czy_praca tak)
   (czy_korpo nie)
   (czy_web nie)
   (not (choosej ?))
   =>
   (assert (czy_mobilne (tak-or-nie-p "Chcesz pisać apliakcje mobilne? (tak/nie)? "))))

(defrule Cplusplus ""
   (dla_dzieci nie)
   (czy_praca tak)
   (czy_korpo nie)
   (czy_web tak)
   (czy_backend nie)
   (czy_mobilne nie)
   (not (choosej ?))
   =>
   (assert (choosej "C++ (programowanie gier i aplikacji desktopowych).")))

(defrule czy_android ""
   (dla_dzieci nie)
   (czy_praca tak)
   (czy_korpo nie)
   (czy_web nie)
   (czy_mobilne tak)
   (not (choosej ?))
   =>
   (assert (czy_android (tak-or-nie-p "Dla androida? (tak/nie)? "))))

(defrule Java_mobile ""
   (dla_dzieci nie)
   (czy_praca tak)
   (czy_korpo nie)
   (czy_web nie)
   (czy_mobilne tak)
   (czy_android tak)
   (not (choosej ?))
   =>
   (assert (choosej "Java")))

(defrule C_ios ""
   (dla_dzieci nie)
   (czy_praca tak)
   (czy_korpo nie)
   (czy_web nie)
   (czy_mobilne tak)
   (czy_android nie)
   (not (choosej ?))
   =>
   (assert (choosej "C")))


;;;*********************************************************
;;;* STARTUP AND CONCLUSION RULES / URUCHOMIENIE I WNIOSKI *
;;;*********************************************************

(defrule system-banner ""
  (declare (salience 10))
  =>
  (println crlf "Jaki język programowania wybrać?" crlf))

(defrule print-choosej ""
  (declare (salience 10))
  (choosej ?item)
  =>
  (println crlf "Najlepszy język dla Ciebie to:" crlf)
  (println " " ?item crlf))
