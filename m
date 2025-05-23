Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74763AC2BB9
	for <lists+xen-devel@lfdr.de>; Sat, 24 May 2025 00:20:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.996284.1378082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIajn-0008CD-PH; Fri, 23 May 2025 22:19:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 996284.1378082; Fri, 23 May 2025 22:19:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIajn-00089k-MO; Fri, 23 May 2025 22:19:35 +0000
Received: by outflank-mailman (input) for mailman id 996284;
 Fri, 23 May 2025 22:19:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jiit=YH=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uIajl-00089e-Jj
 for xen-devel@lists.xenproject.org; Fri, 23 May 2025 22:19:34 +0000
Received: from 11.mo584.mail-out.ovh.net (11.mo584.mail-out.ovh.net
 [46.105.34.195]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ffc653bc-3823-11f0-a2fb-13f23c93f187;
 Sat, 24 May 2025 00:19:31 +0200 (CEST)
Received: from director7.ghost.mail-out.ovh.net (unknown [10.108.25.12])
 by mo584.mail-out.ovh.net (Postfix) with ESMTP id 4b402C1hNgz1F9b
 for <xen-devel@lists.xenproject.org>; Fri, 23 May 2025 22:19:31 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-d7x5r (unknown [10.110.96.204])
 by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 70ED3C0152;
 Fri, 23 May 2025 22:19:30 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.96])
 by ghost-submission-5b5ff79f4f-d7x5r with ESMTPSA
 id tj8sEnL0MGiFCAwASDrGwQ
 (envelope-from <sergii.dmytruk@3mdeb.com>); Fri, 23 May 2025 22:19:30 +0000
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
X-Inumbo-ID: ffc653bc-3823-11f0-a2fb-13f23c93f187
Authentication-Results:garm.ovh; auth=pass (GARM-96R0014b5fd9bb-90f1-4b7c-bdb6-c6f1abd9979a,
                    CD0F819BC38912917CA9DC5475EC3E7C21FBB083) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.184.221
Date: Sat, 24 May 2025 01:19:17 +0300
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Ross Philipson <ross.philipson@oracle.com>,
	trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 02/22] include/xen/slr-table.h: Secure Launch Resource
 Table definitions
Message-ID: <aDD0ZYM-PtV7NKVc@MjU3Nj>
References: <cover.1747155790.git.sergii.dmytruk@3mdeb.com>
 <cdd7b9ff21c81683ce2245bc2b5e0a7a87e51e3c.1747155790.git.sergii.dmytruk@3mdeb.com>
 <4896ab0b-f45e-43e9-bcee-f5496717eb2a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4896ab0b-f45e-43e9-bcee-f5496717eb2a@suse.com>
X-Ovh-Tracer-Id: 17614422570925012057
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddutddtfeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepvdfgveegtdffhfdugeevieehkeetudevfeefgedtleejledvfeeutdetudeiveelnecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukeegrddvvddupdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdfovfetjfhoshhtpehmohehkeegmgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=hnb3sgRi2PbChx3uTtxmnmJ701Vr32dxeYKoEIZN/2g=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1748038771; v=1;
 b=dEy0nCeXc6MHHc0gg/1Fmv3NYRd7j63FIhVM48Wo++kvgRURdpfB3WWJ05R5AiCK56h+7Ini
 +OrJaw5yl8Xrrl2cbvnWwWTsUw43v2ykFh2hLutlv3U6s0f3Q3B2jI36Dax6daFcNyr9VbKrEks
 sftsjfkkgLv1IT3uyMiIZflRVChp1u82kiQoI5QeuTYSnCRtpwiIoHLMfTZ17ITGkH2hDlj7odb
 /HG5OHUFHNMslmUwWfQR8lS4+0gcZZa/Q0buIHZp0eD3WmWb15NS/e9V09eg7IzTLjEWfTtmIXh
 AVEN1ciyjiC8m1xhrXhXtpLLgYJ38JzecuweTphqyMQkA==

On Wed, May 21, 2025 at 05:45:04PM +0200, Jan Beulich wrote:
> > +/* SPDX-License-Identifier: GPL-2.0 */
>
> GPL-2.0-only is, I think, the one to use for new code.

Right.

