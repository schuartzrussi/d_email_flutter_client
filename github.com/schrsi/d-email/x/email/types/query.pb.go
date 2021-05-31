// Code generated by protoc-gen-gogo. DO NOT EDIT.
// source: cosmos/email/query.proto

package types

import (
	context "context"
	fmt "fmt"
	query "github.com/cosmos/cosmos-sdk/types/query"
	grpc1 "github.com/gogo/protobuf/grpc"
	proto "github.com/gogo/protobuf/proto"
	_ "google.golang.org/genproto/googleapis/api/annotations"
	grpc "google.golang.org/grpc"
	codes "google.golang.org/grpc/codes"
	status "google.golang.org/grpc/status"
	io "io"
	math "math"
	math_bits "math/bits"
)

// Reference imports to suppress errors if they are not otherwise used.
var _ = proto.Marshal
var _ = fmt.Errorf
var _ = math.Inf

// This is a compile-time assertion to ensure that this generated file
// is compatible with the proto package it is being compiled against.
// A compilation error at this line likely means your copy of the
// proto package needs to be updated.
const _ = proto.GoGoProtoPackageIsVersion3 // please upgrade the proto package

type QueryGetEmailByIdRequest struct {
	Id string `protobuf:"bytes,1,opt,name=id,proto3" json:"id,omitempty"`
}

func (m *QueryGetEmailByIdRequest) Reset()         { *m = QueryGetEmailByIdRequest{} }
func (m *QueryGetEmailByIdRequest) String() string { return proto.CompactTextString(m) }
func (*QueryGetEmailByIdRequest) ProtoMessage()    {}
func (*QueryGetEmailByIdRequest) Descriptor() ([]byte, []int) {
	return fileDescriptor_fa16dec23e68f76c, []int{0}
}
func (m *QueryGetEmailByIdRequest) XXX_Unmarshal(b []byte) error {
	return m.Unmarshal(b)
}
func (m *QueryGetEmailByIdRequest) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	if deterministic {
		return xxx_messageInfo_QueryGetEmailByIdRequest.Marshal(b, m, deterministic)
	} else {
		b = b[:cap(b)]
		n, err := m.MarshalToSizedBuffer(b)
		if err != nil {
			return nil, err
		}
		return b[:n], nil
	}
}
func (m *QueryGetEmailByIdRequest) XXX_Merge(src proto.Message) {
	xxx_messageInfo_QueryGetEmailByIdRequest.Merge(m, src)
}
func (m *QueryGetEmailByIdRequest) XXX_Size() int {
	return m.Size()
}
func (m *QueryGetEmailByIdRequest) XXX_DiscardUnknown() {
	xxx_messageInfo_QueryGetEmailByIdRequest.DiscardUnknown(m)
}

var xxx_messageInfo_QueryGetEmailByIdRequest proto.InternalMessageInfo

func (m *QueryGetEmailByIdRequest) GetId() string {
	if m != nil {
		return m.Id
	}
	return ""
}

type QueryGetEmailResponse struct {
	Email *Email `protobuf:"bytes,1,opt,name=Email,proto3" json:"Email,omitempty"`
}

func (m *QueryGetEmailResponse) Reset()         { *m = QueryGetEmailResponse{} }
func (m *QueryGetEmailResponse) String() string { return proto.CompactTextString(m) }
func (*QueryGetEmailResponse) ProtoMessage()    {}
func (*QueryGetEmailResponse) Descriptor() ([]byte, []int) {
	return fileDescriptor_fa16dec23e68f76c, []int{1}
}
func (m *QueryGetEmailResponse) XXX_Unmarshal(b []byte) error {
	return m.Unmarshal(b)
}
func (m *QueryGetEmailResponse) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	if deterministic {
		return xxx_messageInfo_QueryGetEmailResponse.Marshal(b, m, deterministic)
	} else {
		b = b[:cap(b)]
		n, err := m.MarshalToSizedBuffer(b)
		if err != nil {
			return nil, err
		}
		return b[:n], nil
	}
}
func (m *QueryGetEmailResponse) XXX_Merge(src proto.Message) {
	xxx_messageInfo_QueryGetEmailResponse.Merge(m, src)
}
func (m *QueryGetEmailResponse) XXX_Size() int {
	return m.Size()
}
func (m *QueryGetEmailResponse) XXX_DiscardUnknown() {
	xxx_messageInfo_QueryGetEmailResponse.DiscardUnknown(m)
}

var xxx_messageInfo_QueryGetEmailResponse proto.InternalMessageInfo

func (m *QueryGetEmailResponse) GetEmail() *Email {
	if m != nil {
		return m.Email
	}
	return nil
}

