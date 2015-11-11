
(cl:in-package :asdf)

(defsystem "alfred_server-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "ItemRequest" :depends-on ("_package_ItemRequest"))
    (:file "_package_ItemRequest" :depends-on ("_package"))
    (:file "ItemResult" :depends-on ("_package_ItemResult"))
    (:file "_package_ItemResult" :depends-on ("_package"))
  ))