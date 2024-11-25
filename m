Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B61A9D82FB
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 11:02:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842361.1257735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFVuL-0002kW-Br; Mon, 25 Nov 2024 10:01:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842361.1257735; Mon, 25 Nov 2024 10:01:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFVuL-0002hr-8T; Mon, 25 Nov 2024 10:01:29 +0000
Received: by outflank-mailman (input) for mailman id 842361;
 Mon, 25 Nov 2024 10:01:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PSqa=SU=bounce.vates.tech=bounce-md_30504962.67444aef.v1-98824f30ea2d4a0c9572f3d96cace06c@srs-se1.protection.inumbo.net>)
 id 1tFVuJ-0002hl-K9
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 10:01:27 +0000
Received: from mail134-5.atl141.mandrillapp.com
 (mail134-5.atl141.mandrillapp.com [198.2.134.5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3865c4b0-ab14-11ef-a0cc-8be0dac302b0;
 Mon, 25 Nov 2024 11:01:21 +0100 (CET)
Received: from pmta10.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail134-5.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4Xxh73525rzG0CBWQ
 for <xen-devel@lists.xenproject.org>; Mon, 25 Nov 2024 10:01:19 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 98824f30ea2d4a0c9572f3d96cace06c; Mon, 25 Nov 2024 10:01:19 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 3865c4b0-ab14-11ef-a0cc-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5OC4yLjEzNC41IiwiaGVsbyI6Im1haWwxMzQtNS5hdGwxNDEubWFuZHJpbGxhcHAuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjM4NjVjNGIwLWFiMTQtMTFlZi1hMGNjLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNTI4ODgxLjU5Nzg5Niwic2VuZGVyIjoiYm91bmNlLW1kXzMwNTA0OTYyLjY3NDQ0YWVmLnYxLTk4ODI0ZjMwZWEyZDRhMGM5NTcyZjNkOTZjYWNlMDZjQGJvdW5jZS52YXRlcy50ZWNoIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1732528879; x=1732789379;
	bh=v5AKMnpp0zrdkE39OdxBx/dSkJn58UrtlQXd6ajVqqA=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=qBy2o5Liz6TIwiAhs2K7Kxugnk/lDnV4tS0UmAwxZmJlQJKcN7syYKpXU4r6kp8mJ
	 9XPtlbPjHMAsKXAEh1NtM0TKtHIwhcdCgG9qvhaqF+CXDcey3ryQBy2yMY11BEDS+m
	 8iGMUhixGwtewxrzC7laWIfMXbAWtaCQQzsRsksJxbEZkwXavtd171SX/YRjDYgC4H
	 +y10vTd4CKHOn+mzUByHnpF4WKunDUUyQP21NUOYRxwMX7OQAHZib7rnJwhuOJUgPC
	 Gk4xcN6dypmscnW4d8skYqhgleQ21YMuZzy4HShsPuRdml/YW4CyJmzD3k5ke9MxJc
	 xZI5Sql8cHCyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1732528879; x=1732789379; i=teddy.astie@vates.tech;
	bh=v5AKMnpp0zrdkE39OdxBx/dSkJn58UrtlQXd6ajVqqA=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=HoSAI5RFQomUDRP+axF87tyQSah0o+beLXWxDVbuFryX986j68VEqxq0OX8uQQzwU
	 jYNIj5KlduhisJ0pU+CuohgShkkrwwWUzZgnJAAh1UjV7Ging6MBCADCFAWviqbuaR
	 nDoJhkE/O7LRxNyPsd5BNaqo/W0Y9UyTHUG+XjMvrXnJYexA/9irbP38jrGxEroO3/
	 DJLe6JLNPlhm/OUD7gNdkmI8VhIdWDaLhlczqGmXyYxI9dXKPzB47GVY49qtLBTTws
	 djbuYPVeW/HevwR5y4fPPQUshiZ8eAm1LzYG48N/k5Nz6BRjj3nSeiIXAUQSjAevYq
	 rcez15AuMWMDA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20XEN=20PATCH]=20docs/designs:=20Add=20a=20design=20document=20for=20'xen'=20Rust=20crate?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1732528878266
Message-Id: <897d4e9a-d3f5-4cb4-996d-6c57f50a2606@vates.tech>
To: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>, xen-devel@lists.xenproject.org
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "Anthony PERARD" <anthony.perard@vates.tech>
References: <c0f88345e1ee870dc10a209e3840ae98b2ac1386.1732283549.git.teddy.astie@vates.tech> <D5T1J6D9918L.1TO68X0HW9QMS@cloud.com>
In-Reply-To: <D5T1J6D9918L.1TO68X0HW9QMS@cloud.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.98824f30ea2d4a0c9572f3d96cace06c?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241125:md
Date: Mon, 25 Nov 2024 10:01:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello Alejandro,

Thanks for the review !

Le 22/11/2024 =C3=A0 22:55, Alejandro Vallejo a =C3=A9crit=C2=A0:
>> +Some principles are proposed :
>> +
>> +Use or provide idiomatic abstractions when relevant (reuse standard tra=
its).
>> +
>> +Examples:
>> +  Provide (optional) Future<...> abstractions for event channels
>> +  Provide a iterator-based (Stream ? [2]) abstraction for guest console=
.
>> +
>> +Don't restrict features to some execution environment, use modular abst=
ractions (e.g traits)
>> +to allow the user to specify the missing bits himself / provide its own=
 implementation.
>> +Note that it doesn't prevent us from exposing the platform-specific bit=
s onto the
>> +types themselves (e.g UnixXenEventChannel can still expose its file des=
criptor).
> 
> Traits are superhelpful for dynamic dispatch and building type constraint=
s.
> Sometimes for enforcing interfaces if they are not all built at the same =
time.
> 
> What exactly are the benefits of subjecting all interfaces to traits? Wha=
t do
> they enable that cannot otherwise be done by extending the interface expo=
rted
> by some struct (say, an opaque filedesc wrapper)?
> 

>> +
>> +Example:
>> +  If we provide a event channel abstraction based on the hypercall but =
it doesn't implement Future<...>,
>> +  the user can still implement its own type on top of the hypercall imp=
lementation, and
>> +  use its own async runtime (e.g based on interrupts) to implement Futu=
re<...> himself.
>> +  There could be 2 traits for varying needs :
>> +    EventChannel (base trait) and AsyncEventChannel (await-able EventCh=
annel)
>> +
>> +  We can have both RawEventChannel based on XenHypercall that only impl=
ements EventChannel
>> +  and another type TokioEventChannel that provides both EventChannel an=
d AsyncEventChannel
>> +  and integrates with tokio runtime.
> 
> Not sure why traits would be essential here either. It's hard to assess w=
ithout
> looking at a particular case where using traits effectively simplifies th=
e
> problem.
> 

Some xen primitives are exposed differently depending on the 
platform/context, for instance, event channels in a freestanding context 
are exposed by hypercalls while in a hosted context, they are often 
exposed from a file descriptor that we can make with '/dev/xen/evtchn'.

While they work differently, they actually share some behavior : e.g 
they all have some event channel operations you can do, and you may be 
able to wait for a event (or not).

To not make assumption on how the platform/context works and what it 
provides/expects, I use traits to define a "shared interface" that will
be followed by all platforms (and expose some platform specificities 
like how you prepare a pointer to the hypercall).

(event channels is a bit more complex, because xenctrl/xenevtchn has 
actually 2 different ways of making event channels, one using 
/dev/xen/evtchn, and another using evtchn_op hypercalls; we can expose 
both by having one relying on XenHypercall (that exists in hosted) while 
the other relies on evtchn device)

Behind the scenes, it's still going to be structs, and by impl Traits, 
it's going to be statically dispatched (e.g the impl Type is replaced 
with the actual type).

