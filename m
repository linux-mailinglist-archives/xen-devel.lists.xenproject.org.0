Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D35B82FC5AD
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 01:24:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71158.127246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l21Hl-0006Ke-OF; Wed, 20 Jan 2021 00:23:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71158.127246; Wed, 20 Jan 2021 00:23:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l21Hl-0006KF-Kh; Wed, 20 Jan 2021 00:23:45 +0000
Received: by outflank-mailman (input) for mailman id 71158;
 Wed, 20 Jan 2021 00:23:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0VeX=GX=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l21Hk-0006KA-8W
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 00:23:44 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 79379936-4d79-4db9-a57c-311a98f99b21;
 Wed, 20 Jan 2021 00:23:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0493D22AAA;
 Wed, 20 Jan 2021 00:23:41 +0000 (UTC)
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
X-Inumbo-ID: 79379936-4d79-4db9-a57c-311a98f99b21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611102222;
	bh=dhCgbsR4N45P2v7R4G+cO4pyjffvNW7/8J56fZmIAvM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=B93844ya5pyzeF8TSMy4AzuIT/6zHuboJvlnrLNW9mC1tXaZ8wcIsdC35dIuov8L3
	 DhwvDfzRLG9YBM2ENAREe/8Oz909oAaQ/l8edEDRf7a8K8R0H9N8x2CaTaIsoYiLfp
	 E3CdhanxA/NiGIQJL/5SBBk7MSKe398Xvd68qhgMos0ha0QlYdddrHSM68wRLm+CP/
	 iDyXynXdQc8MTnNoq4uVBGjt0IusKsnyhIx+x+xzjKOdZtOxgZj6lb+AVtl6dU2U7a
	 Du3QbYJFXmi0kI6yRieUeJMYTq+hhs/swAHle39j2qjON8JX7uabNgm4gXu3kP5Vk+
	 zVB1gDctzcoEA==
Date: Tue, 19 Jan 2021 16:23:41 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr <olekstysh@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH V4 14/24] arm/ioreq: Introduce arch specific bits for
 IOREQ/DM features
