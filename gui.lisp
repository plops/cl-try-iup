;; cd quicklisp/local-projects/
;; git clone https://github.com/lispnik/pffft
;; git clone https://github.com/lispnik/tecgraf-base
;; git clone https://github.com/lispnik/tecgraf-libs
;; git clone https://github.com/lispnik/iup/
;; sudo emerge patchelf
;; sudo apt install patchelf
;; sudo pacman -S patchelf
;; export LD_LIBRARY_PATH="/home/martin/quicklisp/local-projects/tecgraf-libs/libs/:$LD_LIBRARY_PATH"
;; https://www.reddit.com/r/Common_Lisp/comments/au0dmv/more_iup_gui_stuff/
;;(ql:quickload "tecgraf-libs") ;; needs to run only once
;; 
(ql:quickload "iup")

(defpackage #:gui
  (:use #:cl))
(in-package #:gui)

(defun message (m)
  (iup:message "bla" m))

(sb-int:with-float-traps-masked  (:divide-by-zero :invalid)
 (iup:with-iup ()
   (let* ((label (iup:label :title "hello"))
	  (button1 (iup:button :title "test"
			       :expand :yes
			       :action (lambda (handle)
					 (message (string "button1"))
					 iup:+default+)))
	  (vbox (iup:vbox (list button1 label)))
	  (dialog (iup:dialog vbox :title "hello world"))
	  )
     (iup:show dialog)
     (iup:main-loop))))
