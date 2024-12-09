// Generated by gencpp from file inv_kinematics/footend_pos.msg
// DO NOT EDIT!


#ifndef INV_KINEMATICS_MESSAGE_FOOTEND_POS_H
#define INV_KINEMATICS_MESSAGE_FOOTEND_POS_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace inv_kinematics
{
template <class ContainerAllocator>
struct footend_pos_
{
  typedef footend_pos_<ContainerAllocator> Type;

  footend_pos_()
    : x(0.0)
    , y(0.0)
    , z(0.0)  {
    }
  footend_pos_(const ContainerAllocator& _alloc)
    : x(0.0)
    , y(0.0)
    , z(0.0)  {
  (void)_alloc;
    }



   typedef double _x_type;
  _x_type x;

   typedef double _y_type;
  _y_type y;

   typedef double _z_type;
  _z_type z;





  typedef boost::shared_ptr< ::inv_kinematics::footend_pos_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::inv_kinematics::footend_pos_<ContainerAllocator> const> ConstPtr;

}; // struct footend_pos_

typedef ::inv_kinematics::footend_pos_<std::allocator<void> > footend_pos;

typedef boost::shared_ptr< ::inv_kinematics::footend_pos > footend_posPtr;
typedef boost::shared_ptr< ::inv_kinematics::footend_pos const> footend_posConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::inv_kinematics::footend_pos_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::inv_kinematics::footend_pos_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::inv_kinematics::footend_pos_<ContainerAllocator1> & lhs, const ::inv_kinematics::footend_pos_<ContainerAllocator2> & rhs)
{
  return lhs.x == rhs.x &&
    lhs.y == rhs.y &&
    lhs.z == rhs.z;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::inv_kinematics::footend_pos_<ContainerAllocator1> & lhs, const ::inv_kinematics::footend_pos_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace inv_kinematics

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::inv_kinematics::footend_pos_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::inv_kinematics::footend_pos_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::inv_kinematics::footend_pos_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::inv_kinematics::footend_pos_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::inv_kinematics::footend_pos_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::inv_kinematics::footend_pos_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::inv_kinematics::footend_pos_<ContainerAllocator> >
{
  static const char* value()
  {
    return "4a842b65f413084dc2b10fb484ea7f17";
  }

  static const char* value(const ::inv_kinematics::footend_pos_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x4a842b65f413084dULL;
  static const uint64_t static_value2 = 0xc2b10fb484ea7f17ULL;
};

template<class ContainerAllocator>
struct DataType< ::inv_kinematics::footend_pos_<ContainerAllocator> >
{
  static const char* value()
  {
    return "inv_kinematics/footend_pos";
  }

  static const char* value(const ::inv_kinematics::footend_pos_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::inv_kinematics::footend_pos_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64 x\n"
"float64 y\n"
"float64 z\n"
;
  }

  static const char* value(const ::inv_kinematics::footend_pos_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::inv_kinematics::footend_pos_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.x);
      stream.next(m.y);
      stream.next(m.z);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct footend_pos_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::inv_kinematics::footend_pos_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::inv_kinematics::footend_pos_<ContainerAllocator>& v)
  {
    s << indent << "x: ";
    Printer<double>::stream(s, indent + "  ", v.x);
    s << indent << "y: ";
    Printer<double>::stream(s, indent + "  ", v.y);
    s << indent << "z: ";
    Printer<double>::stream(s, indent + "  ", v.z);
  }
};

} // namespace message_operations
} // namespace ros

#endif // INV_KINEMATICS_MESSAGE_FOOTEND_POS_H