>> +
>> +Safe wrappers must be "sound" and unsafe code shall not cause undefined=
 behavior.
>> +- safe wrappers must not cause undefined behavior on their own
>> +- unsafe code should not cause undefined behavior if properly used
> 
> I agree. The external interface must be soundly safe as far as reasonably
> possible. And unsafe code must be adequately annotated with the cares tha=
t the
> caller must have.
> 
>> +
>> +This is a bit tricky due to some Xen specificities, but we expect hyper=
call to be well
>> +formed (we can add validation tools for that) including have its parame=
ter indirectly
>> +respect the aliasing rules [3].
> 
>> +Although, we assume that Xen is well-behaving regarding its ABI.
>> +We don't define misuse of a hypercall that can harm the guest himself, =
but we care
>> +about not causing a undefined behavior (e.g by passing a buggy pointer)=
 through the
>> +hypercall interface that can overwrite unrelated/arbitrary kernel memor=
y.
>> +
>> +## Hypercall interface
>> +
>> +We introduce a XenHypercall trait that exposes a raw primitive for maki=
ng hypercalls.
>> +This interface supposes nothing on the ABI used in Xen, and its the res=
ponsibility
>> +of the user of such interface (often safe wrappers) that the hypercall =
made is
>> +meaningful.
>> +
>> +This interface is mostly to only be used by the crate developpers to bu=
ild safe
>> +wrappers on top, or by advanced user for using non-exposed/WIP hypercal=
l interfaces
>> +or bypassing the safe wrappers.
>> +
>> +We can implement this interface for freestanding platforms using direct=
 native hypercalls
