# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from penu/LenCmd.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class LenCmd(genpy.Message):
  _md5sum = "0df90e8fef6c46a006fc379e47a36ad2"
  _type = "penu/LenCmd"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """# length control command
uint16 len_cmd1
uint16 len_cmd2
uint16 len_cmd3
uint16 len_cmd4
"""
  __slots__ = ['len_cmd1','len_cmd2','len_cmd3','len_cmd4']
  _slot_types = ['uint16','uint16','uint16','uint16']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       len_cmd1,len_cmd2,len_cmd3,len_cmd4

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(LenCmd, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.len_cmd1 is None:
        self.len_cmd1 = 0
      if self.len_cmd2 is None:
        self.len_cmd2 = 0
      if self.len_cmd3 is None:
        self.len_cmd3 = 0
      if self.len_cmd4 is None:
        self.len_cmd4 = 0
    else:
      self.len_cmd1 = 0
      self.len_cmd2 = 0
      self.len_cmd3 = 0
      self.len_cmd4 = 0

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_4H().pack(_x.len_cmd1, _x.len_cmd2, _x.len_cmd3, _x.len_cmd4))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      _x = self
      start = end
      end += 8
      (_x.len_cmd1, _x.len_cmd2, _x.len_cmd3, _x.len_cmd4,) = _get_struct_4H().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_4H().pack(_x.len_cmd1, _x.len_cmd2, _x.len_cmd3, _x.len_cmd4))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      _x = self
      start = end
      end += 8
      (_x.len_cmd1, _x.len_cmd2, _x.len_cmd3, _x.len_cmd4,) = _get_struct_4H().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_4H = None
def _get_struct_4H():
    global _struct_4H
    if _struct_4H is None:
        _struct_4H = struct.Struct("<4H")
    return _struct_4H
