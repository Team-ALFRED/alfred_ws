
(cl:in-package :asdf)

(defsystem "bwi_msgs-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :bwi_msgs-msg
)
  :components ((:file "_package")
    (:file "DoorHandlerInterface" :depends-on ("_package_DoorHandlerInterface"))
    (:file "_package_DoorHandlerInterface" :depends-on ("_package"))
    (:file "QuestionDialog" :depends-on ("_package_QuestionDialog"))
    (:file "_package_QuestionDialog" :depends-on ("_package"))
    (:file "SemanticParser" :depends-on ("_package_SemanticParser"))
    (:file "_package_SemanticParser" :depends-on ("_package"))
    (:file "StopBase" :depends-on ("_package_StopBase"))
    (:file "_package_StopBase" :depends-on ("_package"))
  ))