type QueryAllEmailRequest struct {
	Pagination *query.PageRequest `protobuf:"bytes,1,opt,name=pagination,proto3" json:"pagination,omitempty"`
}

func (m *QueryAllEmailRequest) Reset()         { *m = QueryAllEmailRequest{} }
func (m *QueryAllEmailRequest) String() string { return proto.CompactTextString(m) }
func (*QueryAllEmailRequest) ProtoMessage()    {}
func (*QueryAllEmailRequest) Descriptor() ([]byte, []int) {
	return fileDescriptor_fa16dec23e68f76c, []int{2}
}
func (m *QueryAllEmailRequest) XXX_Unmarshal(b []byte) error {
	return m.Unmarshal(b)
}
func (m *QueryAllEmailRequest) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	if deterministic {
		return xxx_messageInfo_QueryAllEmailRequest.Marshal(b, m, deterministic)
	} else {
		b = b[:cap(b)]
		n, err := m.MarshalToSizedBuffer(b)
		if err != nil {
			return nil, err
		}
		return b[:n], nil
	}
}
func (m *QueryAllEmailRequest) XXX_Merge(src proto.Message) {
	xxx_messageInfo_QueryAllEmailRequest.Merge(m, src)
}
func (m *QueryAllEmailRequest) XXX_Size() int {
	return m.Size()
}
func (m *QueryAllEmailRequest) XXX_DiscardUnknown() {
	xxx_messageInfo_QueryAllEmailRequest.DiscardUnknown(m)
}

var xxx_messageInfo_QueryAllEmailRequest proto.InternalMessageInfo

func (m *QueryAllEmailRequest) GetPagination() *query.PageRequest {
	if m != nil {
		return m.Pagination
	}
	return nil
}

type QueryAllEmailResponse struct {
	Email      []*Email            `protobuf:"bytes,1,rep,name=Email,proto3" json:"Email,omitempty"`
	Pagination *query.PageResponse `protobuf:"bytes,2,opt,name=pagination,proto3" json:"pagination,omitempty"`
}

func (m *QueryAllEmailResponse) Reset()         { *m = QueryAllEmailResponse{} }
func (m *QueryAllEmailResponse) String() string { return proto.CompactTextString(m) }
func (*QueryAllEmailResponse) ProtoMessage()    {}
func (*QueryAllEmailResponse) Descriptor() ([]byte, []int) {
	return fileDescriptor_fa16dec23e68f76c, []int{3}
}
func (m *QueryAllEmailResponse) XXX_Unmarshal(b []byte) error {
	return m.Unmarshal(b)
}
func (m *QueryAllEmailResponse) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	if deterministic {
		return xxx_messageInfo_QueryAllEmailResponse.Marshal(b, m, deterministic)
	} else {
		b = b[:cap(b)]
		n, err := m.MarshalToSizedBuffer(b)
		if err != nil {
			return nil, err
		}
		return b[:n], nil
	}
}
func (m *QueryAllEmailResponse) XXX_Merge(src proto.Message) {
	xxx_messageInfo_QueryAllEmailResponse.Merge(m, src)
}
func (m *QueryAllEmailResponse) XXX_Size() int {
	return m.Size()
}
func (m *QueryAllEmailResponse) XXX_DiscardUnknown() {
	xxx_messageInfo_QueryAllEmailResponse.DiscardUnknown(m)
}

var xxx_messageInfo_QueryAllEmailResponse proto.InternalMessageInfo

func (m *QueryAllEmailResponse) GetEmail() []*Email {
	if m != nil {
		return m.Email
	}
	return nil
}

func (m *QueryAllEmailResponse) GetPagination() *query.PageResponse {
	if m != nil {
		return m.Pagination
	}
	return nil
}

func init() {
	proto.RegisterType((*QueryGetEmailByIdRequest)(nil), "schrsi.demail.email.QueryGetEmailByIdRequest")
	proto.RegisterType((*QueryGetEmailResponse)(nil), "schrsi.demail.email.QueryGetEmailResponse")
	proto.RegisterType((*QueryAllEmailRequest)(nil), "schrsi.demail.email.QueryAllEmailRequest")
	proto.RegisterType((*QueryAllEmailResponse)(nil), "schrsi.demail.email.QueryAllEmailResponse")
}

func init() { proto.RegisterFile("cosmos/email/query.proto", fileDescriptor_fa16dec23e68f76c) }

