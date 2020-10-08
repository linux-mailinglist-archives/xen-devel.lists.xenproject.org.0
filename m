Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCB2287795
	for <lists+xen-devel@lfdr.de>; Thu,  8 Oct 2020 17:38:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4509.11795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQXzG-0002uQ-9U; Thu, 08 Oct 2020 15:37:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4509.11795; Thu, 08 Oct 2020 15:37:46 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQXzG-0002u1-6E; Thu, 08 Oct 2020 15:37:46 +0000
Received: by outflank-mailman (input) for mailman id 4509;
 Thu, 08 Oct 2020 15:37:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vbpC=DP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kQXzF-0002tw-78
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 15:37:45 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d522df77-337c-47bc-8229-6c4152d4aa34;
 Thu, 08 Oct 2020 15:37:43 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=vbpC=DP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kQXzF-0002tw-78
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 15:37:45 +0000
X-Inumbo-ID: d522df77-337c-47bc-8229-6c4152d4aa34
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d522df77-337c-47bc-8229-6c4152d4aa34;
	Thu, 08 Oct 2020 15:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602171463;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=1YYGOIXmzwBA9TpHl7w5i85Ax3lz5yMlIe57VEEsLlU=;
  b=Wa35wCD5Y1WLR2qmjh37hP8dZ4Sl7t4+X1zeTGHzispkqg1d63f/gqeL
   A2rWukLgMAfd3wqE4CE87I1Q6gNozEEHYMbNAJd0y9fLsP/fZUoN5FUh1
   zEWWx+A7MTuWe/9NTEfCMTd7H2783jVeK8v0BePRkGbtx1mPEFduKhH3w
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: JkA4QJ2bG+bh9hgFbhym4A9gWPq0Oz9tiMcsNYUTw8upS3GODH3AD+lbJsjZM3d5sNq9i/jXJ5
 t81JD778VIXog3dCI/qQKgvWipfU11EDOqtcmGq2loCcNaoP34NJQ9Kz0VaO5AWKK5mt9IRjof
 EI6RHdjtH6/7HDcMXn/9qz/Y3IoyuMPYCULgSuPRdcV9WQ1lMg9df9rmI0R1mTtl0pRmk/6r/+
 lblCzGRnjbBnKB1Vk9gp+h3e1Ched8uWDEpDKLmQgoR+gIslWlLFeOaqv1F2sdidxnyqbwnQPL
 69g=
X-SBRS: None
X-MesageID: 29619216
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,351,1596513600"; 
   d="scan'208";a="29619216"
Subject: Re: [PATCH v2 4/4] x86/shadow: refactor shadow_vram_{get,put}_l1e()
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan
	<tim@xen.org>
References: <c6b9c903-02eb-d473-86e3-ccb67aff6cd7@suse.com>
 <51515581-19f3-5b7c-a2f9-1a0b11f8283a@suse.com>
 <20201008151556.GL19254@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e769e1ae-fd2f-881e-4dcc-3cbf40d6b732@citrix.com>
Date: Thu, 8 Oct 2020 16:36:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201008151556.GL19254@Air-de-Roger>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 08/10/2020 16:15, Roger Pau Monné wrote:
> On Wed, Sep 16, 2020 at 03:08:40PM +0200, Jan Beulich wrote:
>> By passing the functions an MFN and flags, only a single instance of
>                            ^ a

'an' is correct.

an MFN
a Machine Frame Number

