// Generated by gencpp from file bwi_msgs/SemanticParserRequest.msg
// DO NOT EDIT!


#ifndef BWI_MSGS_MESSAGE_SEMANTICPARSERREQUEST_H
#define BWI_MSGS_MESSAGE_SEMANTICPARSERREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace bwi_msgs
{
template <class ContainerAllocator>
struct SemanticParserRequest_
{
  typedef SemanticParserRequest_<ContainerAllocator> Type;

  SemanticParserRequest_()
    : type(0)
    , input_text()  {
    }
  SemanticParserRequest_(const ContainerAllocator& _alloc)
    : type(0)
    , input_text(_alloc)  {
    }



   typedef int32_t _type_type;
  _type_type type;

   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _input_text_type;
  _input_text_type input_text;


    enum { QUESTION_ASKING = 0 };
     enum { TRAINING = 1 };
     enum { STARTOVER = 2 };
     enum { GETID = 3 };
 

  typedef boost::shared_ptr< ::bwi_msgs::SemanticParserRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::bwi_msgs::SemanticParserRequest_<ContainerAllocator> const> ConstPtr;

}; // struct SemanticParserRequest_

typedef ::bwi_msgs::SemanticParserRequest_<std::allocator<void> > SemanticParserRequest;

typedef boost::shared_ptr< ::bwi_msgs::SemanticParserRequest > SemanticParserRequestPtr;
typedef boost::shared_ptr< ::bwi_msgs::SemanticParserRequest const> SemanticParserRequestConstPtr;

// constants requiring out of line definition

   

   

   

   



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::bwi_msgs::SemanticParserRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::bwi_msgs::SemanticParserRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace bwi_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'bwi_planning_common': ['/home/avengineer/alfred_ws/sim_alfred/src/bwi_common/bwi_planning_common/msg'], 'actionlib_msgs': ['/opt/ros/indigo/share/actionlib_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/indigo/share/std_msgs/cmake/../msg'], 'bwi_msgs': ['/home/avengineer/alfred_ws/sim_alfred/src/bwi_common/bwi_msgs/msg', '/home/avengineer/alfred_ws/sim_alfred/devel/share/bwi_msgs/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::bwi_msgs::SemanticParserRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::bwi_msgs::SemanticParserRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::bwi_msgs::SemanticParserRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::bwi_msgs::SemanticParserRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::bwi_msgs::SemanticParserRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::bwi_msgs::SemanticParserRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::bwi_msgs::SemanticParserRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "1250825de9ebfa59119ec6348d0f8a79";
  }

  static const char* value(const ::bwi_msgs::SemanticParserRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x1250825de9ebfa59ULL;
  static const uint64_t static_value2 = 0x119ec6348d0f8a79ULL;
};

template<class ContainerAllocator>
struct DataType< ::bwi_msgs::SemanticParserRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bwi_msgs/SemanticParserRequest";
  }

  static const char* value(const ::bwi_msgs::SemanticParserRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::bwi_msgs::SemanticParserRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n\
int32 QUESTION_ASKING = 0\n\
int32 TRAINING = 1\n\
int32 STARTOVER = 2\n\
int32 GETID = 3\n\
\n\
int32 type\n\
string input_text\n\
";
  }

  static const char* value(const ::bwi_msgs::SemanticParserRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::bwi_msgs::SemanticParserRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.type);
      stream.next(m.input_text);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct SemanticParserRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::bwi_msgs::SemanticParserRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::bwi_msgs::SemanticParserRequest_<ContainerAllocator>& v)
  {
    s << indent << "type: ";
    Printer<int32_t>::stream(s, indent + "  ", v.type);
    s << indent << "input_text: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.input_text);
  }
};

} // namespace message_operations
} // namespace ros

#endif // BWI_MSGS_MESSAGE_SEMANTICPARSERREQUEST_H