var fileDescriptor_fa16dec23e68f76c = []byte{
	// 407 bytes of a gzipped FileDescriptorProto
	0x1f, 0x8b, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0xff, 0x8c, 0x92, 0xbf, 0x6e, 0x1a, 0x31,
	0x1c, 0xc7, 0xf1, 0x55, 0x54, 0xc5, 0x95, 0x3a, 0xb8, 0xad, 0x84, 0x4e, 0xe8, 0xda, 0xde, 0x50,
	0x5a, 0x24, 0xec, 0x42, 0x9f, 0x00, 0xa4, 0x16, 0xb1, 0x25, 0x37, 0x66, 0x88, 0xe4, 0xe3, 0xac,
	0xc3, 0xd2, 0x71, 0x3e, 0xb0, 0x89, 0x82, 0xa2, 0x2c, 0x91, 0x32, 0x27, 0x4a, 0x9e, 0x20, 0x6f,
	0x93, 0x11, 0x29, 0x4b, 0xc6, 0x08, 0xf2, 0x20, 0x11, 0xb6, 0xc3, 0xbf, 0x40, 0xc8, 0xe2, 0xc1,
	0xfe, 0xfe, 0xf9, 0xf8, 0x67, 0xc3, 0x62, 0x47, 0xc8, 0x9e, 0x90, 0x84, 0xf5, 0x28, 0x4f, 0x48,
	0x7f, 0xc8, 0x06, 0x23, 0x9c, 0x0d, 0x84, 0x12, 0xe8, 0xb3, 0xec, 0x74, 0x07, 0x92, 0xe3, 0x48,
	0x1f, 0x61, 0xbd, 0xba, 0xa5, 0x58, 0x88, 0x38, 0x61, 0x84, 0x66, 0x9c, 0xd0, 0x34, 0x15, 0x8a,
	0x2a, 0x2e, 0x52, 0x69, 0x2c, 0x6e, 0xc5, 0x86, 0x85, 0x54, 0x32, 0x93, 0x45, 0x8e, 0x6a, 0x21,
	0x53, 0xb4, 0x46, 0x32, 0x1a, 0xf3, 0x54, 0x8b, 0xad, 0x76, 0xb5, 0xd8, 0x74, 0xe8, 0x13, 0xbf,
	0x02, 0x8b, 0xfb, 0x33, 0x6f, 0x8b, 0xa9, 0x7f, 0xb3, 0xed, 0xe6, 0xa8, 0x1d, 0x05, 0xac, 0x3f,
	0x64, 0x52, 0xa1, 0x4f, 0xd0, 0xe1, 0x51, 0x11, 0x7c, 0x07, 0xbf, 0x0a, 0x81, 0xc3, 0x23, 0xbf,
	0x0d, 0xbf, 0xae, 0x68, 0x03, 0x26, 0x33, 0x91, 0x4a, 0x86, 0xfe, 0xc0, 0xbc, 0xde, 0xd0, 0xda,
	0x8f, 0x75, 0x17, 0x6f, 0xb8, 0x0d, 0x36, 0x16, 0x23, 0xf4, 0x0f, 0xe1, 0x17, 0x1d, 0xd5, 0x48,
	0x12, 0x1b, 0x65, 0x2a, 0xff, 0x43, 0xb8, 0x80, 0xb7, 0x71, 0x3f, 0xb1, 0xa1, 0xc7, 0xb3, 0x9b,
	0x62, 0x33, 0x35, 0x7b, 0x53, 0xbc, 0x47, 0x63, 0x66, 0xbd, 0xc1, 0x92, 0xd3, 0xbf, 0x02, 0x96,
	0x75, 0x51, 0xf0, 0x92, 0xf5, 0xdd, 0x9b, 0x58, 0x51, 0x6b, 0x85, 0xc9, 0xd1, 0x4c, 0xe5, 0x9d,
	0x4c, 0xa6, 0x6e, 0x19, 0xaa, 0x7e, 0xe3, 0xc0, 0xbc, 0x86, 0x42, 0x17, 0x00, 0x16, 0xe6, 0xe3,
	0x46, 0xd5, 0x8d, 0x0c, 0xdb, 0x9e, 0xc5, 0xad, 0xec, 0x96, 0x3f, 0xd7, 0xfb, 0xe5, 0xb3, 0xbb,
	0xc7, 0x6b, 0xe7, 0x07, 0xfa, 0x46, 0x8c, 0x87, 0x44, 0x4b, 0x5f, 0xc0, 0xae, 0x27, 0x3c, 0x3a,
	0x45, 0xe7, 0x00, 0x7e, 0xd0, 0xd6, 0x46, 0x92, 0xa0, 0xdf, 0xdb, 0x1b, 0xd6, 0x1e, 0xec, 0x35,
	0x98, 0xf5, 0xd1, 0xfb, 0xbe, 0x86, 0x29, 0x21, 0x77, 0x3b, 0x4c, 0xb3, 0x71, 0x3b, 0xf1, 0xc0,
	0x78, 0xe2, 0x81, 0x87, 0x89, 0x07, 0x2e, 0xa7, 0x5e, 0x6e, 0x3c, 0xf5, 0x72, 0xf7, 0x53, 0x2f,
	0x77, 0x50, 0x8e, 0xb9, 0xea, 0x0e, 0x43, 0xdc, 0x11, 0xbd, 0xb9, 0xbf, 0x6a, 0xac, 0xc7, 0x36,
	0x42, 0x8d, 0x32, 0x26, 0xc3, 0xf7, 0xfa, 0x67, 0xff, 0x7d, 0x0a, 0x00, 0x00, 0xff, 0xff, 0xab,
	0xf7, 0xa2, 0xe0, 0x6e, 0x03, 0x00, 0x00,
}