In-Reply-To: <dad53a8c-2771-ba81-9fa0-f1ea70aa14cf@gmail.com>
Message-ID: <alpine.DEB.2.21.2101191620050.14528@sstabellini-ThinkPad-T480s>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com> <1610488352-18494-15-git-send-email-olekstysh@gmail.com> <alpine.DEB.2.21.2101141652360.31265@sstabellini-ThinkPad-T480s> <dad53a8c-2771-ba81-9fa0-f1ea70aa14cf@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1928124558-1611102222=:14528"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1928124558-1611102222=:14528
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Sun, 17 Jan 2021, Oleksandr wrote:
> On 15.01.21 02:55, Stefano Stabellini wrote:
> > On Tue, 12 Jan 2021, Oleksandr Tyshchenko wrote:
> > > From: Julien Grall <julien.grall@arm.com>
> > > 
> > > This patch adds basic IOREQ/DM support on Arm. The subsequent
> > > patches will improve functionality and add remaining bits.
> > > 
> > > The IOREQ/DM features are supposed to be built with IOREQ_SERVER
> > > option enabled, which is disabled by default on Arm for now.
> > > 
> > > Please note, the "PIO handling" TODO is expected to left unaddressed
> > > for the current series. It is not an big issue for now while Xen
> > > doesn't have support for vPCI on Arm. On Arm64 they are only used
> > > for PCI IO Bar and we would probably want to expose them to emulator
> > > as PIO access to make a DM completely arch-agnostic. So "PIO handling"
> > > should be implemented when we add support for vPCI.
> > > 
> > > Signed-off-by: Julien Grall <julien.grall@arm.com>
> > > Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > > [On Arm only]
> > > Tested-by: Wei Chen <Wei.Chen@arm.com>
> > > 
> > > ---
> > > Please note, this is a split/cleanup/hardening of Julien's PoC:
> > > "Add support for Guest IO forwarding to a device emulator"
> > > 
> > > Changes RFC -> V1:
> > >     - was split into:
> > >       - arm/ioreq: Introduce arch specific bits for IOREQ/DM features
> > >       - xen/mm: Handle properly reference in set_foreign_p2m_entry() on
> > > Arm
> > >     - update patch description
> > >     - update asm-arm/hvm/ioreq.h according to the newly introduced arch
> > > functions:
> > >       - arch_hvm_destroy_ioreq_server()
> > >       - arch_handle_hvm_io_completion()
> > >     - update arch files to include xen/ioreq.h
> > >     - remove HVMOP plumbing
> > >     - rewrite a logic to handle properly case when hvm_send_ioreq()
> > > returns IO_RETRY
> > >     - add a logic to handle properly handle_hvm_io_completion() return
> > > value
> > >     - rename handle_mmio() to ioreq_handle_complete_mmio()
> > >     - move paging_mark_pfn_dirty() to asm-arm/paging.h
> > >     - remove forward declaration for hvm_ioreq_server in asm-arm/paging.h
> > >     - move try_fwd_ioserv() to ioreq.c, provide stubs if
> > > !CONFIG_IOREQ_SERVER
> > >     - do not remove #ifdef CONFIG_IOREQ_SERVER in memory.c for guarding
> > > xen/ioreq.h
> > >     - use gdprintk in try_fwd_ioserv(), remove unneeded prints
> > >     - update list of #include-s
> > >     - move has_vpci() to asm-arm/domain.h
> > >     - add a comment (TODO) to unimplemented yet handle_pio()
> > >     - remove hvm_mmio_first(last)_byte() and hvm_ioreq_(page/vcpu/server)
> > > structs
> > >       from the arch files, they were already moved to the common code
> > >     - remove set_foreign_p2m_entry() changes, they will be properly
> > > implemented
> > >       in the follow-up patch
> > >     - select IOREQ_SERVER for Arm instead of Arm64 in Kconfig
> > >     - remove x86's realmode and other unneeded stubs from xen/ioreq.h
> > >     - clafify ioreq_t p.df usage in try_fwd_ioserv()
> > >     - set ioreq_t p.count to 1 in try_fwd_ioserv()
> > > 
> > > Changes V1 -> V2:
> > >     - was split into:
> > >       - arm/ioreq: Introduce arch specific bits for IOREQ/DM features
> > >       - xen/arm: Stick around in leave_hypervisor_to_guest until I/O has
> > > completed
> > >     - update the author of a patch
> > >     - update patch description
> > >     - move a loop in leave_hypervisor_to_guest() to a separate patch
> > >     - set IOREQ_SERVER disabled by default
> > >     - remove already clarified /* XXX */
> > >     - replace BUG() by ASSERT_UNREACHABLE() in handle_pio()
> > >     - remove default case for handling the return value of
> > > try_handle_mmio()
> > >     - remove struct hvm_domain, enum hvm_io_completion, struct
> > > hvm_vcpu_io,
> > >       struct hvm_vcpu from asm-arm/domain.h, these are common materials
> > > now
> > >     - update everything according to the recent changes (IOREQ related
> > > function
> > >       names don't contain "hvm" prefixes/infixes anymore, IOREQ related
> > > fields
> > >       are part of common struct vcpu/domain now, etc)
> > > 
> > > Changes V2 -> V3:
> > >     - update patch according the "legacy interface" is x86 specific
> > >     - add dummy arch hooks
> > >     - remove dummy paging_mark_pfn_dirty()
> > >     - don’t include <xen/domain_page.h> in common ioreq.c
> > >     - don’t include <public/hvm/ioreq.h> in arch ioreq.h
> > >     - remove #define ioreq_params(d, i)
> > > 
> > > Changes V3 -> V4:
> > >     - rebase
> > >     - update patch according to the renaming IO_ -> VIO_ (io_ -> vio_)
> > >       and misc changes to arch hooks
> > >     - update patch according to the IOREQ related dm-op handling changes
> > >     - don't include <xen/ioreq.h> from arch header
> > >     - make all arch hooks out-of-line
> > >     - add a comment above IOREQ_STATUS_* #define-s
> > > ---
> > >   xen/arch/arm/Makefile           |   2 +
> > >   xen/arch/arm/dm.c               | 122 +++++++++++++++++++++++
> > >   xen/arch/arm/domain.c           |   9 ++
> > >   xen/arch/arm/io.c               |  12 ++-
> > >   xen/arch/arm/ioreq.c            | 213
> > > ++++++++++++++++++++++++++++++++++++++++
> > >   xen/arch/arm/traps.c            |  13 +++
> > >   xen/include/asm-arm/domain.h    |   3 +
> > >   xen/include/asm-arm/hvm/ioreq.h |  72 ++++++++++++++
> > >   xen/include/asm-arm/mmio.h      |   1 +
> > >   9 files changed, 446 insertions(+), 1 deletion(-)
> > >   create mode 100644 xen/arch/arm/dm.c
> > >   create mode 100644 xen/arch/arm/ioreq.c
> > >   create mode 100644 xen/include/asm-arm/hvm/ioreq.h
> > > 
> > > diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> > > index 512ffdd..16e6523 100644
> > > --- a/xen/arch/arm/Makefile
> > > +++ b/xen/arch/arm/Makefile
> > > @@ -13,6 +13,7 @@ obj-y += cpuerrata.o
> > >   obj-y += cpufeature.o
> > >   obj-y += decode.o
> > >   obj-y += device.o
> > > +obj-$(CONFIG_IOREQ_SERVER) += dm.o
> > >   obj-y += domain.o
> > >   obj-y += domain_build.init.o
> > >   obj-y += domctl.o
> > > @@ -27,6 +28,7 @@ obj-y += guest_atomics.o
> > >   obj-y += guest_walk.o
> > >   obj-y += hvm.o
> > >   obj-y += io.o
> > > +obj-$(CONFIG_IOREQ_SERVER) += ioreq.o
> > >   obj-y += irq.o
> > >   obj-y += kernel.init.o
> > >   obj-$(CONFIG_LIVEPATCH) += livepatch.o
> > > diff --git a/xen/arch/arm/dm.c b/xen/arch/arm/dm.c
> > > new file mode 100644
> > > index 0000000..e6dedf4
> > > --- /dev/null
> > > +++ b/xen/arch/arm/dm.c
> > > @@ -0,0 +1,122 @@
> > > +/*
> > > + * Copyright (c) 2019 Arm ltd.
> > > + *
> > > + * This program is free software; you can redistribute it and/or modify
> > > it
> > > + * under the terms and conditions of the GNU General Public License,
> > > + * version 2, as published by the Free Software Foundation.
> > > + *
> > > + * This program is distributed in the hope it will be useful, but WITHOUT
> > > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> > > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
> > > for
> > > + * more details.
> > > + *
> > > + * You should have received a copy of the GNU General Public License
> > > along with
> > > + * this program; If not, see <http://www.gnu.org/licenses/>.
> > > + */
> > > +
> > > +#include <xen/dm.h>
> > > +#include <xen/guest_access.h>
> > > +#include <xen/hypercall.h>
> > > +#include <xen/ioreq.h>
> > > +#include <xen/nospec.h>
> > > +
> > > +static int dm_op(const struct dmop_args *op_args)
> > > +{
> > > +    struct domain *d;
> > > +    struct xen_dm_op op;
> > > +    bool const_op = true;
> > > +    long rc;
> > > +    size_t offset;
> > > +
> > > +    static const uint8_t op_size[] = {
> > > +        [XEN_DMOP_create_ioreq_server]              = sizeof(struct
> > > xen_dm_op_create_ioreq_server),
> > > +        [XEN_DMOP_get_ioreq_server_info]            = sizeof(struct
> > > xen_dm_op_get_ioreq_server_info),
> > > +        [XEN_DMOP_map_io_range_to_ioreq_server]     = sizeof(struct
> > > xen_dm_op_ioreq_server_range),
> > > +        [XEN_DMOP_unmap_io_range_from_ioreq_server] = sizeof(struct
> > > xen_dm_op_ioreq_server_range),
> > > +        [XEN_DMOP_set_ioreq_server_state]           = sizeof(struct
> > > xen_dm_op_set_ioreq_server_state),
> > > +        [XEN_DMOP_destroy_ioreq_server]             = sizeof(struct
> > > xen_dm_op_destroy_ioreq_server),
> > > +    };
> > > +
> > > +    rc = rcu_lock_remote_domain_by_id(op_args->domid, &d);
> > > +    if ( rc )
> > > +        return rc;
> > > +
> > > +    rc = xsm_dm_op(XSM_DM_PRIV, d);
> > > +    if ( rc )
> > > +        goto out;
> > > +
> > > +    offset = offsetof(struct xen_dm_op, u);
> > > +
> > > +    rc = -EFAULT;
> > > +    if ( op_args->buf[0].size < offset )
> > > +        goto out;
> > > +
> > > +    if ( copy_from_guest_offset((void *)&op, op_args->buf[0].h, 0,
> > > offset) )
> > > +        goto out;
> > > +
> > > +    if ( op.op >= ARRAY_SIZE(op_size) )
> > > +    {
> > > +        rc = -EOPNOTSUPP;
> > > +        goto out;
> > > +    }
> > > +
> > > +    op.op = array_index_nospec(op.op, ARRAY_SIZE(op_size));
> > > +
> > > +    if ( op_args->buf[0].size < offset + op_size[op.op] )
> > > +        goto out;
> > > +
> > > +    if ( copy_from_guest_offset((void *)&op.u, op_args->buf[0].h, offset,
> > > +                                op_size[op.op]) )
> > > +        goto out;
> > > +
> > > +    rc = -EINVAL;
> > > +    if ( op.pad )
> > > +        goto out;
> > > +
> > > +    rc = ioreq_server_dm_op(&op, d, &const_op);
> > > +
> > > +    if ( (!rc || rc == -ERESTART) &&
> > > +         !const_op && copy_to_guest_offset(op_args->buf[0].h, offset,
> > > +                                           (void *)&op.u, op_size[op.op])
> > > )
> > > +        rc = -EFAULT;
> > > +
> > > + out:
> > > +    rcu_unlock_domain(d);
> > > +
> > > +    return rc;
> > > +}
> > > +
> > > +long do_dm_op(domid_t domid,
> > > +              unsigned int nr_bufs,
> > > +              XEN_GUEST_HANDLE_PARAM(xen_dm_op_buf_t) bufs)
> > > +{
> > > +    struct dmop_args args;
> > > +    int rc;
> > > +
> > > +    if ( nr_bufs > ARRAY_SIZE(args.buf) )
> > > +        return -E2BIG;
> > > +
> > > +    args.domid = domid;
> > > +    args.nr_bufs = array_index_nospec(nr_bufs, ARRAY_SIZE(args.buf) + 1);
> > > +
> > > +    if ( copy_from_guest_offset(&args.buf[0], bufs, 0, args.nr_bufs) )
> > > +        return -EFAULT;
> > > +
> > > +    rc = dm_op(&args);
> > > +
> > > +    if ( rc == -ERESTART )
> > > +        rc = hypercall_create_continuation(__HYPERVISOR_dm_op, "iih",
> > > +                                           domid, nr_bufs, bufs);
> > > +
> > > +    return rc;
> > > +}
> > I might have missed something in the discussions but this function is
> > identical to xen/arch/x86/hvm/dm.c:do_dm_op, why not make it common?
> > 
> > Also the previous function dm_op is very similar to
> > xen/arch/x86/hvm/dm.c:dm_op I would prefer to make them common if
> > possible. Was this already discussed?
> Well, let me explain. Both dm_op() and do_dm_op() were indeed common (top
> level dm-op handling common) for previous versions, so Arm's dm.c didn't
> contain this stuff.
> The idea to make it other way around (top level dm-op handling arch-specific
> and call into ioreq_server_dm_op() for otherwise unhandled ops) was discussed
> at [1] which besides
> it's Pros leads to code duplication, so Arm's dm.c has to duplicate some
> stuff, etc.
> I was thinking about moving do_dm_op() which is _same_ for both arches to
> common code, but I am not sure whether it is conceptually correct which that
> new "alternative" approach of handling dm-op.

Yes, I think it makes sense to make do_dm_op common because it is
identical. That should be easy.

I realize that the common part of dm_op is the initial boilerplate which
is similar for every hypercall, so I think it is also OK if we don't
share it and leave it as it is in this version of the series.
--8323329-1928124558-1611102222=:14528--