> > +/*
> > + *  Copyright (c) 2025 Apertus Solutions, LLC
> > + *  Copyright (c) 2025 Oracle and/or its affiliates.
> > + *  Copyright (c) 2025 3mdeb Sp. z o.o
>
> I'm curious: Considering the (just) 2 S-o-b, where's the 3rd copyright
> line coming from?

I'll add "Daniel P. Smith" (already in CC), not sure why his S-o-B
wasn't there.

> > +#include <xen/types.h>
>
> Looks like xen/stdint.h would suffice?

It would for types, but there is also use of `NULL`.

> > +#define UEFI_SLR_TABLE_GUID \
> > +    { 0x877a9b2aU, 0x0385, 0x45d1, { 0xa0, 0x34, 0x9d, 0xac, 0x9c, 0x9e, 0x56, 0x5f } }
>
> I'm not sure this is a good place to put UEFI GUIDs. Considering e.g ...

It's here because the GUID is related more to SLRT than to EFI.  I can
move it if there is a more fitting place for table GUIDs.

> > +/* SLR table header values */
> > +#define SLR_TABLE_MAGIC         0x4452544d
> > +#define SLR_TABLE_REVISION      1
> > +
> > +/* Current revisions for the policy and UEFI config */
> > +#define SLR_POLICY_REVISION         1
> > +#define SLR_UEFI_CONFIG_REVISION    1
>
> ... this, is the whole concept perhaps bound to UEFI? In which casethe
> whole header may want to move to the efi/ subdir?

This isn't EFI-specific, legacy boot is supported.  Some types of
entries are there to provide EFI-specific information.

> > +/* SLR defined architectures */
> > +#define SLR_INTEL_TXT   1
> > +#define SLR_AMD_SKINIT  2
>
> These are both x86, yet the header is put in the common include dir?

It's x86-specific with the goal to add more architectures in the future.
I don't know, maybe the header should start as arch-specific and be
moved later, your call.

> > +/*
> > + * Primary SLR Table Header
> > + */
> > +struct slr_table
> > +{
> > +    uint32_t magic;
> > +    uint16_t revision;
> > +    uint16_t architecture;
> > +    uint32_t size;
> > +    uint32_t max_size;
> > +    /* entries[] */
> > +} __packed;
>
> If x86-specific, the question on the need for some of the __packed arises
> again.

The table is used to communicate data from pre-DRTM world to DRTM-world
and is produced and consumed by unrelated software components that don't
necessarily pad structures the same way by default.

> > +/*
> > + * Prototype of a function pointed to by slr_entry_dl_info::dl_handler.
> > + */
> > +typedef void (*dl_handler_func)(struct slr_bl_context *bl_context);
>
> It being an internal header, ...
> > +    uint64_t dl_handler;
>
> ... why can't this type be used here then? This would presumably avoid a
> typecast later.

It's not an internal header in my understanding of the phrase, Xen
parses what a bootloader has passed to it.  In principle, pointers could
be 32-bit here.

> > +static inline void *
> > +slr_end_of_entries(struct slr_table *table)
> > +{
> > +    return (uint8_t *)table + table->size;
>
> Considering the function's return type, why not cast to void * (or perhaps
> const void *, if the return type also can be such)?

No particular reason other than that pointer arithmetic on
pointers-to-void typically causes build issues.  Can be changed for Xen.

> > +static inline struct slr_entry_hdr *
> > +slr_next_entry(struct slr_table *table, struct slr_entry_hdr *curr)
> > +{
> > +    struct slr_entry_hdr *next = (struct slr_entry_hdr *)
> > +                                 ((uint8_t *)curr + curr->size);
> > +
> > +    if ( (void *)next >= slr_end_of_entries(table) )
> > +        return NULL;
>
> Is this sufficient as a check? With it fulfilled, ...
>
> > +    if ( next->tag == SLR_ENTRY_END )
>
> ... this member access may still be out of bounds. IOW the question is what
> level of checking is really adequate here.

SLR_ENTRY_END should really end the table, but it won't hurt to check
for out of bounds.  Thanks, will correct the checks.

> > +static inline struct slr_entry_hdr *
> > +slr_next_entry_by_tag (struct slr_table *table,
> > +                       struct slr_entry_hdr *entry,
> > +                       uint16_t tag)
> > +{
> > +    if ( !entry ) /* Start from the beginning */
> > +        entry = (struct slr_entry_hdr *)((uint8_t *)table + sizeof(*table));
>
> Extending from the earlier comment - if the inner cast was to void * here,
> the outer one could be dropped altogether.
>
> Jan

Will update.

Regards