// Reference imports to suppress errors if they are not otherwise used.
var _ context.Context
var _ grpc.ClientConn

// This is a compile-time assertion to ensure that this generated file
// is compatible with the grpc package it is being compiled against.
const _ = grpc.SupportPackageIsVersion4

// QueryClient is the client API for Query service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://godoc.org/google.golang.org/grpc#ClientConn.NewStream.
type QueryClient interface {
	EmailById(ctx context.Context, in *QueryGetEmailByIdRequest, opts ...grpc.CallOption) (*QueryGetEmailResponse, error)
	EmailAll(ctx context.Context, in *QueryAllEmailRequest, opts ...grpc.CallOption) (*QueryAllEmailResponse, error)
}

type queryClient struct {
	cc grpc1.ClientConn
}

func NewQueryClient(cc grpc1.ClientConn) QueryClient {
	return &queryClient{cc}
}

func (c *queryClient) EmailById(ctx context.Context, in *QueryGetEmailByIdRequest, opts ...grpc.CallOption) (*QueryGetEmailResponse, error) {
	out := new(QueryGetEmailResponse)
	err := c.cc.Invoke(ctx, "/schrsi.demail.email.Query/EmailById", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *queryClient) EmailAll(ctx context.Context, in *QueryAllEmailRequest, opts ...grpc.CallOption) (*QueryAllEmailResponse, error) {
	out := new(QueryAllEmailResponse)
	err := c.cc.Invoke(ctx, "/schrsi.demail.email.Query/EmailAll", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

// QueryServer is the server API for Query service.
type QueryServer interface {
	EmailById(context.Context, *QueryGetEmailByIdRequest) (*QueryGetEmailResponse, error)
	EmailAll(context.Context, *QueryAllEmailRequest) (*QueryAllEmailResponse, error)
}

// UnimplementedQueryServer can be embedded to have forward compatible implementations.
type UnimplementedQueryServer struct {
}

func (*UnimplementedQueryServer) EmailById(ctx context.Context, req *QueryGetEmailByIdRequest) (*QueryGetEmailResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method EmailById not implemented")
}
func (*UnimplementedQueryServer) EmailAll(ctx context.Context, req *QueryAllEmailRequest) (*QueryAllEmailResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method EmailAll not implemented")
}

func RegisterQueryServer(s grpc1.Server, srv QueryServer) {
	s.RegisterService(&_Query_serviceDesc, srv)
}

func _Query_EmailById_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(QueryGetEmailByIdRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(QueryServer).EmailById(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/schrsi.demail.email.Query/EmailById",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(QueryServer).EmailById(ctx, req.(*QueryGetEmailByIdRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _Query_EmailAll_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(QueryAllEmailRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(QueryServer).EmailAll(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/schrsi.demail.email.Query/EmailAll",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(QueryServer).EmailAll(ctx, req.(*QueryAllEmailRequest))
	}
	return interceptor(ctx, in, info, handler)
}

var _Query_serviceDesc = grpc.ServiceDesc{
	ServiceName: "schrsi.demail.email.Query",
	HandlerType: (*QueryServer)(nil),
	Methods: []grpc.MethodDesc{
		{
			MethodName: "EmailById",
			Handler:    _Query_EmailById_Handler,
		},
		{
			MethodName: "EmailAll",
			Handler:    _Query_EmailAll_Handler,
		},
	},
	Streams:  []grpc.StreamDesc{},
	Metadata: "cosmos/email/query.proto",
}

func (m *QueryGetEmailByIdRequest) Marshal() (dAtA []byte, err error) {
	size := m.Size()
	dAtA = make([]byte, size)
	n, err := m.MarshalToSizedBuffer(dAtA[:size])
	if err != nil {
		return nil, err
	}
	return dAtA[:n], nil
}

func (m *QueryGetEmailByIdRequest) MarshalTo(dAtA []byte) (int, error) {
	size := m.Size()
	return m.MarshalToSizedBuffer(dAtA[:size])
}

func (m *QueryGetEmailByIdRequest) MarshalToSizedBuffer(dAtA []byte) (int, error) {
	i := len(dAtA)
	_ = i
	var l int
	_ = l
	if len(m.Id) > 0 {
		i -= len(m.Id)
		copy(dAtA[i:], m.Id)
		i = encodeVarintQuery(dAtA, i, uint64(len(m.Id)))
		i--
		dAtA[i] = 0xa
	}
	return len(dAtA) - i, nil
}

func (m *QueryGetEmailResponse) Marshal() (dAtA []byte, err error) {
	size := m.Size()
	dAtA = make([]byte, size)
	n, err := m.MarshalToSizedBuffer(dAtA[:size])
	if err != nil {
		return nil, err
	}
	return dAtA[:n], nil
}

func (m *QueryGetEmailResponse) MarshalTo(dAtA []byte) (int, error) {
	size := m.Size()
	return m.MarshalToSizedBuffer(dAtA[:size])
}

func (m *QueryGetEmailResponse) MarshalToSizedBuffer(dAtA []byte) (int, error) {
	i := len(dAtA)
	_ = i
	var l int
	_ = l
	if m.Email != nil {
		{
			size, err := m.Email.MarshalToSizedBuffer(dAtA[:i])
			if err != nil {
				return 0, err
			}
			i -= size
			i = encodeVarintQuery(dAtA, i, uint64(size))
		}
		i--
		dAtA[i] = 0xa
	}
	return len(dAtA) - i, nil
}

func (m *QueryAllEmailRequest) Marshal() (dAtA []byte, err error) {
	size := m.Size()
	dAtA = make([]byte, size)
	n, err := m.MarshalToSizedBuffer(dAtA[:size])
	if err != nil {
		return nil, err
	}
	return dAtA[:n], nil
}

func (m *QueryAllEmailRequest) MarshalTo(dAtA []byte) (int, error) {
	size := m.Size()
	return m.MarshalToSizedBuffer(dAtA[:size])
}

func (m *QueryAllEmailRequest) MarshalToSizedBuffer(dAtA []byte) (int, error) {
	i := len(dAtA)
	_ = i
	var l int
	_ = l
	if m.Pagination != nil {
		{
			size, err := m.Pagination.MarshalToSizedBuffer(dAtA[:i])
			if err != nil {
				return 0, err
			}
			i -= size
			i = encodeVarintQuery(dAtA, i, uint64(size))
		}
		i--
		dAtA[i] = 0xa
	}
	return len(dAtA) - i, nil
}

func (m *QueryAllEmailResponse) Marshal() (dAtA []byte, err error) {
	size := m.Size()
	dAtA = make([]byte, size)
	n, err := m.MarshalToSizedBuffer(dAtA[:size])
	if err != nil {
		return nil, err
	}
	return dAtA[:n], nil
}

func (m *QueryAllEmailResponse) MarshalTo(dAtA []byte) (int, error) {
	size := m.Size()
	return m.MarshalToSizedBuffer(dAtA[:size])
}

func (m *QueryAllEmailResponse) MarshalToSizedBuffer(dAtA []byte) (int, error) {
	i := len(dAtA)
	_ = i
	var l int
	_ = l
	if m.Pagination != nil {
		{
			size, err := m.Pagination.MarshalToSizedBuffer(dAtA[:i])
			if err != nil {
				return 0, err
			}
			i -= size
			i = encodeVarintQuery(dAtA, i, uint64(size))
		}
		i--
		dAtA[i] = 0x12
	}
	if len(m.Email) > 0 {
		for iNdEx := len(m.Email) - 1; iNdEx >= 0; iNdEx-- {
			{
				size, err := m.Email[iNdEx].MarshalToSizedBuffer(dAtA[:i])
				if err != nil {
					return 0, err
				}
				i -= size
				i = encodeVarintQuery(dAtA, i, uint64(size))
			}
			i--
			dAtA[i] = 0xa
		}
	}
	return len(dAtA) - i, nil
}

func encodeVarintQuery(dAtA []byte, offset int, v uint64) int {
	offset -= sovQuery(v)
	base := offset
	for v >= 1<<7 {
		dAtA[offset] = uint8(v&0x7f | 0x80)
		v >>= 7
		offset++
	}
	dAtA[offset] = uint8(v)
	return base
}
func (m *QueryGetEmailByIdRequest) Size() (n int) {
	if m == nil {
		return 0
	}
	var l int
	_ = l
	l = len(m.Id)
	if l > 0 {
		n += 1 + l + sovQuery(uint64(l))
	}
	return n
}

func (m *QueryGetEmailResponse) Size() (n int) {
	if m == nil {
		return 0
	}
	var l int
	_ = l
	if m.Email != nil {
		l = m.Email.Size()
		n += 1 + l + sovQuery(uint64(l))
	}
	return n
}

func (m *QueryAllEmailRequest) Size() (n int) {
	if m == nil {
		return 0
	}
	var l int
	_ = l
	if m.Pagination != nil {
		l = m.Pagination.Size()
		n += 1 + l + sovQuery(uint64(l))
	}
	return n
}

func (m *QueryAllEmailResponse) Size() (n int) {
	if m == nil {
		return 0
	}
	var l int
	_ = l
	if len(m.Email) > 0 {
		for _, e := range m.Email {
			l = e.Size()
			n += 1 + l + sovQuery(uint64(l))
		}
	}
	if m.Pagination != nil {
		l = m.Pagination.Size()
		n += 1 + l + sovQuery(uint64(l))
	}
	return n
}

func sovQuery(x uint64) (n int) {
	return (math_bits.Len64(x|1) + 6) / 7
}
func sozQuery(x uint64) (n int) {
	return sovQuery(uint64((x << 1) ^ uint64((int64(x) >> 63))))
}
func (m *QueryGetEmailByIdRequest) Unmarshal(dAtA []byte) error {
	l := len(dAtA)
	iNdEx := 0
	for iNdEx < l {
		preIndex := iNdEx
		var wire uint64
		for shift := uint(0); ; shift += 7 {
			if shift >= 64 {
				return ErrIntOverflowQuery
			}
			if iNdEx >= l {
				return io.ErrUnexpectedEOF
			}
			b := dAtA[iNdEx]
			iNdEx++
			wire |= uint64(b&0x7F) << shift
			if b < 0x80 {
				break
			}
		}
		fieldNum := int32(wire >> 3)
		wireType := int(wire & 0x7)
		if wireType == 4 {
			return fmt.Errorf("proto: QueryGetEmailByIdRequest: wiretype end group for non-group")
		}
		if fieldNum <= 0 {
			return fmt.Errorf("proto: QueryGetEmailByIdRequest: illegal tag %d (wire type %d)", fieldNum, wire)
		}
		switch fieldNum {
		case 1:
			if wireType != 2 {
				return fmt.Errorf("proto: wrong wireType = %d for field Id", wireType)
			}
			var stringLen uint64
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return ErrIntOverflowQuery
				}
				if iNdEx >= l {
					return io.ErrUnexpectedEOF
				}
				b := dAtA[iNdEx]
				iNdEx++
				stringLen |= uint64(b&0x7F) << shift
				if b < 0x80 {
					break
				}
			}
			intStringLen := int(stringLen)
			if intStringLen < 0 {
				return ErrInvalidLengthQuery
			}
			postIndex := iNdEx + intStringLen
			if postIndex < 0 {
				return ErrInvalidLengthQuery
			}
			if postIndex > l {
				return io.ErrUnexpectedEOF
			}
			m.Id = string(dAtA[iNdEx:postIndex])
			iNdEx = postIndex
		default:
			iNdEx = preIndex
			skippy, err := skipQuery(dAtA[iNdEx:])
			if err != nil {
				return err
			}
			if (skippy < 0) || (iNdEx+skippy) < 0 {
				return ErrInvalidLengthQuery
			}
			if (iNdEx + skippy) > l {
				return io.ErrUnexpectedEOF
			}
			iNdEx += skippy
		}
	}

	if iNdEx > l {
		return io.ErrUnexpectedEOF
	}
	return nil
}
func (m *QueryGetEmailResponse) Unmarshal(dAtA []byte) error {
	l := len(dAtA)
	iNdEx := 0
	for iNdEx < l {
		preIndex := iNdEx
		var wire uint64
		for shift := uint(0); ; shift += 7 {
			if shift >= 64 {
				return ErrIntOverflowQuery
			}
			if iNdEx >= l {
				return io.ErrUnexpectedEOF
			}
			b := dAtA[iNdEx]
			iNdEx++
			wire |= uint64(b&0x7F) << shift
			if b < 0x80 {
				break
			}
		}
		fieldNum := int32(wire >> 3)
		wireType := int(wire & 0x7)
		if wireType == 4 {
			return fmt.Errorf("proto: QueryGetEmailResponse: wiretype end group for non-group")
		}
		if fieldNum <= 0 {
			return fmt.Errorf("proto: QueryGetEmailResponse: illegal tag %d (wire type %d)", fieldNum, wire)
		}
		switch fieldNum {
		case 1:
			if wireType != 2 {
				return fmt.Errorf("proto: wrong wireType = %d for field Email", wireType)
			}
			var msglen int
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return ErrIntOverflowQuery
				}
				if iNdEx >= l {
					return io.ErrUnexpectedEOF
				}
				b := dAtA[iNdEx]
				iNdEx++
				msglen |= int(b&0x7F) << shift
				if b < 0x80 {
					break
				}
			}
			if msglen < 0 {
				return ErrInvalidLengthQuery
			}
			postIndex := iNdEx + msglen
			if postIndex < 0 {
				return ErrInvalidLengthQuery
			}
			if postIndex > l {
				return io.ErrUnexpectedEOF
			}
			if m.Email == nil {
				m.Email = &Email{}
			}
			if err := m.Email.Unmarshal(dAtA[iNdEx:postIndex]); err != nil {
				return err
			}
			iNdEx = postIndex
		default:
			iNdEx = preIndex
			skippy, err := skipQuery(dAtA[iNdEx:])
			if err != nil {
				return err
			}
			if (skippy < 0) || (iNdEx+skippy) < 0 {
				return ErrInvalidLengthQuery
			}
			if (iNdEx + skippy) > l {
				return io.ErrUnexpectedEOF
			}
			iNdEx += skippy
		}
	}

	if iNdEx > l {
		return io.ErrUnexpectedEOF
	}
	return nil
}
func (m *QueryAllEmailRequest) Unmarshal(dAtA []byte) error {
	l := len(dAtA)
	iNdEx := 0
	for iNdEx < l {
		preIndex := iNdEx
		var wire uint64
		for shift := uint(0); ; shift += 7 {
			if shift >= 64 {
				return ErrIntOverflowQuery
			}
			if iNdEx >= l {
				return io.ErrUnexpectedEOF
			}
			b := dAtA[iNdEx]
			iNdEx++
			wire |= uint64(b&0x7F) << shift
			if b < 0x80 {
				break
			}
		}
		fieldNum := int32(wire >> 3)
		wireType := int(wire & 0x7)
		if wireType == 4 {
			return fmt.Errorf("proto: QueryAllEmailRequest: wiretype end group for non-group")
		}
		if fieldNum <= 0 {
			return fmt.Errorf("proto: QueryAllEmailRequest: illegal tag %d (wire type %d)", fieldNum, wire)
		}
		switch fieldNum {
		case 1:
			if wireType != 2 {
				return fmt.Errorf("proto: wrong wireType = %d for field Pagination", wireType)
			}
			var msglen int
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return ErrIntOverflowQuery
				}
				if iNdEx >= l {
					return io.ErrUnexpectedEOF
				}
				b := dAtA[iNdEx]
				iNdEx++
				msglen |= int(b&0x7F) << shift
				if b < 0x80 {
					break
				}
			}
			if msglen < 0 {
				return ErrInvalidLengthQuery
			}
			postIndex := iNdEx + msglen
			if postIndex < 0 {
				return ErrInvalidLengthQuery
			}
			if postIndex > l {
				return io.ErrUnexpectedEOF
			}
			if m.Pagination == nil {
				m.Pagination = &query.PageRequest{}
			}
			if err := m.Pagination.Unmarshal(dAtA[iNdEx:postIndex]); err != nil {
				return err
			}
			iNdEx = postIndex
		default:
			iNdEx = preIndex
			skippy, err := skipQuery(dAtA[iNdEx:])
			if err != nil {
				return err
			}
			if (skippy < 0) || (iNdEx+skippy) < 0 {
				return ErrInvalidLengthQuery
			}
			if (iNdEx + skippy) > l {
				return io.ErrUnexpectedEOF
			}
			iNdEx += skippy
		}
	}

	if iNdEx > l {
		return io.ErrUnexpectedEOF
	}
	return nil
}
func (m *QueryAllEmailResponse) Unmarshal(dAtA []byte) error {
	l := len(dAtA)
	iNdEx := 0
	for iNdEx < l {
		preIndex := iNdEx
		var wire uint64
		for shift := uint(0); ; shift += 7 {
			if shift >= 64 {
				return ErrIntOverflowQuery
			}
			if iNdEx >= l {
				return io.ErrUnexpectedEOF
			}
			b := dAtA[iNdEx]
			iNdEx++
			wire |= uint64(b&0x7F) << shift
			if b < 0x80 {
				break
			}
		}
		fieldNum := int32(wire >> 3)
		wireType := int(wire & 0x7)
		if wireType == 4 {
			return fmt.Errorf("proto: QueryAllEmailResponse: wiretype end group for non-group")
		}
		if fieldNum <= 0 {
			return fmt.Errorf("proto: QueryAllEmailResponse: illegal tag %d (wire type %d)", fieldNum, wire)
		}
		switch fieldNum {
		case 1:
			if wireType != 2 {
				return fmt.Errorf("proto: wrong wireType = %d for field Email", wireType)
			}
			var msglen int
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return ErrIntOverflowQuery
				}
				if iNdEx >= l {
					return io.ErrUnexpectedEOF
				}
				b := dAtA[iNdEx]
				iNdEx++
				msglen |= int(b&0x7F) << shift
				if b < 0x80 {
					break
				}
			}
			if msglen < 0 {
				return ErrInvalidLengthQuery
			}
			postIndex := iNdEx + msglen
			if postIndex < 0 {
				return ErrInvalidLengthQuery
			}
			if postIndex > l {
				return io.ErrUnexpectedEOF
			}
			m.Email = append(m.Email, &Email{})
			if err := m.Email[len(m.Email)-1].Unmarshal(dAtA[iNdEx:postIndex]); err != nil {
				return err
			}
			iNdEx = postIndex
		case 2:
			if wireType != 2 {
				return fmt.Errorf("proto: wrong wireType = %d for field Pagination", wireType)
			}
			var msglen int
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return ErrIntOverflowQuery
				}
				if iNdEx >= l {
					return io.ErrUnexpectedEOF
				}
				b := dAtA[iNdEx]
				iNdEx++
				msglen |= int(b&0x7F) << shift
				if b < 0x80 {
					break
				}
			}
			if msglen < 0 {
				return ErrInvalidLengthQuery
			}
			postIndex := iNdEx + msglen
			if postIndex < 0 {
				return ErrInvalidLengthQuery
			}
			if postIndex > l {
				return io.ErrUnexpectedEOF
			}
			if m.Pagination == nil {
				m.Pagination = &query.PageResponse{}
			}
			if err := m.Pagination.Unmarshal(dAtA[iNdEx:postIndex]); err != nil {
				return err
			}
			iNdEx = postIndex
		default:
			iNdEx = preIndex
			skippy, err := skipQuery(dAtA[iNdEx:])
			if err != nil {
				return err
			}
			if (skippy < 0) || (iNdEx+skippy) < 0 {
				return ErrInvalidLengthQuery
			}
			if (iNdEx + skippy) > l {
				return io.ErrUnexpectedEOF
			}
			iNdEx += skippy
		}
	}

	if iNdEx > l {
		return io.ErrUnexpectedEOF
	}
	return nil
}
func skipQuery(dAtA []byte) (n int, err error) {
	l := len(dAtA)
	iNdEx := 0
	depth := 0
	for iNdEx < l {
		var wire uint64
		for shift := uint(0); ; shift += 7 {
			if shift >= 64 {
				return 0, ErrIntOverflowQuery
			}
			if iNdEx >= l {
				return 0, io.ErrUnexpectedEOF
			}
			b := dAtA[iNdEx]
			iNdEx++
			wire |= (uint64(b) & 0x7F) << shift
			if b < 0x80 {
				break
			}
		}
		wireType := int(wire & 0x7)
		switch wireType {
		case 0:
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return 0, ErrIntOverflowQuery
				}
				if iNdEx >= l {
					return 0, io.ErrUnexpectedEOF
				}
				iNdEx++
				if dAtA[iNdEx-1] < 0x80 {
					break
				}
			}
		case 1:
			iNdEx += 8
		case 2:
			var length int
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return 0, ErrIntOverflowQuery
				}
				if iNdEx >= l {
					return 0, io.ErrUnexpectedEOF
				}
				b := dAtA[iNdEx]
				iNdEx++
				length |= (int(b) & 0x7F) << shift
				if b < 0x80 {
					break
				}
			}
			if length < 0 {
				return 0, ErrInvalidLengthQuery
			}
			iNdEx += length
		case 3:
			depth++
		case 4:
			if depth == 0 {
				return 0, ErrUnexpectedEndOfGroupQuery
			}
			depth--
		case 5:
			iNdEx += 4
		default:
			return 0, fmt.Errorf("proto: illegal wireType %d", wireType)
		}
		if iNdEx < 0 {
			return 0, ErrInvalidLengthQuery
		}
		if depth == 0 {
			return iNdEx, nil
		}
	}
	return 0, io.ErrUnexpectedEOF
}

var (
	ErrInvalidLengthQuery        = fmt.Errorf("proto: negative length found during unmarshaling")
	ErrIntOverflowQuery          = fmt.Errorf("proto: integer overflow")
	ErrUnexpectedEndOfGroupQuery = fmt.Errorf("proto: unexpected end of group")
)