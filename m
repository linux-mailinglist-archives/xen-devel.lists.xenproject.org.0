Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30683A01206
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 04:10:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865055.1276331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTuYZ-0004mv-Br; Sat, 04 Jan 2025 03:10:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865055.1276331; Sat, 04 Jan 2025 03:10:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTuYZ-0004kc-9B; Sat, 04 Jan 2025 03:10:31 +0000
Received: by outflank-mailman (input) for mailman id 865055;
 Sat, 04 Jan 2025 03:10:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EL/b=T4=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tTuYY-0004kW-Em
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 03:10:30 +0000
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch
 [79.135.106.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72f3b4f7-ca49-11ef-99a4-01e77a169b0f;
 Sat, 04 Jan 2025 04:10:28 +0100 (CET)
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
X-Inumbo-ID: 72f3b4f7-ca49-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=7fyxwhh2cnbqlkje3owrtbtyky.protonmail; t=1735960227; x=1736219427;
	bh=Ea91WjPHt+jk6cnJKHcgpo0936/C1rZ6OzNv1WJGFiU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=FvmLdtcfl8YQGYMnQ+zsndugtbsJOb83nVxThRDA42OKpv3RqoqipG0uoBzb/9qPG
	 GF6NuVKl6UqLGWiEh+1mpItbmzEbMH4HH0cDFlz0dLUhygGqoqyCDKzfvGNqiVm4uw
	 l3aVzvG37Ehzerokg25rJWY2zxY9cZA2+ZAaXerqRJqZYq2F/hS/k/C6K9G3kvzmZV
	 QxmoWaRnpRbIK9oracpAIv9r0Y29o4SjTmg3fyh7n7oH9FVcu/mwk+3fO03jDkRbIp
	 86XrTry0rVwDcLVGPLKD6sFe7i7J7kdCpTMK5e2HdlmUrecfyS+jq5j1GW4XNNXT4j
	 pYMgrxNZtFT9g==
Date: Sat, 04 Jan 2025 03:10:24 +0000
To: =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 01/35] xen: introduce resource.h
Message-ID: <eActpA9Scg88OPQSbzmFvok9nWeuF4gL0VTil8vAKEyhXpkeR7WrgNaXvV5GG4-IJ16_e59X6Bdoe0zae61sMkERLgdWzZki0EtDmWBjYCk=@proton.me>
In-Reply-To: <Z1lxIlvZs449Pq5-@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-1-e9aa923127eb@ford.com> <Z1lxIlvZs449Pq5-@macbook.local>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 439b9c49ac7b0fe448f5c10be997e2c3f5427d0e
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Wednesday, December 11th, 2024 at 3:01 AM, Roger Pau Monn=C3=A9 <roger.p=
au@citrix.com> wrote:

>
>
> On Thu, Dec 05, 2024 at 08:41:31PM -0800, Denis Mukhin via B4 Relay wrote=
:
>
> > From: Denis Mukhin dmukhin@ford.com
> >
> > Move resource definitions to a new architecture-agnostic shared header =
file.
> >
> > It will be used in follow on NS8250 emulator code to describe legacy
> > PC COM resources.
> >
> > Signed-off-by: Denis Mukhin dmukhin@ford.com
> > ---
> > xen/common/device-tree/device-tree.c | 21 +------------------
> > xen/drivers/passthrough/arm/smmu.c | 15 +-------------
> > xen/include/xen/resource.h | 40 ++++++++++++++++++++++++++++++++++++
> > 3 files changed, 42 insertions(+), 34 deletions(-)
> >
> > diff --git a/xen/common/device-tree/device-tree.c b/xen/common/device-t=
ree/device-tree.c
> > index d0528c5825651f7cc9ebca0c949229c9083063c6..e8f810b2fe10890c033ed3a=
9d4ca627010ad019b 100644
> > --- a/xen/common/device-tree/device-tree.c
> > +++ b/xen/common/device-tree/device-tree.c
> > @@ -24,6 +24,7 @@
> > #include <xen/ctype.h>
> > #include <asm/setup.h>
> > #include <xen/err.h>
> > +#include <xen/resource.h>
> >
> > const void *device_tree_flattened;
> > dt_irq_xlate_func dt_irq_xlate;
> > @@ -535,26 +536,6 @@ int dt_child_n_size_cells(const struct dt_device_n=
ode *parent)
> > return __dt_n_size_cells(parent, true);
> > }
> >
> > -/*
> > - * These are defined in Linux where much of this code comes from, but
> > - * are currently unused outside this file in the context of Xen.
> > - /
> > -#define IORESOURCE_BITS 0x000000ff / Bus-specific bits /
> > -
> > -#define IORESOURCE_TYPE_BITS 0x00001f00 / Resource type /
> > -#define IORESOURCE_IO 0x00000100 / PCI/ISA I/O ports /
> > -#define IORESOURCE_MEM 0x00000200
> > -#define IORESOURCE_REG 0x00000300 / Register offsets /
> > -#define IORESOURCE_IRQ 0x00000400
> > -#define IORESOURCE_DMA 0x00000800
> > -#define IORESOURCE_BUS 0x00001000
> > -
> > -#define IORESOURCE_PREFETCH 0x00002000 / No side effects /
> > -#define IORESOURCE_READONLY 0x00004000
> > -#define IORESOURCE_CACHEABLE 0x00008000
> > -#define IORESOURCE_RANGELENGTH 0x00010000
> > -#define IORESOURCE_SHADOWABLE 0x00020000
> > -
> > /
> > * Default translator (generic bus)
> > /
> > diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrou=
gh/arm/smmu.c
> > index 03d22bce1e497e41834c273f9048b98dcbd48a54..aa6a968b574dce7cc753e80=
70fad3a6e585cd9e7 100644
> > --- a/xen/drivers/passthrough/arm/smmu.c
> > +++ b/xen/drivers/passthrough/arm/smmu.c
> > @@ -50,6 +50,7 @@
> > #include <xen/rbtree.h>
> > #include <xen/sched.h>
> > #include <xen/sizes.h>
> > +#include <xen/resource.h>
> > #include <asm/atomic.h>
> > #include <asm/device.h>
> > #include <asm/io.h>
> > @@ -70,22 +71,8 @@
> > #define of_property_read_u32(np, pname, out) (!dt_property_read_u32(np,=
 pname, out))
> > #define of_property_read_bool dt_property_read_bool
> > #define of_parse_phandle_with_args dt_parse_phandle_with_args
> > -
> > -/ Xen: Helpers to get device MMIO and IRQs */
> > -struct resource
> > -{
> > - paddr_t addr;
> > - paddr_t size;
> > - unsigned int type;
> > -};
> > -
> > -#define resource_size(res) (res)->size;
> > -
> > #define platform_device dt_device_node
> >
> > -#define IORESOURCE_MEM 0
> > -#define IORESOURCE_IRQ 1
> > -
> > static struct resource *platform_get_resource(struct platform_device pd=
ev,
> > unsigned int type,
> > unsigned int num)
> > diff --git a/xen/include/xen/resource.h b/xen/include/xen/resource.h
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..4962e17da8387b7f3243174=
82b19cc9fe71433fc
> > --- /dev/null
> > +++ b/xen/include/xen/resource.h
> > @@ -0,0 +1,40 @@
> > +/ SPDX-License-Identifier: GPL-2.0 /
> > +/
> > + * System resource description.
> > + *
> > + * Reference:
> > + * include/linux/ioport.h
> > + /
> > +#if !defined(XEN__RESOURCE_H)
> > +#define XEN__RESOURCE_H
> > +
> > +#define IORESOURCE_BITS 0x000000FFU / Bus-specific bits /
> > +
> > +#define IORESOURCE_TYPE_BITS 0x00001F00U / Resource type /
> > +#define IORESOURCE_IO 0x00000100U / PCI/ISA I/O ports /
> > +#define IORESOURCE_MEM 0x00000200U
> > +#define IORESOURCE_REG 0x00000300U / Register offsets /
> > +#define IORESOURCE_IRQ 0x00000400U
> > +#define IORESOURCE_DMA 0x00000800U
> > +#define IORESOURCE_BUS 0x00001000U
> > +
> > +#define IORESOURCE_PREFETCH 0x00002000U / No side effects */
> > +#define IORESOURCE_READONLY 0x00004000U
> > +#define IORESOURCE_CACHEABLE 0x00008000U
> > +#define IORESOURCE_RANGELENGTH 0x00010000U
> > +#define IORESOURCE_SHADOWABLE 0x00020000U
> > +
> > +#define IORESOURCE_UNKNOWN (~0U)
> > +
> > +struct resource {
> > + paddr_t addr;
> > + paddr_t size;
> > + unsigned int type;
> > +};
> > +
> > +#define resource_size(res) (res)->size;
> > +
> > +#define foreach_resource(res) \
>
>
> Nit: we usually name those for_each_foo instead of foreach_foo.

Fixed.

>
> > + for (; res && res->type !=3D IORESOURCE_UNKNOWN; res++)
>
>
> Missing spaces between parentheses:
>
> for ( ; res && res->type !=3D IORESOURCE_UNKNOWN; res++ )

Fixed.

>
>
> Note that this macro will modify (advance) the res pointer, which is
> maybe unexpected by the caller?

For my use case I rely on res pointer advance.

>
> Also, the current logic forces the array of resources to always have a
> trailing IORESOURCE_UNKNOWN element in order to break the loop, it
> might be better to pass an explicit number of elements to iterate
> against if possible?

Current use is pretty simple, I think I will keep it as is for now.

>
> As Jan said, it would be helpful to have an example usage of the
> macro.

I moved this definition into the patch where it is first used in v3 (UART e=
mulator
patch).

>
> Thanks, Roger.



