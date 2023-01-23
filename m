Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC79678B23
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 23:57:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483325.749432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK5kb-0003NP-JQ; Mon, 23 Jan 2023 22:57:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483325.749432; Mon, 23 Jan 2023 22:57:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK5kb-0003Kd-Fa; Mon, 23 Jan 2023 22:57:17 +0000
Received: by outflank-mailman (input) for mailman id 483325;
 Mon, 23 Jan 2023 22:57:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QMpG=5U=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pK5kZ-00038N-UO
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 22:57:16 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46398847-9b71-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 23:57:13 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AE38961031;
 Mon, 23 Jan 2023 22:57:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86106C433EF;
 Mon, 23 Jan 2023 22:57:10 +0000 (UTC)
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
X-Inumbo-ID: 46398847-9b71-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674514632;
	bh=GniFwgcaAWQxgdXWlx3+kZYStenbwsfAq5vmYFxpr/Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=r0mxdAUYGEZY4N1NdcpWa9+MDNtNyh73VkHN4FMsqEqmGXAX2+eRhWB/UoRsGWUkh
	 RcXZLNLcufl0+p1Y6/d12nThMraiJJZ+jgyOZe8VMvcitkrAyygtEMxiQlS5h44Q73
	 eCpXWDpaozHRXtOyizos6GCee8+HP3eU7zGMVNni200L0fuxyJAhwMy+cR7lZ2tO+u
	 X2LCeYMFYbQzzfi6p0/TxzJvIt48iTkMjfsn4YTFX1aQhztjF5FhF2+vicMgNGMrO2
	 XhHJNg7jYkzznH/46Pyd1E38yXyDqqsQgCG3i5kWjfkvqbu+dc/cV1/uCLzy5dtAZr
	 hgFpbfgN54O3A==
Date: Mon, 23 Jan 2023 14:57:08 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Ayan Kumar Halder <ayan.kumar.halder@amd.com>, 
    xen-devel@lists.xenproject.org, stefano.stabellini@amd.com, 
    Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com, 
    andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com, 
    wl@xen.org, xuwei5@hisilicon.com
Subject: Re: [XEN v3 1/3] xen/arm: Use the correct format specifier
In-Reply-To: <af94ef17-0891-4540-4238-ef842b8af249@xen.org>
Message-ID: <alpine.DEB.2.22.394.2301231456510.1978264@ubuntu-linux-20-04-desktop>
References: <20230123134451.47185-1-ayan.kumar.halder@amd.com> <20230123134451.47185-2-ayan.kumar.halder@amd.com> <alpine.DEB.2.22.394.2301231313370.1978264@ubuntu-linux-20-04-desktop> <af94ef17-0891-4540-4238-ef842b8af249@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 23 Jan 2023, Julien Grall wrote:
> Hi Stefano,
> 
> On 23/01/2023 21:19, Stefano Stabellini wrote:
> > On Mon, 23 Jan 2023, Ayan Kumar Halder wrote:
> > > 1. One should use 'PRIpaddr' to display 'paddr_t' variables. However,
> > > while creating nodes in fdt, the address (if present in the node name)
> > > should be represented using 'PRIx64'. This is to be in conformance
> > > with the following rule present in https://elinux.org/Device_Tree_Linux
> > > 
> > > . node names
> > > "unit-address does not have leading zeros"
> > > 
> > > As 'PRIpaddr' introduces leading zeros, we cannot use it.
> > > 
> > > So, we have introduced a wrapper ie domain_fdt_begin_node() which will
> > > represent physical address using 'PRIx64'.
> > > 
> > > 2. One should use 'PRIx64' to display 'u64' in hex format. The current
> > > use of 'PRIpaddr' for printing PTE is buggy as this is not a physical
> > > address.
> > > 
> > > Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> > > ---
> > > 
> > > Changes from -
> > > 
> > > v1 - 1. Moved the patch earlier.
> > > 2. Moved a part of change from "[XEN v1 8/9] xen/arm: Other adaptations
> > > required to support 32bit paddr"
> > > into this patch.
> > > 
> > > v2 - 1. Use PRIx64 for appending addresses to fdt node names. This fixes
> > > the CI failure.
> > > 
> > >   xen/arch/arm/domain_build.c | 45 +++++++++++++++++--------------------
> > >   xen/arch/arm/gic-v2.c       |  6 ++---
> > >   xen/arch/arm/mm.c           |  2 +-
> > 
> > The changes to mm.c and gic-v2.c look OK and I'd ack them already. One
> > question on the changes to domain_build.c below.
> > 
> > 
> > >   3 files changed, 25 insertions(+), 28 deletions(-)
> > > 
> > > diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > > index f35f4d2456..97c2395f9a 100644
> > > --- a/xen/arch/arm/domain_build.c
> > > +++ b/xen/arch/arm/domain_build.c
> > > @@ -1288,6 +1288,20 @@ static int __init fdt_property_interrupts(const
> > > struct kernel_info *kinfo,
> > >       return res;
> > >   }
> > >   +static int __init domain_fdt_begin_node(void *fdt, const char *name,
> > > +                                        uint64_t unit)
> > > +{
> > > +    /*
> > > +     * The size of the buffer to hold the longest possible string ie
> > > +     * interrupt-controller@ + a 64-bit number + \0
> > > +     */
> > > +    char buf[38];
> > > +
> > > +    /* ePAPR 3.4 */
> > > +    snprintf(buf, sizeof(buf), "%s@%"PRIx64, name, unit);
> 
> The return wants to be checked.
> 
> > > +    return fdt_begin_node(fdt, buf);
> > > +}
> > > +
> > >   static int __init make_memory_node(const struct domain *d,
> > >                                      void *fdt,
> > >                                      int addrcells, int sizecells,
> > > @@ -1296,8 +1310,6 @@ static int __init make_memory_node(const struct
> > > domain *d,
> > >       unsigned int i;
> > >       int res, reg_size = addrcells + sizecells;
> > >       int nr_cells = 0;
> > > -    /* Placeholder for memory@ + a 64-bit number + \0 */
> > > -    char buf[24];
> > >       __be32 reg[NR_MEM_BANKS * 4 /* Worst case addrcells + sizecells */];
> > >       __be32 *cells;
> > >   @@ -1314,9 +1326,7 @@ static int __init make_memory_node(const struct
> > > domain *d,
> > >         dt_dprintk("Create memory node\n");
> > >   -    /* ePAPR 3.4 */
> > > -    snprintf(buf, sizeof(buf), "memory@%"PRIx64, mem->bank[i].start);
> > > -    res = fdt_begin_node(fdt, buf);
> > > +    res = domain_fdt_begin_node(fdt, "memory", mem->bank[i].start);
> > 
> > Basically this "hides" the paddr_t->uint64_t cast because it happens
> > implicitly when passing mem->bank[i].start as an argument to
> > domain_fdt_begin_node.
> > 
> > To be honest, I don't know if it is necessary. Also a normal cast would
> > be fine:
> > 
> >      snprintf(buf, sizeof(buf), "memory@%"PRIx64,
> > (uint64_t)mem->bank[i].start);
> >      res = fdt_begin_node(fdt, buf);
> The problem with the open-coding version is you would need to explain the cast
> everywhere (I disliked unexplained one).
> 
> I don't particular mind 'hidden cast' but I think we need to explain on top of
> domain_fdt_begin_node() why it is necessary.
> 
> > 
> > Julien, what do you prefer?
> 
> Definitely the function because that's what I suggested (see the rationale
> above).

OK, no worries

