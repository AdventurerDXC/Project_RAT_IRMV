// Generated by gencpp from file inv_kinematics/motor_pos.msg
// DO NOT EDIT!


#ifndef INV_KINEMATICS_MESSAGE_MOTOR_POS_H
#define INV_KINEMATICS_MESSAGE_MOTOR_POS_H


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
struct motor_pos_
{
  typedef motor_pos_<ContainerAllocator> Type;

  motor_pos_()
    : rollAng(0.0)
    , pitchAng1(0.0)
    , pitchAng2(0.0)  {
    }
  motor_pos_(const ContainerAllocator& _alloc)
    : rollAng(0.0)
    , pitchAng1(0.0)
    , pitchAng2(0.0)  {
  (void)_alloc;
    }



   typedef double _rollAng_type;
  _rollAng_type rollAng;

   typedef double _pitchAng1_type;
  _pitchAng1_type pitchAng1;

   typedef double _pitchAng2_type;
  _pitchAng2_type pitchAng2;





  typedef boost::shared_ptr< ::inv_kinematics::motor_pos_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::inv_kinematics::motor_pos_<ContainerAllocator> const> ConstPtr;

}; // struct motor_pos_

typedef ::inv_kinematics::motor_pos_<std::allocator<void> > motor_pos;

typedef boost::shared_ptr< ::inv_kinematics::motor_pos > motor_posPtr;
typedef boost::shared_ptr< ::inv_kinematics::motor_pos const> motor_posConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::inv_kinematics::motor_pos_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::inv_kinematics::motor_pos_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::inv_kinematics::motor_pos_<ContainerAllocator1> & lhs, const ::inv_kinematics::motor_pos_<ContainerAllocator2> & rhs)
{
  return lhs.rollAng == rhs.rollAng &&
    lhs.pitchAng1 == rhs.pitchAng1 &&
    lhs.pitchAng2 == rhs.pitchAng2;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::inv_kinematics::motor_pos_<ContainerAllocator1> & lhs, const ::inv_kinematics::motor_pos_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace inv_kinematics

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::inv_kinematics::motor_pos_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::inv_kinematics::motor_pos_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::inv_kinematics::motor_pos_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::inv_kinematics::motor_pos_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::inv_kinematics::motor_pos_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::inv_kinematics::motor_pos_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::inv_kinematics::motor_pos_<ContainerAllocator> >
{
  static const char* value()
  {
    return "5ad27313b2960340abbf9c4777f37f7a";
  }

  static const char* value(const ::inv_kinematics::motor_pos_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x5ad27313b2960340ULL;
  static const uint64_t static_value2 = 0xabbf9c4777f37f7aULL;
};

template<class ContainerAllocator>
struct DataType< ::inv_kinematics::motor_pos_<ContainerAllocator> >
{
  static const char* value()
  {
    return "inv_kinematics/motor_pos";
  }

  static const char* value(const ::inv_kinematics::motor_pos_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::inv_kinematics::motor_pos_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64 rollAng\n"
"float64 pitchAng1\n"
"float64 pitchAng2\n"
;
  }

  static const char* value(const ::inv_kinematics::motor_pos_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::inv_kinematics::motor_pos_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.rollAng);
      stream.next(m.pitchAng1);
      stream.next(m.pitchAng2);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct motor_pos_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::inv_kinematics::motor_pos_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::inv_kinematics::motor_pos_<ContainerAllocator>& v)
  {
    s << indent << "rollAng: ";
    Printer<double>::stream(s, indent + "  ", v.rollAng);
    s << indent << "pitchAng1: ";
    Printer<double>::stream(s, indent + "  ", v.pitchAng1);
    s << indent << "pitchAng2: ";
    Printer<double>::stream(s, indent + "  ", v.pitchAng2);
  }
};

} // namespace message_operations
} // namespace ros

#endif // INV_KINEMATICS_MESSAGE_MOTOR_POS_H
