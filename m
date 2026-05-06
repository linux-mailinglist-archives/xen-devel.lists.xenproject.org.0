Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPJeDNKr+2myewMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 23:00:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 854844E0759
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 23:00:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1302065.1576117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKjKc-0001WB-Sa; Wed, 06 May 2026 20:58:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1302065.1576117; Wed, 06 May 2026 20:58:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKjKc-0001V1-Oh; Wed, 06 May 2026 20:58:58 +0000
Received: by outflank-mailman (input) for mailman id 1302065;
 Wed, 06 May 2026 20:58:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wKjKb-0001Uv-GR
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 20:58:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKjKa-00EinO-FX
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 22:58:56 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69fbab8d-2eae-0a2a0a5409dd-0a2a4504af5e-8
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 22:58:56 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69fbab8e-1dec-0a2a45040019-aceafc1feafa-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 22:58:55 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E8FFE432DE;
 Wed,  6 May 2026 20:58:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93889C2BCB0;
 Wed,  6 May 2026 20:58:53 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20201202 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778101133;
	bh=ygxCrxTmtdcv24MTN9N1JC/G1qLohRd86Aj4uEoj9T0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nFQtCTj8ZS7lgsOVZDHIWOc6O0JOvqyXujLxzkeg2Ma1NvSukyFY7DIwSm6zhrm2Z
	 XCgeaIHhdd1AfF17aXtS7H83p0QM/CogJzykqUhZUrn5y+rqjEQHDnvr3FhbRPJnkX
	 etz8gpN4csyG832+Ek0qfFWiVycVgspV1oSqynJ8a9XdsV7aGI0XYlgqa7DU+WegWk
	 t2iFFCwq3m9M+kxbAfse0KMYRoxpCG/QnguCh9XeKnoyXDlkPpTSdgzjKYwJG5zN7v
	 bhaOc71bziYjb6heDwA9xMjAwSHxIwIOq5xO06NnR33tRnycz6wQrS8OBUTTUj7G/l
	 0RmMCuMP2IzJA==
Date: Wed, 6 May 2026 13:58:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Michal Orzel <michal.orzel@amd.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3] xen/arm: skip holes in physical address space when
 setting up frametable