>> +(e.g using inline assembly) for freestanding platforms or in userland u=
sing special devices
>> +like privcmd/xencall on most Unix platforms.
>> +
>> +```rust
>> +pub trait XenHypercall: Sized {
>> +    unsafe fn hypercall5(&self, cmd: usize, param: [usize; 5]) -> usize=
;
>> +
>> +    unsafe fn hypercall4(&self, cmd: usize, param: [usize; 4]) -> usize=
;
>> +    unsafe fn hypercall3(&self, cmd: usize, param: [usize; 3]) -> usize=
;
>> +    unsafe fn hypercall2(&self, cmd: usize, param: [usize; 2]) -> usize=
;
>> +    unsafe fn hypercall1(&self, cmd: usize, param: usize) -> usize;
>> +    unsafe fn hypercall0(&self, cmd: usize) -> usize;
>> +
>> +    /* ... */
>> +}
>> +```
>> +
>> +### Hypercall-safe buffers
>> +
>> +One difficulty is that in a freestanding environment, we need to use po=
inters to
>> +original data. But in a hosted environment, we need to make special buf=
fers instead
>> +for that.
>> +
>> +We introduce the Xen{Const/Mut}Buffer generic trait that wraps a refere=
nce in a
>> +"hypercall-safe" buffer that may or may not be a bounce buffer.
>> +
>> +```rust
>> +/// Wrapper of a reference into a hypercall-safe buffer.
>> +pub trait XenConstBuffer<T> {
>> +    /// Get a hypercall-safe reference to underlying data.
>> +    fn as_hypercall_ptr(&self) -> *const T;
>> +}
>> +
>> +/// Wrapper of a mutable reference into a mutable hypercall-safe buffer=
.
>> +pub trait XenMutBuffer<T> {
>> +    /// Get a hypercall-safe mutable reference to underlying data.
>> +    fn as_hypercall_ptr(&mut self) -> *mut T;
>> +
>> +    /// Update original reference with new data.
>> +    unsafe fn update(&mut self);
>> +}
> 
> Rather than trying to wrap the borrows I think it makes more sense to wra=
p
> ownership. If we provide a xen::Box<T> type (not necessarily tied to a st=
andard
> allocator) that wraps ownership of its content then we can use the same t=
ype
> for const and mut references (because it's just &T and &mut T after Deref=
 and
> DerefMut are implemented). Getting the pointers for hypercalls can be don=
e via
> the references. Like so:
> 
>    puf foo(p: *mut u8) {
>        // something
>    }
> 
>    puf main() {
>        let mut var =3D 8;
>        foo(&mut var);
>    }
> 
> This is tip-toeing on UB by getting a *mut from a &mut, but
> because the &mut is coerced into a *mut on function call this is both saf=
e and
> sound. Miri is happy with it too because it obeys stacked borrows.
> 
> That's for inputs. Pointer outputs are profoundly unsafe and I'm really h=
oping
> there's nothing that requires it. Fingers crossed...
> 

Wrapping ownership would be useful but I don't think it is better than 
mapping borrows. If we expects the user to use xen::Box<T> as 
input/output, it may not be practical to use. And using xen::Box<T> 
internally implies having some custom way of allocating data, which may 
be platform specific (freestanding that may not have a xen-aware allocator)=
.

>> +
>> +// The user will make those wrappers using dedicated functions in XenHy=
percall trait.
>> +
>> +trait XenHypercall: Sized {
>> +    /* ... */
>> +    type Error;
>> +
>> +    fn make_const_object<T: Copy + ?Sized>(
>> +        &self,
>> +        buffer: &T,
>> +    ) -> Result<impl XenConstBuffer<T>, Self::Error>;
>> +
>> +    fn make_mut_buffer<T: Copy + ?Sized>(
>> +        &self,
>> +        buffer: &mut T,
>> +    ) -> Result<impl XenMutBuffer<T>, Self::Error>;
>> +
>> +    fn make_const_slice<T: Copy + Sized>(
>> +        &self,
>> +        slice: &[T],
>> +    ) -> Result<impl XenConstBuffer<T>, Self::Error>;
>> +
>> +    fn make_mut_slice<T: Copy + Sized>(
>> +        &self,
>> +        slice: &mut [T],
>> +    ) -> Result<impl XenMutBuffer<T>, Self::Error>;
>> +}
>> +```
> 
> This is what I meant at the beginning. What's the advantage of having
> XenConstBuffer (et al.) being a trait rather than a struct? You can acces=
s it's
> interior via Deref and DerefMut (like Box<T> and Mutex<T> do) already, so=
 they
