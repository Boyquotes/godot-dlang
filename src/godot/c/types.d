module godot.c.types;

public import core.stdc.stddef : wchar_t;

enum GODOT_API_VERSION = 1;

////// Error

enum godot_error {
	GODOT_OK,
	GODOT_FAILED, ///< Generic fail error
	GODOT_ERR_UNAVAILABLE, ///< What is requested is unsupported/unavailable
	GODOT_ERR_UNCONFIGURED, ///< The object being used hasnt been properly set up yet
	GODOT_ERR_UNAUTHORIZED, ///< Missing credentials for requested resource
	GODOT_ERR_PARAMETER_RANGE_ERROR, ///< Parameter given out of range (5)
	GODOT_ERR_OUT_OF_MEMORY, ///< Out of memory
	GODOT_ERR_FILE_NOT_FOUND,
	GODOT_ERR_FILE_BAD_DRIVE,
	GODOT_ERR_FILE_BAD_PATH,
	GODOT_ERR_FILE_NO_PERMISSION, // (10)
	GODOT_ERR_FILE_ALREADY_IN_USE,
	GODOT_ERR_FILE_CANT_OPEN,
	GODOT_ERR_FILE_CANT_WRITE,
	GODOT_ERR_FILE_CANT_READ,
	GODOT_ERR_FILE_UNRECOGNIZED, // (15)
	GODOT_ERR_FILE_CORRUPT,
	GODOT_ERR_FILE_MISSING_DEPENDENCIES,
	GODOT_ERR_FILE_EOF,
	GODOT_ERR_CANT_OPEN, ///< Can't open a resource/socket/file
	GODOT_ERR_CANT_CREATE, // (20)
	GODOT_ERR_QUERY_FAILED,
	GODOT_ERR_ALREADY_IN_USE,
	GODOT_ERR_LOCKED, ///< resource is locked
	GODOT_ERR_TIMEOUT,
	GODOT_ERR_CANT_CONNECT, // (25)
	GODOT_ERR_CANT_RESOLVE,
	GODOT_ERR_CONNECTION_ERROR,
	GODOT_ERR_CANT_ACQUIRE_RESOURCE,
	GODOT_ERR_CANT_FORK,
	GODOT_ERR_INVALID_DATA, ///< Data passed is invalid	(30)
	GODOT_ERR_INVALID_PARAMETER, ///< Parameter passed is invalid
	GODOT_ERR_ALREADY_EXISTS, ///< When adding, item already exists
	GODOT_ERR_DOES_NOT_EXIST, ///< When retrieving/erasing, it item does not exist
	GODOT_ERR_DATABASE_CANT_READ, ///< database is full
	GODOT_ERR_DATABASE_CANT_WRITE, ///< database is full	(35)
	GODOT_ERR_COMPILATION_FAILED,
	GODOT_ERR_METHOD_NOT_FOUND,
	GODOT_ERR_LINK_FAILED,
	GODOT_ERR_SCRIPT_FAILED,
	GODOT_ERR_CYCLIC_LINK, // (40)
	GODOT_ERR_INVALID_DECLARATION,
	GODOT_ERR_DUPLICATE_SYMBOL,
	GODOT_ERR_PARSE_ERROR,
	GODOT_ERR_BUSY,
	GODOT_ERR_SKIP, // (45)
	GODOT_ERR_HELP, ///< user requested help!!
	GODOT_ERR_BUG, ///< a bug in the software certainly happened, due to a double check failing or unexpected behavior.
	GODOT_ERR_PRINTER_ON_FIRE, /// the parallel port printer is engulfed in flames
	GODOT_ERR_OMFG_THIS_IS_VERY_VERY_BAD, ///< shit happens, has never been used, though
	GODOT_ERR_WTF = GODOT_ERR_OMFG_THIS_IS_VERY_VERY_BAD ///< short version of the above
}

////// bool

alias godot_bool = int; // really `bool` = `_Bool` from C's stdbool.h

enum GODOT_TRUE = 1;
enum GODOT_FALSE = 0;

/////// int

alias godot_int = int; // C++'s int; Godot assumes it to be always 32 bits.

/////// real

alias godot_real = float;

/////// Object reference (type-safe void pointer)
struct godot_object
{
	package(godot) void* ptr;
}

// core types
// NOTE: quite a few of these have sizes that cause D to generate incorrect
// calling convention for SysV ABI (bugs 5570 & 13207). Partial workaround is
// using larger integers instead of byte arrays. Needs fixing eventually...