In-Reply-To: <1EAB6ED4-3D64-4074-830B-EB9F8AD88547@arm.com>
Message-ID: <alpine.DEB.2.22.394.2605061358480.512397@ubuntu-linux-20-04-desktop>
References: <20260506084137.40913-1-michal.orzel@amd.com> <1EAB6ED4-3D64-4074-830B-EB9F8AD88547@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-515320797-1778101133=:512397"
X-purgate-ID: tlsNG-ebf023/1778101136-42B633FF-1C15BF66/0/0
X-purgate-type: clean
X-purgate-size: 6386
X-Rspamd-Queue-Id: 854844E0759
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	CTYPE_MIXED_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[10]

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-515320797-1778101133=:512397
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 6 May 2026, Luca Fancellu wrote:
> Hi Michal,
> 
> > diff --git a/xen/arch/arm/mmu/mm.c b/xen/arch/arm/mmu/mm.c
> > index 6604f3bf4e6a..c4018a61aa01 100644
> > --- a/xen/arch/arm/mmu/mm.c
> > +++ b/xen/arch/arm/mmu/mm.c
> > @@ -6,18 +6,55 @@
> 
> Should we have also #include <xen/bitops.h> because we use
> find_next_*? Apologies I missed this in previous reviews.
> 
> > #include <xen/mm.h>
> > #include <xen/mm-frame.h>
> > #include <xen/pdx.h>
> > +#include <xen/sizes.h>
> > #include <xen/string.h>
> > 
> > -/* Map a frame table to cover physical addresses ps through pe */
> > -void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
> > +static void __init init_frametable_chunk(unsigned long pdx_s,
> > +                                         unsigned long pdx_e)
> > {
> > -    unsigned long nr_pdxs = mfn_to_pdx(mfn_add(maddr_to_mfn(pe), -1)) -
> > -                            mfn_to_pdx(maddr_to_mfn(ps)) + 1;
> > -    unsigned long frametable_size = nr_pdxs * sizeof(struct page_info);
> > -    mfn_t base_mfn;
> > -    const unsigned long mapping_size = frametable_size < MB(32) ? MB(2)
> > -                                                                : MB(32);
> > +    unsigned long nr_pdxs = pdx_e - pdx_s;
> > +    unsigned long chunk_size = nr_pdxs * sizeof(struct page_info);
> > +    unsigned long pfn_align;
> > +    struct page_info *pg;
> >     int rc;
> > +    mfn_t base_mfn;
> > +
> > +    /*
> > +     * In-loop chunks span whole PDX groups, which are always page-size
> > +     * aligned. The last chunk ending at max_pdx may not be, so round up.
> > +     */
> > +    chunk_size = ROUNDUP(chunk_size, PAGE_SIZE);
> > +
> > +    /*
> > +     * Try to align the allocation to the contiguous mapping size so that
> > +     * map_pages_to_xen() can use the contiguous bit.
> > +     */
> > +    pfn_align = ((chunk_size >= MB(32)) ? MB(32) : MB(2)) >> PAGE_SHIFT;
> > +
> > +    base_mfn = alloc_boot_pages(chunk_size >> PAGE_SHIFT, pfn_align);
> > +
> > +    /*
> > +     * Resolve the frametable VA via mfn_to_page(pdx_to_mfn(...)) rather
> > +     * than pdx_to_page() because the generic pdx_to_page() does not subtract
> > +     * frametable_base_pdx. There's more work to be done to make it generic, so
> > +     * for now route through mfn_to_page(), which on Arm applies the
> > +     * frametable_base_pdx offset and yields the correct VA.
> > +     */
> > +    pg = mfn_to_page(pdx_to_mfn(pdx_s));
> > +    rc = map_pages_to_xen((unsigned long)pg, base_mfn,
> > +                          chunk_size >> PAGE_SHIFT,
> > +                          PAGE_HYPERVISOR_RW | _PAGE_BLOCK);
> > +    if ( rc )
> > +        panic("Unable to setup the frametable mappings\n");
> > +
> > +    memset(pg, 0, nr_pdxs * sizeof(struct page_info));
> > +    memset(pg + nr_pdxs, -1,
> > +           chunk_size - nr_pdxs * sizeof(struct page_info));
> > +}
> > +
> > +void __init init_frametable(paddr_t ram_start)
> > +{
> > +    unsigned int sidx, nidx, max_idx;
> > 
> >     /*
> >      * The size of paddr_t should be sufficient for the complete range of
> > @@ -26,24 +63,40 @@ void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
> >     BUILD_BUG_ON((sizeof(paddr_t) * BITS_PER_BYTE) < PADDR_BITS);
> >     BUILD_BUG_ON(sizeof(struct page_info) != PAGE_INFO_SIZE);
> > 
> > -    if ( frametable_size > FRAMETABLE_SIZE )
> > -        panic("The frametable cannot cover the physical region %#"PRIpaddr" - %#"PRIpaddr"\n",
> > -              ps, pe);
> > +    /* init_frametable_chunk() allocation alignment assumes 4KB granule */
> > +    BUILD_BUG_ON(PAGE_SIZE != SZ_4K);
> > 
> > -    frametable_base_pdx = mfn_to_pdx(maddr_to_mfn(ps));
> > -    /* Round up to 2M or 32M boundary, as appropriate. */
> > -    frametable_size = ROUNDUP(frametable_size, mapping_size);
> > -    base_mfn = alloc_boot_pages(frametable_size >> PAGE_SHIFT, 32<<(20-12));
> > +    /* In-loop chunks must produce page-aligned frametable regions */
> > +    BUILD_BUG_ON((PDX_GROUP_COUNT * sizeof(struct page_info)) % PAGE_SIZE);
> > 
> > -    rc = map_pages_to_xen(FRAMETABLE_VIRT_START, base_mfn,
> > -                          frametable_size >> PAGE_SHIFT,
> > -                          PAGE_HYPERVISOR_RW | _PAGE_BLOCK);
> > -    if ( rc )
> > -        panic("Unable to setup the frametable mappings.\n");
> > +    max_idx = DIV_ROUND_UP(max_pdx, PDX_GROUP_COUNT);
> > +    frametable_base_pdx = mfn_to_pdx(maddr_to_mfn(ram_start));
> > +
> > +    /*
> > +     * Mapping address in init_frametable_chunk must be page-aligned
> > +     * for map_pages_to_xen(). Aligning to PDX_GROUP_COUNT guarantees this
> > +     * because PDX_GROUP_COUNT * sizeof(page_info) is always a multiple of
> > +     * PAGE_SIZE by construction.
> > +     */
> > +    frametable_base_pdx = ROUNDDOWN(frametable_base_pdx, PDX_GROUP_COUNT);
> > +
> > +    if ( (max_pdx - frametable_base_pdx) > FRAMETABLE_NR )
> > +        panic("Frametable too small\n");
> > +
> > +    for ( sidx = (frametable_base_pdx / PDX_GROUP_COUNT); ; sidx = nidx )
> > +    {
> > +        unsigned int eidx;
> > +
> > +        eidx = find_next_zero_bit(pdx_group_valid, max_idx, sidx);
> > +        nidx = find_next_bit(pdx_group_valid, max_idx, eidx);
> > +
> > +        if ( nidx >= max_idx )
> > +            break;
> > +
> > +        init_frametable_chunk(sidx * PDX_GROUP_COUNT, eidx * PDX_GROUP_COUNT);
> > +    }
> > 
> > -    memset(&frame_table[0], 0, nr_pdxs * sizeof(struct page_info));
> > -    memset(&frame_table[nr_pdxs], -1,
> > -           frametable_size - (nr_pdxs * sizeof(struct page_info)));
> > +    init_frametable_chunk(sidx * PDX_GROUP_COUNT, max_pdx);
> > }
> 
> 
> Apart from that the rest looks ok to me. I’ve also tested for Arm64 MMU/MPU and Arm32 MMU.
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> Tested-by: Luca Fancellu <luca.fancellu@arm.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-515320797-1778101133=:512397--