> can implement the same interface as T.
> 

Some additional context

/// Wrapper of a reference into a hypercall-safe buffer.
pub trait XenConstBuffer<T> {
     /// Get a hypercall-safe reference to underlying data.
     fn as_hypercall_ptr(&self) -> *const T;
}

/// Wrapper of a mutable reference into a mutable hypercall-safe buffer.
pub trait XenMutBuffer<T> {
     /// Get a hypercall-safe mutable reference to underlying data.
     fn as_hypercall_ptr(&mut self) -> *mut T;

     /// Update original reference with new data.
     unsafe fn update(&mut self);
}

---

For freestanding
https://gitlab.com/TSnake41/xen/-/blob/rust-rfc/tools/rust/xen/src/hypercal=
l/none/mod.rs?ref_type=3Dheads

/// Constant xen buffer that passes the reference as-is.
pub(super) struct DirectConstXenBuffer<'a, T>(&'a T);

impl<T> XenConstBuffer<T> for DirectConstXenBuffer<'_, T> {
     fn as_hypercall_ptr(&self) -> *const T {
         self.0
     }
}

pub(super) struct DirectConstXenSlice<'a, T>(&'a [T]);

impl<T> XenConstBuffer<T> for DirectConstXenSlice<'_, T> {
     fn as_hypercall_ptr(&self) -> *const T {
         self.0.as_ptr()
     }
}

/// Mutable xen buffer that passes the reference as-is.
pub(super) struct DirectMutXenBuffer<'a, T>(&'a mut T);

impl<T> XenMutBuffer<T> for DirectMutXenBuffer<'_, T> {
     fn as_hypercall_ptr(&mut self) -> *mut T {
         self.0
     }

     unsafe fn update(&mut self) {
         // The buffer is passed as is, we don't need to bounce the changes=
.
     }
}

pub(super) struct DirectMutXenSlice<'a, T>(&'a mut [T]);

impl<T> XenMutBuffer<T> for DirectMutXenSlice<'_, T> {
     fn as_hypercall_ptr(&mut self) -> *mut T {
         self.0.as_mut_ptr()
     }

     unsafe fn update(&mut self) {
         // The buffer is passed as is, we don't need to bounce the changes=
.
     }
}


---

For Unix platforms (bounce buffer)
https://gitlab.com/TSnake41/xen/-/blob/rust-rfc/tools/rust/xen/src/hypercal=
l/unix/buffer.rs?ref_type=3Dheads

pub struct XenCallBuffer<'hyp, T> {
     interface: PhantomData<&'hyp UnixXenHypercall>,
     ptr: NonNull<T>, // aligned
     page_count: usize,
     length: usize,
}

pub struct UnixConstXenBuffer<'a, 'hyp, T: Copy + ?Sized> {
     // As const objects are actually being copied they actually don't
     // need to hold a reference to their original counterpart.
     // Use a PhantomData to make the borrow checker happy.
     pub(super) original: PhantomData<&'a T>,
     pub(super) buffer: XenCallBuffer<'hyp, T>,
}

