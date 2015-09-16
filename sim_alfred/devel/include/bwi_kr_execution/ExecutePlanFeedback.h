// Generated by gencpp from file bwi_kr_execution/ExecutePlanFeedback.msg
// DO NOT EDIT!


#ifndef BWI_KR_EXECUTION_MESSAGE_EXECUTEPLANFEEDBACK_H
#define BWI_KR_EXECUTION_MESSAGE_EXECUTEPLANFEEDBACK_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace bwi_kr_execution
{
template <class ContainerAllocator>
struct ExecutePlanFeedback_
{
  typedef ExecutePlanFeedback_<ContainerAllocator> Type;

  ExecutePlanFeedback_()
    {
    }
  ExecutePlanFeedback_(const ContainerAllocator& _alloc)
    {
    }






  typedef boost::shared_ptr< ::bwi_kr_execution::ExecutePlanFeedback_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::bwi_kr_execution::ExecutePlanFeedback_<ContainerAllocator> const> ConstPtr;

}; // struct ExecutePlanFeedback_

typedef ::bwi_kr_execution::ExecutePlanFeedback_<std::allocator<void> > ExecutePlanFeedback;

typedef boost::shared_ptr< ::bwi_kr_execution::ExecutePlanFeedback > ExecutePlanFeedbackPtr;
typedef boost::shared_ptr< ::bwi_kr_execution::ExecutePlanFeedback const> ExecutePlanFeedbackConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::bwi_kr_execution::ExecutePlanFeedback_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::bwi_kr_execution::ExecutePlanFeedback_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace bwi_kr_execution

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'bwi_kr_execution': ['/home/avengineer/alfred_ws/sim_alfred/src/bwi_common/bwi_kr_execution/msg', '/home/avengineer/alfred_ws/sim_alfred/devel/share/bwi_kr_execution/msg'], 'actionlib_msgs': ['/opt/ros/indigo/share/actionlib_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/indigo/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::bwi_kr_execution::ExecutePlanFeedback_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::bwi_kr_execution::ExecutePlanFeedback_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::bwi_kr_execution::ExecutePlanFeedback_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::bwi_kr_execution::ExecutePlanFeedback_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::bwi_kr_execution::ExecutePlanFeedback_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::bwi_kr_execution::ExecutePlanFeedback_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::bwi_kr_execution::ExecutePlanFeedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d41d8cd98f00b204e9800998ecf8427e";
  }

  static const char* value(const ::bwi_kr_execution::ExecutePlanFeedback_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd41d8cd98f00b204ULL;
  static const uint64_t static_value2 = 0xe9800998ecf8427eULL;
};

template<class ContainerAllocator>
struct DataType< ::bwi_kr_execution::ExecutePlanFeedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bwi_kr_execution/ExecutePlanFeedback";
  }

  static const char* value(const ::bwi_kr_execution::ExecutePlanFeedback_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::bwi_kr_execution::ExecutePlanFeedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n\
\n\
";
  }

  static const char* value(const ::bwi_kr_execution::ExecutePlanFeedback_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::bwi_kr_execution::ExecutePlanFeedback_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream&, T)
    {}

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct ExecutePlanFeedback_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::bwi_kr_execution::ExecutePlanFeedback_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream&, const std::string&, const ::bwi_kr_execution::ExecutePlanFeedback_<ContainerAllocator>&)
  {}
};

} // namespace message_operations
} // namespace ros

#endif // BWI_KR_EXECUTION_MESSAGE_EXECUTEPLANFEEDBACK_H
