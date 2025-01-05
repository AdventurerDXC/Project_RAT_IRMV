// Generated by gencpp from file inv_kinematics/servo_pos.msg
// DO NOT EDIT!


#ifndef INV_KINEMATICS_MESSAGE_SERVO_POS_H
#define INV_KINEMATICS_MESSAGE_SERVO_POS_H


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
struct servo_pos_
{
  typedef servo_pos_<ContainerAllocator> Type;

  servo_pos_()
    : servo_FL()
    , servo_FR()
    , servo_BL()
    , servo_BR()  {
    }
  servo_pos_(const ContainerAllocator& _alloc)
    : servo_FL(_alloc)
    , servo_FR(_alloc)
    , servo_BL(_alloc)
    , servo_BR(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector<float, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<float>> _servo_FL_type;
  _servo_FL_type servo_FL;

   typedef std::vector<float, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<float>> _servo_FR_type;
  _servo_FR_type servo_FR;

   typedef std::vector<float, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<float>> _servo_BL_type;
  _servo_BL_type servo_BL;

   typedef std::vector<float, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<float>> _servo_BR_type;
  _servo_BR_type servo_BR;





  typedef boost::shared_ptr< ::inv_kinematics::servo_pos_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::inv_kinematics::servo_pos_<ContainerAllocator> const> ConstPtr;

}; // struct servo_pos_

typedef ::inv_kinematics::servo_pos_<std::allocator<void> > servo_pos;

typedef boost::shared_ptr< ::inv_kinematics::servo_pos > servo_posPtr;
typedef boost::shared_ptr< ::inv_kinematics::servo_pos const> servo_posConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::inv_kinematics::servo_pos_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::inv_kinematics::servo_pos_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::inv_kinematics::servo_pos_<ContainerAllocator1> & lhs, const ::inv_kinematics::servo_pos_<ContainerAllocator2> & rhs)
{
  return lhs.servo_FL == rhs.servo_FL &&
    lhs.servo_FR == rhs.servo_FR &&
    lhs.servo_BL == rhs.servo_BL &&
    lhs.servo_BR == rhs.servo_BR;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::inv_kinematics::servo_pos_<ContainerAllocator1> & lhs, const ::inv_kinematics::servo_pos_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace inv_kinematics

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::inv_kinematics::servo_pos_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::inv_kinematics::servo_pos_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::inv_kinematics::servo_pos_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::inv_kinematics::servo_pos_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::inv_kinematics::servo_pos_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::inv_kinematics::servo_pos_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::inv_kinematics::servo_pos_<ContainerAllocator> >
{
  static const char* value()
  {
    return "227a6f2238ca813c514b004a793abc3a";
  }

  static const char* value(const ::inv_kinematics::servo_pos_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x227a6f2238ca813cULL;
  static const uint64_t static_value2 = 0x514b004a793abc3aULL;
};

template<class ContainerAllocator>
struct DataType< ::inv_kinematics::servo_pos_<ContainerAllocator> >
{
  static const char* value()
  {
    return "inv_kinematics/servo_pos";
  }

  static const char* value(const ::inv_kinematics::servo_pos_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::inv_kinematics::servo_pos_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# 四足机器狗的舵机目标角度，各数组长度为3\n"
"float32[] servo_FL  # 左前腿\n"
"float32[] servo_FR  # 右前腿\n"
"float32[] servo_BL  # 左后腿\n"
"float32[] servo_BR  # 右后腿\n"
;
  }

  static const char* value(const ::inv_kinematics::servo_pos_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::inv_kinematics::servo_pos_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.servo_FL);
      stream.next(m.servo_FR);
      stream.next(m.servo_BL);
      stream.next(m.servo_BR);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct servo_pos_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::inv_kinematics::servo_pos_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::inv_kinematics::servo_pos_<ContainerAllocator>& v)
  {
    s << indent << "servo_FL[]" << std::endl;
    for (size_t i = 0; i < v.servo_FL.size(); ++i)
    {
      s << indent << "  servo_FL[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.servo_FL[i]);
    }
    s << indent << "servo_FR[]" << std::endl;
    for (size_t i = 0; i < v.servo_FR.size(); ++i)
    {
      s << indent << "  servo_FR[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.servo_FR[i]);
    }
    s << indent << "servo_BL[]" << std::endl;
    for (size_t i = 0; i < v.servo_BL.size(); ++i)
    {
      s << indent << "  servo_BL[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.servo_BL[i]);
    }
    s << indent << "servo_BR[]" << std::endl;
    for (size_t i = 0; i < v.servo_BR.size(); ++i)
    {
      s << indent << "  servo_BR[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.servo_BR[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // INV_KINEMATICS_MESSAGE_SERVO_POS_H