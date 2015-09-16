// Generated by gencpp from file bwi_kr_execution/AspFluent.msg
// DO NOT EDIT!


#ifndef BWI_KR_EXECUTION_MESSAGE_ASPFLUENT_H
#define BWI_KR_EXECUTION_MESSAGE_ASPFLUENT_H


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
struct AspFluent_
{
  typedef AspFluent_<ContainerAllocator> Type;

  AspFluent_()
    : name()
    , variables()
    , timeStep(0)  {
    }
  AspFluent_(const ContainerAllocator& _alloc)
    : name(_alloc)
    , variables(_alloc)
    , timeStep(0)  {
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _name_type;
  _name_type name;

   typedef std::vector<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > , typename ContainerAllocator::template rebind<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::other >  _variables_type;
  _variables_type variables;

   typedef uint32_t _timeStep_type;
  _timeStep_type timeStep;




  typedef boost::shared_ptr< ::bwi_kr_execution::AspFluent_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::bwi_kr_execution::AspFluent_<ContainerAllocator> const> ConstPtr;

}; // struct AspFluent_

typedef ::bwi_kr_execution::AspFluent_<std::allocator<void> > AspFluent;

typedef boost::shared_ptr< ::bwi_kr_execution::AspFluent > AspFluentPtr;
typedef boost::shared_ptr< ::bwi_kr_execution::AspFluent const> AspFluentConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::bwi_kr_execution::AspFluent_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::bwi_kr_execution::AspFluent_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace bwi_kr_execution

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'bwi_kr_execution': ['/home/avengineer/alfred_ws/sim_alfred/src/bwi_common/bwi_kr_execution/msg', '/home/avengineer/alfred_ws/sim_alfred/devel/share/bwi_kr_execution/msg'], 'actionlib_msgs': ['/opt/ros/indigo/share/actionlib_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/indigo/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::bwi_kr_execution::AspFluent_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::bwi_kr_execution::AspFluent_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::bwi_kr_execution::AspFluent_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::bwi_kr_execution::AspFluent_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::bwi_kr_execution::AspFluent_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::bwi_kr_execution::AspFluent_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::bwi_kr_execution::AspFluent_<ContainerAllocator> >
{
  static const char* value()
  {
    return "8582b3c5ad01957af2b2eb3b38a251b2";
  }

  static const char* value(const ::bwi_kr_execution::AspFluent_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x8582b3c5ad01957aULL;
  static const uint64_t static_value2 = 0xf2b2eb3b38a251b2ULL;
};

template<class ContainerAllocator>
struct DataType< ::bwi_kr_execution::AspFluent_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bwi_kr_execution/AspFluent";
  }

  static const char* value(const ::bwi_kr_execution::AspFluent_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::bwi_kr_execution::AspFluent_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string name\n\
string[] variables\n\
uint32 timeStep\n\
";
  }

  static const char* value(const ::bwi_kr_execution::AspFluent_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::bwi_kr_execution::AspFluent_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.name);
      stream.next(m.variables);
      stream.next(m.timeStep);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct AspFluent_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::bwi_kr_execution::AspFluent_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::bwi_kr_execution::AspFluent_<ContainerAllocator>& v)
  {
    s << indent << "name: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.name);
    s << indent << "variables[]" << std::endl;
    for (size_t i = 0; i < v.variables.size(); ++i)
    {
      s << indent << "  variables[" << i << "]: ";
      Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.variables[i]);
    }
    s << indent << "timeStep: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.timeStep);
  }
};

} // namespace message_operations
} // namespace ros

#endif // BWI_KR_EXECUTION_MESSAGE_ASPFLUENT_H