because the pronunciation changes.  "an" precedes anything with a vowel
sound, not just vowels themselves.  (Isn't English great...)

>> each is needed; they were pretty large for being inline functions
>> anyway.
>>
>> While moving the code, also adjust coding style and add const where
>> sensible / possible.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> v2: New.
>>
>> --- a/xen/arch/x86/mm/shadow/hvm.c
>> +++ b/xen/arch/x86/mm/shadow/hvm.c
>> @@ -903,6 +903,104 @@ int shadow_track_dirty_vram(struct domai
>>      return rc;
>>  }
>>  
>> +void shadow_vram_get_mfn(mfn_t mfn, unsigned int l1f,
>> +                         mfn_t sl1mfn, const void *sl1e,
>> +                         const struct domain *d)
>> +{
>> +    unsigned long gfn;
>> +    struct sh_dirty_vram *dirty_vram = d->arch.hvm.dirty_vram;
>> +
>> +    ASSERT(is_hvm_domain(d));
>> +
>> +    if ( !dirty_vram /* tracking disabled? */ ||
>> +         !(l1f & _PAGE_RW) /* read-only mapping? */ ||
>> +         !mfn_valid(mfn) /* mfn can be invalid in mmio_direct */)
>> +        return;
>> +
>> +    gfn = gfn_x(mfn_to_gfn(d, mfn));
>> +    /* Page sharing not supported on shadow PTs */
>> +    BUG_ON(SHARED_M2P(gfn));
>> +
>> +    if ( (gfn >= dirty_vram->begin_pfn) && (gfn < dirty_vram->end_pfn) )
>> +    {
>> +        unsigned long i = gfn - dirty_vram->begin_pfn;
>> +        const struct page_info *page = mfn_to_page(mfn);
>> +
>> +        if ( (page->u.inuse.type_info & PGT_count_mask) == 1 )
>> +            /* Initial guest reference, record it */
>> +            dirty_vram->sl1ma[i] = mfn_to_maddr(sl1mfn) |
>> +                                   PAGE_OFFSET(sl1e);
>> +    }
>> +}
>> +
>> +void shadow_vram_put_mfn(mfn_t mfn, unsigned int l1f,
>> +                         mfn_t sl1mfn, const void *sl1e,
>> +                         const struct domain *d)
>> +{
>> +    unsigned long gfn;
>> +    struct sh_dirty_vram *dirty_vram = d->arch.hvm.dirty_vram;
>> +
>> +    ASSERT(is_hvm_domain(d));
>> +
>> +    if ( !dirty_vram /* tracking disabled? */ ||
>> +         !(l1f & _PAGE_RW) /* read-only mapping? */ ||
>> +         !mfn_valid(mfn) /* mfn can be invalid in mmio_direct */)
>> +        return;
>> +
>> +    gfn = gfn_x(mfn_to_gfn(d, mfn));
>> +    /* Page sharing not supported on shadow PTs */
>> +    BUG_ON(SHARED_M2P(gfn));
>> +
>> +    if ( (gfn >= dirty_vram->begin_pfn) && (gfn < dirty_vram->end_pfn) )
>> +    {
>> +        unsigned long i = gfn - dirty_vram->begin_pfn;
>> +        const struct page_info *page = mfn_to_page(mfn);
>> +        bool dirty = false;
>> +        paddr_t sl1ma = mfn_to_maddr(sl1mfn) | PAGE_OFFSET(sl1e);
>> +
>> +        if ( (page->u.inuse.type_info & PGT_count_mask) == 1 )
>> +        {
>> +            /* Last reference */
>> +            if ( dirty_vram->sl1ma[i] == INVALID_PADDR )
>> +            {
>> +                /* We didn't know it was that one, let's say it is dirty */
>> +                dirty = true;
>> +            }
>> +            else
>> +            {
>> +                ASSERT(dirty_vram->sl1ma[i] == sl1ma);
>> +                dirty_vram->sl1ma[i] = INVALID_PADDR;
>> +                if ( l1f & _PAGE_DIRTY )
>> +                    dirty = true;
>> +            }
>> +        }
>> +        else
>> +        {
>> +            /* We had more than one reference, just consider the page dirty. */
>> +            dirty = true;
>> +            /* Check that it's not the one we recorded. */
>> +            if ( dirty_vram->sl1ma[i] == sl1ma )
>> +            {
>> +                /* Too bad, we remembered the wrong one... */
>> +                dirty_vram->sl1ma[i] = INVALID_PADDR;
>> +            }
>> +            else
>> +            {
>> +                /*
>> +                 * Ok, our recorded sl1e is still pointing to this page, let's
>> +                 * just hope it will remain.
>> +                 */
>> +            }
>> +        }
>> +
>> +        if ( dirty )
>> +        {
>> +            dirty_vram->dirty_bitmap[i / 8] |= 1 << (i % 8);
> Could you use _set_bit here?

__set_bit() uses 4-byte accesses.  This uses 1-byte accesses.

Last I checked, there is a boundary issue at the end of the dirty_bitmap.

Both Julien and I have considered changing our bit infrastructure to use
byte accesses, which would make them more generally useful.

~Andrew