pub struct UnixMutXenBuffer<'a, 'hyp, T: Copy + ?Sized> {
     pub(super) original: &'a mut T,
     pub(super) buffer: XenCallBuffer<'hyp, T>,
}

impl<T: Copy + ?Sized> XenConstBuffer<T> for UnixConstXenBuffer<'_, '_, T> =
{
     fn as_hypercall_ptr(&self) -> *const T {
         self.buffer.ptr.as_ptr()
     }
}

impl<T: Copy + ?Sized> XenMutBuffer<T> for UnixMutXenBuffer<'_, '_, T> {
     fn as_hypercall_ptr(&mut self) -> *mut T {
         self.buffer.ptr.as_ptr()
     }

     unsafe fn update(&mut self) {
         // SAFETY: Caller must ensure that data pointed in `buffer` is 
valid for T.
         *self.original =3D self.buffer.read();
     }
}

It can add additional operations to have what's needed to have a usable 
pointer to the data (e.g making a bounce buffer for hosted/amd-sev).
As it may or may not be needed, may rely on external things, I kept it 
as a trait to let the implementor define how it actually works.

>> +
>> +Example use:
>> +
>> +```rust
>> +fn demo_hypercall<H: XenHypercall>(interface: &H, buffer: &mut [u8]) ->=
 Result<(), H::Error> {
>> +    let buffer_size =3D buffer.len();
>> +    // make a hypercall-safe wrapper of `buffer`
>> +    let hyp_buffer =3D interface.make_mut_slice(buffer)?;
>> +
>> +    let op =3D SomeHypercallStruct {
>> +        buffer: hyp_buffer.as_hypercall_ptr(),
>> +        buffer_size: buffer_size as _,
>> +    };
>> +    // Do the same for hyp_op
>> +    let hyp_op =3D interface.make_const_object(&op)?;
>> +
>> +    unsafe {
>> +        interface.hypercall1(SOME_CMD, hyp_op.as_hypercall_ptr().addr()=
);
>> +        // assume success
>> +        hyp_buffer.update(); // update buffer back
>> +    }
>> +
>> +    Ok(())
>> +}
>> +```
> 
> One of the bits I liked about the original libxen I showed at Xen Summit =
were
> the `IsSysCtl` and `IsDomctl` traits. We can generate them from xenbindge=
n
> itself and use them as constraints so you don't try to use an invalid typ=
e for
> a hypercall. It'll need tweaking, I guess. But the interface cannot be sa=
fe
> until you can't mess up the arguments.
> 
> evtchn and gntops work differently, but the same idea ought to work.
> 

I think it depends on what we want to expose to the user, whether it is 
the safer variant of raw hypercalls or something less similar.

>> +need to use special functions for that (`core::ptr::slice_from_raw_part=
s` ?).
>> +But for that, we need to know that T is actually a slice before using t=
his function.
>> +
>> +## Event channels
>> +
>> +TODO
>> +
>> +[1] - Interfacing Rust with Xen - Alejandro Vallejo, XenServer BU, Clou=
d Software Group
>> +https://youtu.be/iFh4n2kbAwM
>> +
>> +[2] - The Stream Trait
>> +https://rust-lang.github.io/async-book/05_streams/01_chapter.html
>> +
>> +[3] - Aliasing
>> +https://doc.rust-lang.org/nomicon/aliasing.html
>> +
>> +[4] - https://blog.rust-lang.org/2023/12/21/async-fn-rpit-in-traits.htm=
l
>> +https://rust-lang.github.io/rfcs/3498-lifetime-capture-rules-2024.html
> 
> I think it'll be a while under we settle on a design.
> 
> My latest advances with xenbindgen involve formalizing evtchn, and that s=
hould
> be a fantastic playing ground for experimenting. I suspect we'll struggle=
 to
> see the big picture until the foundational stuff is in place and we try t=
o
> expose real hypercalls.
> 

Yes, we need to experiment and discuss on what would be best.
Regarding event channels, I tried to design a interface that works with 
either hypercalls or with evtchn device in a similar fashion to what we 
can do with xenctrl/xenevtchn.
https://gitlab.com/TSnake41/xen/-/tree/rust-rfc/tools/rust/xen/src/event

> Cheers,
> Alejandro

Teddy



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


