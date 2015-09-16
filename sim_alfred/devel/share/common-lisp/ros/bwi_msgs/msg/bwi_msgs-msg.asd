
(cl:in-package :asdf)

(defsystem "bwi_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :actionlib_msgs-msg
               :bwi_planning_common-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "AvailableRobot" :depends-on ("_package_AvailableRobot"))
    (:file "_package_AvailableRobot" :depends-on ("_package"))
    (:file "AvailableRobotArray" :depends-on ("_package_AvailableRobotArray"))
    (:file "_package_AvailableRobotArray" :depends-on ("_package"))
    (:file "StopBaseStatus" :depends-on ("_package_StopBaseStatus"))
    (:file "_package_StopBaseStatus" :depends-on ("_package"))
    (:file "LogicalNavigationActionGoal" :depends-on ("_package_LogicalNavigationActionGoal"))
    (:file "_package_LogicalNavigationActionGoal" :depends-on ("_package"))
    (:file "LogicalNavigationResult" :depends-on ("_package_LogicalNavigationResult"))
    (:file "_package_LogicalNavigationResult" :depends-on ("_package"))
    (:file "LogicalNavigationFeedback" :depends-on ("_package_LogicalNavigationFeedback"))
    (:file "_package_LogicalNavigationFeedback" :depends-on ("_package"))
    (:file "LogicalNavigationActionResult" :depends-on ("_package_LogicalNavigationActionResult"))
    (:file "_package_LogicalNavigationActionResult" :depends-on ("_package"))
    (:file "LogicalNavigationGoal" :depends-on ("_package_LogicalNavigationGoal"))
    (:file "_package_LogicalNavigationGoal" :depends-on ("_package"))
    (:file "LogicalNavigationActionFeedback" :depends-on ("_package_LogicalNavigationActionFeedback"))
    (:file "_package_LogicalNavigationActionFeedback" :depends-on ("_package"))
    (:file "LogicalNavigationAction" :depends-on ("_package_LogicalNavigationAction"))
    (:file "_package_LogicalNavigationAction" :depends-on ("_package"))
  ))