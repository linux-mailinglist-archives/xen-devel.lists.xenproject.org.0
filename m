Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3DF9D6018
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2024 15:01:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841905.1257386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEUE8-0005oo-Rg; Fri, 22 Nov 2024 14:01:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841905.1257386; Fri, 22 Nov 2024 14:01:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEUE8-0005n0-OZ; Fri, 22 Nov 2024 14:01:40 +0000
Received: by outflank-mailman (input) for mailman id 841905;
 Fri, 22 Nov 2024 14:01:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pt5e=SR=bounce.vates.tech=bounce-md_30504962.67408ebd.v1-287a498457444c1f939bb637caa01303@srs-se1.protection.inumbo.net>)
 id 1tEUE8-0005mu-4R
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2024 14:01:40 +0000
Received: from mail134-5.atl141.mandrillapp.com
 (mail134-5.atl141.mandrillapp.com [198.2.134.5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48bdf5b1-a8da-11ef-99a3-01e77a169b0f;
 Fri, 22 Nov 2024 15:01:35 +0100 (CET)
Received: from pmta10.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail134-5.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4Xvxbd54mJzG0CJtY
 for <xen-devel@lists.xenproject.org>; Fri, 22 Nov 2024 14:01:33 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 287a498457444c1f939bb637caa01303; Fri, 22 Nov 2024 14:01:33 +0000
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
X-Inumbo-ID: 48bdf5b1-a8da-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5OC4yLjEzNC41IiwiaGVsbyI6Im1haWwxMzQtNS5hdGwxNDEubWFuZHJpbGxhcHAuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjQ4YmRmNWIxLWE4ZGEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMjg0MDk1Ljg2MTI0NCwic2VuZGVyIjoiYm91bmNlLW1kXzMwNTA0OTYyLjY3NDA4ZWJkLnYxLTI4N2E0OTg0NTc0NDRjMWY5MzliYjYzN2NhYTAxMzAzQGJvdW5jZS52YXRlcy50ZWNoIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1732284093; x=1732544593;
	bh=jWuIepqC8yaWMkVG+vgwEXX3z5Z3/zOLNl3TS3kIncc=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=IUUXvgIDDsqeWZqJmIHD1gEibcp2TaTt4ZhgUKFk0tBwCDR9ee/BBS/2a+P9xGAJ7
	 1CeahGg5RG6OuArYq/e53l6vJBd3tKWwTrZCfx88zE++5u8Rvi65m/Ruc0Hypyks2Q
	 ghmeyB7XuSC8VxsL4nweN0NaXbm4b8HBfGy28NwaR70tHE03oUqWqdvh5WqT2qNhmj
	 hsQkGLXidsROeIsZRZvE8OMBkqB3CcaYRlQI/rLWbUxLZn+wgIoH2bXVxbKAZfyOUO
	 cjWtNGgTxIu0twEbZRfHMhsYgeK9ShloRFprihXOpejO6pBN5pfKFbGcdJVNzoxbts
	 XRCPqIrv02dKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1732284093; x=1732544593; i=teddy.astie@vates.tech;
	bh=jWuIepqC8yaWMkVG+vgwEXX3z5Z3/zOLNl3TS3kIncc=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=kb7atfSoLkhf+3B2nxXJjH6JXnkSXeVKt+narDrrQtuZjnexDG7ItWxwxISG6PFo2
	 TJaJOv0tZZlpITbhdLRV18IX1KZPL26eGep/SFjByy+8bwkeSdcXJCwJki6BRPrNLI
	 ccKVBNW1fsjTR5xhMo+jk82GNnLbXjLscHYkyL9LWnmz5FnmYbOAoI0lNB6y32EFW1
	 bm3mJVX6MzFZezd3lKArgM04+OvSbgPk7QHGiVaeqyCAK3bJIjQjMukJliEBxRbuSd
	 lLmjYCywsblkxecY8jqYxWbrVOHNSn8noUf6QaynZoltB3GwT6nseQu9Z2oxI/edNX
	 v3GWMGbF/Vnyg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20XEN=20PATCH]=20docs/designs:=20Add=20a=20design=20document=20for=20'xen'=20Rust=20crate?=
X-Mailer: git-send-email 2.45.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1732284092312
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "Alejandro Vallejo" <alejandro.vallejo@cloud.com>, "Anthony PERARD" <anthony.perard@vates.tech>
Message-Id: <c0f88345e1ee870dc10a209e3840ae98b2ac1386.1732283549.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.287a498457444c1f939bb637caa01303?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241122:md
Date: Fri, 22 Nov 2024 14:01:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Add a design document for the 'xen' rust crate.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
Follows Alejandro works with https://lore.kernel.org/xen-devel/D5SQEZIL2SZV.QR3X5MRVQJJP@cloud.com/T/#t
There is also a WIP branch at https://gitlab.com/TSnake41/xen/-/tree/rust-rfc
---
 docs/designs/xen-rust-crate.md | 199 +++++++++++++++++++++++++++++++++
 1 file changed, 199 insertions(+)
 create mode 100644 docs/designs/xen-rust-crate.md

diff --git a/docs/designs/xen-rust-crate.md b/docs/designs/xen-rust-crate.md
new file mode 100644
index 0000000000..5eab603d4d
--- /dev/null
+++ b/docs/designs/xen-rust-crate.md
@@ -0,0 +1,199 @@
+# Rust 'xen' crate interface design
+
+See [1] for more context.
+
+This RFC proposes parts of the 'xen' crate interface that would directly or indirectly
+(through internal wrappers) be used by users.
+Those users could be a userland toolstack, a unikernel application (e.g XTF, Unikraft),
+some other freestanding environment (e.g OVMF, Linux, Redox OS), ...
+
+These users can have a very different execution environment, this crate aims to provide
+a uniform interface while allowing flexibility for exposing platform-specific bits.
+
+## Design philosophy
+
+This crate should feel natural for a Rust developper, thus, any Rust developper with some
+understanding on the Xen hypercall operations should be able to use this crate.
+Moreover, we want this crate to be maintainable and feel "idiomatic", and not introduce
+confusing behavior onto the user. Note that this crate will heavily use unsafe code.
+
+Some principles are proposed :
+
+Use or provide idiomatic abstractions when relevant (reuse standard traits).
+
+Examples:
+  Provide (optional) Future<...> abstractions for event channels
+  Provide a iterator-based (Stream ? [2]) abstraction for guest console.
+
+Don't restrict features to some execution environment, use modular abstractions (e.g traits)
+to allow the user to specify the missing bits himself / provide its own implementation.
+Note that it doesn't prevent us from exposing the platform-specific bits onto the
+types themselves (e.g UnixXenEventChannel can still expose its file descriptor).
+
+Example:
+  If we provide a event channel abstraction based on hypercall but it doesn't implement Future<...>,
+  the user can still implement its own type on top of the hypercall implementation, and
+  use its own async runtime (e.g based on interrupts) to implement Future<...> himself.
+  There could be 2 traits for varying needs :
+    EventChannel (base trait) and AsyncEventChannel (await-able EventChannel)
+
+  We can have both RawEventChannel based on XenHypercall that only implements EventChannel
+  and another type TokioEventChannel that provides both EventChannel and AsyncEventChannel
+  and integrates with tokio runtime.
+
+Safe wrappers must be "sound" and unsafe code shall not cause undefined behavior.
+- safe wrappers must not cause undefined behavior on their own
+- unsafe code should not cause undefined behavior if properly used
+
+This is a bit tricky due to some Xen specificities, but we expect hypercall to be well
+formed (we can add validation tools for that) including have its parameter indirectly
+respect the aliasing rules [3].
+Although, we assume that Xen is well-behaving regarding its ABI.
+We don't define misuse of a hypercall that can harm the guest himself, but we care
+about not causing a undefined behavior (e.g by passing a buggy pointer) through the
+hypercall interface that can overwrite unrelated/arbitrary kernel memory.
+
+## Hypercall interface
+
+We introduce a XenHypercall trait that exposes a raw primitive for making hypercalls.
+This interface supposes nothing on the ABI used in Xen, and its the responsibility
+of the user of such interface (often safe wrappers) that the hypercall made is
+meaningful.
+
+This interface is mostly to only be used by the crate developpers to build safe
+wrappers on top, or by advanced user for using non-exposed/WIP hypercall interfaces
+or bypassing the safe wrappers.
+
+We can implement this interface for freestanding platforms using direct native hypercalls
+(e.g using inline assembly) for freestanding platforms or in userland using special devices
+like privcmd/xencall on most Unix platforms.
+
+```rust
+pub trait XenHypercall: Sized {
+    unsafe fn hypercall5(&self, cmd: usize, param: [usize; 5]) -> usize;
+
+    unsafe fn hypercall4(&self, cmd: usize, param: [usize; 4]) -> usize;
+    unsafe fn hypercall3(&self, cmd: usize, param: [usize; 3]) -> usize;
+    unsafe fn hypercall2(&self, cmd: usize, param: [usize; 2]) -> usize;
+    unsafe fn hypercall1(&self, cmd: usize, param: usize) -> usize;
+    unsafe fn hypercall0(&self, cmd: usize) -> usize;
+
+    /* ... */
+}
+```
+
+### Hypercall-safe buffers
+
+One difficulty is that in a freestanding environment, we need to use pointers to
+original data. But in a hosted environment, we need to make special buffers instead
+for that.
+
+We introduce the Xen{Const/Mut}Buffer generic trait that wraps a reference in a
+"hypercall-safe" buffer that may or may not be a bounce buffer.
+
+```rust
+/// Wrapper of a reference into a hypercall-safe buffer.
+pub trait XenConstBuffer<T> {
+    /// Get a hypercall-safe reference to underlying data.
+    fn as_hypercall_ptr(&self) -> *const T;
+}
+
+/// Wrapper of a mutable reference into a mutable hypercall-safe buffer.
+pub trait XenMutBuffer<T> {
+    /// Get a hypercall-safe mutable reference to underlying data.
+    fn as_hypercall_ptr(&mut self) -> *mut T;
+
+    /// Update original reference with new data.
+    unsafe fn update(&mut self);
+}
+
+// The user will make those wrappers using dedicated functions in XenHypercall trait.
+
+trait XenHypercall: Sized {
+    /* ... */
+    type Error;
+
+    fn make_const_object<T: Copy + ?Sized>(
+        &self,
+        buffer: &T,
+    ) -> Result<impl XenConstBuffer<T>, Self::Error>;
+
+    fn make_mut_buffer<T: Copy + ?Sized>(
+        &self,
+        buffer: &mut T,
+    ) -> Result<impl XenMutBuffer<T>, Self::Error>;
+
+    fn make_const_slice<T: Copy + Sized>(
+        &self,
+        slice: &[T],
+    ) -> Result<impl XenConstBuffer<T>, Self::Error>;
+
+    fn make_mut_slice<T: Copy + Sized>(
+        &self,
+        slice: &mut [T],
+    ) -> Result<impl XenMutBuffer<T>, Self::Error>;
+}
+```
+
+Example use:
+
+```rust
+fn demo_hypercall<H: XenHypercall>(interface: &H, buffer: &mut [u8]) -> Result<(), H::Error> {
+    let buffer_size = buffer.len();
+    // make a hypercall-safe wrapper of `buffer`
+    let hyp_buffer = interface.make_mut_slice(buffer)?;
+
+    let op = SomeHypercallStruct {
+        buffer: hyp_buffer.as_hypercall_ptr(),
+        buffer_size: buffer_size as _,
+    };
+    // Do the same for hyp_op
+    let hyp_op = interface.make_const_object(&op)?;
+
+    unsafe {
+        interface.hypercall1(SOME_CMD, hyp_op.as_hypercall_ptr().addr());
+        // assume success
+        hyp_buffer.update(); // update buffer back
+    }
+
+    Ok(())
+}
+```
+
+Note that freestanding case, we can use a thin zero-copy wrapper :
+```rust
+/// Constant xen buffer that passes the reference as-is.
+pub(super) struct DirectConstXenBuffer<'a, T>(&'a T);
+
+impl<T> XenConstBuffer<T> for DirectConstXenBuffer<'_, T> {
+    fn as_hypercall_ptr(&self) -> *const T {
+        self.0
+    }
+}
+// ...
+```
+
+TODO:
+Do we need to clarify the lifetimes (e.g should trait indicate a lifetime binding with
+original data) ? Try to answer with RPITIT and Rust 2024 capture rules [4].
+
+Try to unify make_const_object and make_const_slice (along with mut variant). `*const [T]`
+is a bit more subtle to create and we cannot trivially cast a address into a pointer and
+need to use special functions for that (`core::ptr::slice_from_raw_parts` ?).
+But for that, we need to know that T is actually a slice before using this function.
+
+## Event channels
+
+TODO
+
+[1] - Interfacing Rust with Xen - Alejandro Vallejo, XenServer BU, Cloud Software Group
+https://youtu.be/iFh4n2kbAwM
+
+[2] - The Stream Trait
+https://rust-lang.github.io/async-book/05_streams/01_chapter.html
+
+[3] - Aliasing
+https://doc.rust-lang.org/nomicon/aliasing.html
+
+[4] - https://blog.rust-lang.org/2023/12/21/async-fn-rpit-in-traits.html
+https://rust-lang.github.io/rfcs/3498-lifetime-capture-rules-2024.html
-- 
2.45.2



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