struct godot_array
{
	size_t _opaque;
}
struct godot_basis
{
	uint[9] _opaque;
}
struct godot_color
{
	ulong[2] _opaque;
}
struct godot_dictionary
{
	size_t _opaque;
}
struct godot_node_path
{
	size_t _opaque;
}
struct godot_plane
{
	ulong[2] _opaque;
}
struct godot_pool_byte_array
{
	size_t _opaque;
}
struct godot_pool_int_array
{
	size_t _opaque;
}
struct godot_pool_real_array
{
	size_t _opaque;
}
struct godot_pool_string_array
{
	size_t _opaque;
}
struct godot_pool_vector2_array
{
	size_t _opaque;
}
struct godot_pool_vector3_array
{
	size_t _opaque;
}
struct godot_pool_color_array
{
	size_t _opaque;
}
struct godot_quat
{
	ulong[2] _opaque;
}
struct godot_rect2
{
	ulong[2] _opaque;
}
struct godot_rect3
{
	ulong[3] _opaque;
}
struct godot_rid
{
	size_t _opaque;
}
struct godot_string
{
	size_t _opaque;
}
struct godot_string_name
{
	size_t _opaque;
}
struct godot_transform
{
	ulong[6] _opaque;
}
struct godot_transform2d
{
	ulong[3] _opaque;
}
struct godot_variant
{
	ulong[2] _opaque;
	size_t _opaque2;
}
enum godot_variant_type
{
	GODOT_VARIANT_TYPE_NIL,

	// atomic types
	GODOT_VARIANT_TYPE_BOOL,
	GODOT_VARIANT_TYPE_INT,
	GODOT_VARIANT_TYPE_REAL,
	GODOT_VARIANT_TYPE_STRING,

	// math types

	GODOT_VARIANT_TYPE_VECTOR2, // 5
	GODOT_VARIANT_TYPE_RECT2,
	GODOT_VARIANT_TYPE_VECTOR3,
	GODOT_VARIANT_TYPE_TRANSFORM2D,
	GODOT_VARIANT_TYPE_PLANE,
	GODOT_VARIANT_TYPE_QUAT, // 10
	GODOT_VARIANT_TYPE_RECT3,
	GODOT_VARIANT_TYPE_BASIS,
	GODOT_VARIANT_TYPE_TRANSFORM,

	// misc types
	GODOT_VARIANT_TYPE_COLOR,
	GODOT_VARIANT_TYPE_NODE_PATH, // 15
	GODOT_VARIANT_TYPE_RID,
	GODOT_VARIANT_TYPE_OBJECT,
	GODOT_VARIANT_TYPE_DICTIONARY,
	GODOT_VARIANT_TYPE_ARRAY, // 20

	// arrays
	GODOT_VARIANT_TYPE_POOL_BYTE_ARRAY,
	GODOT_VARIANT_TYPE_POOL_INT_ARRAY,
	GODOT_VARIANT_TYPE_POOL_REAL_ARRAY,
	GODOT_VARIANT_TYPE_POOL_STRING_ARRAY,
	GODOT_VARIANT_TYPE_POOL_VECTOR2_ARRAY, // 25
	GODOT_VARIANT_TYPE_POOL_VECTOR3_ARRAY,
	GODOT_VARIANT_TYPE_POOL_COLOR_ARRAY,
}
enum godot_variant_call_error_error
{
	GODOT_CALL_ERROR_CALL_OK,
	GODOT_CALL_ERROR_CALL_ERROR_INVALID_METHOD,
	GODOT_CALL_ERROR_CALL_ERROR_INVALID_ARGUMENT,
	GODOT_CALL_ERROR_CALL_ERROR_TOO_MANY_ARGUMENTS,
	GODOT_CALL_ERROR_CALL_ERROR_TOO_FEW_ARGUMENTS,
	GODOT_CALL_ERROR_CALL_ERROR_INSTANCE_IS_NULL,
}
struct godot_variant_call_error
{
	godot_variant_call_error_error error;
	int argument;
	godot_variant_type expected;
}
struct godot_vector2
{
	ulong _opaque;
}
struct godot_vector3
{
	uint[3] _opaque;
}
enum godot_vector3_axis
{
	GODOT_VECTOR3_AXIS_X,
	GODOT_VECTOR3_AXIS_Y,
	GODOT_VECTOR3_AXIS_Z,
}


