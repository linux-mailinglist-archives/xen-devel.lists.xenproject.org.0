Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7768967895D
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 22:19:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483223.749249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK4Dq-0000Ol-Aa; Mon, 23 Jan 2023 21:19:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483223.749249; Mon, 23 Jan 2023 21:19:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK4Dq-0000MZ-6E; Mon, 23 Jan 2023 21:19:22 +0000
Received: by outflank-mailman (input) for mailman id 483223;
 Mon, 23 Jan 2023 21:19:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QMpG=5U=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pK4Dp-0000K1-5U
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 21:19:21 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9934eb3f-9b63-11ed-91b6-6bf2151ebd3b;
 Mon, 23 Jan 2023 22:19:20 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A512460F2E;
 Mon, 23 Jan 2023 21:19:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EEDCC433EF;
 Mon, 23 Jan 2023 21:19:16 +0000 (UTC)
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
X-Inumbo-ID: 9934eb3f-9b63-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674508758;
	bh=cqCtiK4ukFa/0TkCKXPnG484yhJtk7LDq13c08g11Vg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pS8ibk1ZZt8GC0ocWk5XVf29YuTsCO/kKEIM6wMtmsqytwZwahW+NYCq0y5AQ7+qq
	 rzWkKm9cNBFmzImy4HZ3k0BZ55J4QgpiAvtuP8oxhavV/xQHayE63vR453za2s66Di
	 3jp45qmciluE42hL6niGZvdyZX/lBdkdQMY4/u0HTV/z7sbzFxgTpOVw8rEytXRPL3
	 3aJ7IXT+2IzkNP90SmxVEdq6j6FD4a7NtGKibi+IjVDpWGPXTo6wqFh4aKMc48p7X+
	 NsgesAZ47JT/ITBCyAOTbmnGwfKX8nCcyNAMlrDaIoYhlyJ5SuUAJzyeZesQDJ6cHL
	 5cg3gdvWnohPQ==
Date: Mon, 23 Jan 2023 13:19:14 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    stefano.stabellini@amd.com, julien@xen.org, Volodymyr_Babchuk@epam.com, 
    bertrand.marquis@arm.com, andrew.cooper3@citrix.com, 
    george.dunlap@citrix.com, jbeulich@suse.com, wl@xen.org, 
    xuwei5@hisilicon.com
Subject: Re: [XEN v3 1/3] xen/arm: Use the correct format specifier
In-Reply-To: <20230123134451.47185-2-ayan.kumar.halder@amd.com>
Message-ID: <alpine.DEB.2.22.394.2301231313370.1978264@ubuntu-linux-20-04-desktop>
References: <20230123134451.47185-1-ayan.kumar.halder@amd.com> <20230123134451.47185-2-ayan.kumar.halder@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 23 Jan 2023, Ayan Kumar Halder wrote:
> 1. One should use 'PRIpaddr' to display 'paddr_t' variables. However,
> while creating nodes in fdt, the address (if present in the node name)
> should be represented using 'PRIx64'. This is to be in conformance
> with the following rule present in https://elinux.org/Device_Tree_Linux
> 
> . node names
> "unit-address does not have leading zeros"
> 
> As 'PRIpaddr' introduces leading zeros, we cannot use it.
> 
> So, we have introduced a wrapper ie domain_fdt_begin_node() which will
> represent physical address using 'PRIx64'.
> 
> 2. One should use 'PRIx64' to display 'u64' in hex format. The current
> use of 'PRIpaddr' for printing PTE is buggy as this is not a physical
> address.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> 
> Changes from -
> 
> v1 - 1. Moved the patch earlier.
> 2. Moved a part of change from "[XEN v1 8/9] xen/arm: Other adaptations required to support 32bit paddr"
> into this patch.
> 
> v2 - 1. Use PRIx64 for appending addresses to fdt node names. This fixes the CI failure.
> 
>  xen/arch/arm/domain_build.c | 45 +++++++++++++++++--------------------
>  xen/arch/arm/gic-v2.c       |  6 ++---
>  xen/arch/arm/mm.c           |  2 +-

The changes to mm.c and gic-v2.c look OK and I'd ack them already. One
question on the changes to domain_build.c below.


>  3 files changed, 25 insertions(+), 28 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index f35f4d2456..97c2395f9a 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1288,6 +1288,20 @@ static int __init fdt_property_interrupts(const struct kernel_info *kinfo,
>      return res;
>  }
>  
> +static int __init domain_fdt_begin_node(void *fdt, const char *name,
> +                                        uint64_t unit)
> +{
> +    /*
> +     * The size of the buffer to hold the longest possible string ie
> +     * interrupt-controller@ + a 64-bit number + \0
> +     */
> +    char buf[38];
> +
> +    /* ePAPR 3.4 */
> +    snprintf(buf, sizeof(buf), "%s@%"PRIx64, name, unit);
> +    return fdt_begin_node(fdt, buf);
> +}
> +
>  static int __init make_memory_node(const struct domain *d,
>                                     void *fdt,
>                                     int addrcells, int sizecells,
> @@ -1296,8 +1310,6 @@ static int __init make_memory_node(const struct domain *d,
>      unsigned int i;
>      int res, reg_size = addrcells + sizecells;
>      int nr_cells = 0;
> -    /* Placeholder for memory@ + a 64-bit number + \0 */
> -    char buf[24];
>      __be32 reg[NR_MEM_BANKS * 4 /* Worst case addrcells + sizecells */];
>      __be32 *cells;
>  
> @@ -1314,9 +1326,7 @@ static int __init make_memory_node(const struct domain *d,
>  
>      dt_dprintk("Create memory node\n");
>  
> -    /* ePAPR 3.4 */
> -    snprintf(buf, sizeof(buf), "memory@%"PRIx64, mem->bank[i].start);
> -    res = fdt_begin_node(fdt, buf);
> +    res = domain_fdt_begin_node(fdt, "memory", mem->bank[i].start);

Basically this "hides" the paddr_t->uint64_t cast because it happens
implicitly when passing mem->bank[i].start as an argument to
domain_fdt_begin_node.

To be honest, I don't know if it is necessary. Also a normal cast would
be fine:

    snprintf(buf, sizeof(buf), "memory@%"PRIx64, (uint64_t)mem->bank[i].start);
    res = fdt_begin_node(fdt, buf);

Julien, what do you prefer?

