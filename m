Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B2FB22614
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 13:43:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078741.1439808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulnPB-0006YI-Ir; Tue, 12 Aug 2025 11:43:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078741.1439808; Tue, 12 Aug 2025 11:43:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulnPB-0006UW-F5; Tue, 12 Aug 2025 11:43:01 +0000
Received: by outflank-mailman (input) for mailman id 1078741;
 Tue, 12 Aug 2025 11:43:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OhhA=2Y=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ulnP9-0006UQ-Q6
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 11:42:59 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e57bb72-7771-11f0-a327-13f23c93f187;
 Tue, 12 Aug 2025 13:42:58 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-af968aa2de4so968322166b.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 Aug 2025 04:42:58 -0700 (PDT)
Received: from [192.168.1.17] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0771basm2179148466b.29.2025.08.12.04.42.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Aug 2025 04:42:56 -0700 (PDT)
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
X-Inumbo-ID: 7e57bb72-7771-11f0-a327-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754998978; x=1755603778; darn=lists.xenproject.org;
        h=in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CpZHnTP4IsRt7Ry6sEMfFvV3Br8wp8kr4qhHL2GsnHg=;
        b=Q2t1POEcrtBvBeSIF7uZu48ERnkS7d1bSNDK+NTrYifufdZXOJCTaubnUiokbdbosI
         UmMOaFmnc+KayWeMNgLXtM5UlDR3Tw/RL40YP7OvSHfGKGev1Qqbgjo0x3qMWB4x/s/i
         gt0c5u3TxmPXh/Jpg1P73Muec7De2GedeJNZT/0O9ByWezpu6PkuddeNrznNqQwa4o5C
         m7qleL2aTglZ6hVBxsqu+iknTI8VK5SgbFhzLmwJcClMAqJz8kzJ8bnx80tL1/fgx/if
         NDsYUGXSqgq8sHerEyIAiXk80xgoKrQELYkOUZsFaQzfp4rBhRpcJXRVjIxsDDJIGfz/
         sVCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754998978; x=1755603778;
        h=in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CpZHnTP4IsRt7Ry6sEMfFvV3Br8wp8kr4qhHL2GsnHg=;
        b=u61umYREsgKwKZC++ed63VE8/GbE+DZvRFedXpI7borU9uVFUKL2/5yxy6c6j+WwfE
         i1ArJXwsuwesc2QJiGrEfQdfSf7OxXsx5KHOFaYa09+U1+fanYun/snTvZmzzmpZghHV
         byW/cLUfNyDfiV9lFv9Gg+E8fS7Voiys6wBpSC3THKVHkJC/awVMY7dT5i1o7TZY8XXu
         8nvROtd6VSgwE1SXI4p6V9CekGjbh4fYT7OZIPKhUUSiY9At4KHXO0MaHQ8LQdG1nZLO
         7kuEkaKhPSdsQzpbRLfrr2PW6q9/WcUeTXhfjWDZWpB6OXn8K1g2lM3176RjHJ1gwl39
         lsrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvW+V+AxyFF+4TSRJcyBvqhCo9C8t1zDJHNFIJdIVm8Z20FrUKzT7PUy8GQ9ydvpX3lj8P66Fsfp0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxRe8cBWYTdGp1JAyRaLfcN5oV3a8g42XPdDk3GuEGayil8RtZS
	WrtosRUuHioBbCvnxmvCTTIFIHUTT+AcLhaOk7SZP3zcQe/mrPt6Xsap
X-Gm-Gg: ASbGncvEMTOz9qBLrDA8b8/DN/zdM521jN5tnboKvtM1c4taL+cgn/B3qMsf8oYz9PW
	7eRLL+VCGNViVDzkB8x8fwqw0kng4WUB9/8a98SnELpv2odj6h4wXVyc0SxXtswLkkqNXlKAFHY
	u+X82AU4tyKNEIlX0fyYlWX16ugzxYuw5obS+GpCwmFsVEnmOJ+l7Qa+Dz3MiHTy1rXdaHBv8z2
	49O5hazckqpDh2rAauZ4O48QpIzeEzBzNeVSRXRLO/r7/5jOq7+y0Ytw8FgkCX5grtISvYdIPZ5
	1NKXoB488W2BU/UWUVtahtVN3QNKUHybjT7BvfQtgr1nv37V0fDpoY0jP3DUcRr2jzyUg55Jx59
	lS5E/kNqo9WR5mcO8zp62bb349a81ahtyzxyC0EdpfAPdIGr0jV1RFsaJrTZpAWZVi4TVKOaM
X-Google-Smtp-Source: AGHT+IFi27JzFGWJePrpbhnbGzTAMVtSlLBli9OwBER40oK0XvXn08KOehV4mY/gsLtZgIoQcAkh4A==
X-Received: by 2002:a17:907:869f:b0:ae1:f1e0:8730 with SMTP id a640c23a62f3a-af9c659fafemr1583281666b.57.1754998977373;
        Tue, 12 Aug 2025 04:42:57 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------t0OIcO9CZCU0XKU2PJ9JQBKp"
Message-ID: <923d76de-2849-4496-b1e6-c1362e007696@gmail.com>
Date: Tue, 12 Aug 2025 13:42:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v3 19/20] xen/riscv: add support of page lookup by GFN
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <24bb8ca6ad9d325f48d0c64b0fa461db5f0d0cc5.1753973161.git.oleksii.kurochko@gmail.com>
 <f7f81e65-5c85-4e30-a68b-01cdcf51dc07@suse.com>
Content-Language: en-US
In-Reply-To: <f7f81e65-5c85-4e30-a68b-01cdcf51dc07@suse.com>

This is a multi-part message in MIME format.
--------------t0OIcO9CZCU0XKU2PJ9JQBKp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/11/25 3:25 PM, Jan Beulich wrote:
> On 31.07.2025 17:58, Oleksii Kurochko wrote:
>> Introduce helper functions for safely querying the P2M (physical-to-machine)
>> mapping:
>>   - add p2m_read_lock(), p2m_read_unlock(), and p2m_is_locked() for managing
>>     P2M lock state.
>>   - Implement p2m_get_entry() to retrieve mapping details for a given GFN,
>>     including MFN, page order, and validity.
>>   - Add p2m_lookup() to encapsulate read-locked MFN retrieval.
>>   - Introduce p2m_get_page_from_gfn() to convert a GFN into a page_info
>>     pointer, acquiring a reference to the page if valid.
>>   - Introduce get_page().
>>
>> Implementations are based on Arm's functions with some minor modifications:
>> - p2m_get_entry():
>>    - Reverse traversal of page tables, as RISC-V uses the opposite level
>>      numbering compared to Arm.
>>    - Removed the return of p2m_access_t from p2m_get_entry() since
>>      mem_access_settings is not introduced for RISC-V.
>>    - Updated BUILD_BUG_ON() to check using the level 0 mask, which corresponds
>>      to Arm's THIRD_MASK.
>>    - Replaced open-coded bit shifts with the BIT() macro.
>>    - Other minor changes, such as using RISC-V-specific functions to validate
>>      P2M PTEs, and replacing Arm-specific GUEST_* macros with their RISC-V
>>      equivalents.
>>
>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>> ---
>> Changes in V3:
>>   - Add is_p2m_foreign() macro and connected stuff.
> What is this about?

Sorry for that, it is a stale change. I will drop it in the next patch version.

>> --- a/xen/arch/riscv/include/asm/p2m.h
>> +++ b/xen/arch/riscv/include/asm/p2m.h
>> @@ -202,6 +202,24 @@ static inline int p2m_is_write_locked(struct p2m_domain *p2m)
>>   
>>   unsigned long construct_hgatp(struct p2m_domain *p2m, uint16_t vmid);
>>   
>> +static inline void p2m_read_lock(struct p2m_domain *p2m)
>> +{
>> +    read_lock(&p2m->lock);
>> +}
>> +
>> +static inline void p2m_read_unlock(struct p2m_domain *p2m)
>> +{
>> +    read_unlock(&p2m->lock);
>> +}
>> +
>> +static inline int p2m_is_locked(struct p2m_domain *p2m)
> bool return type (also for p2m_is_write_locked() in patch 11)? Also perhaps
> pointer-to-const parameter?

I haven't checked what is a argument type of rw_is_locked() inside, so, automatically
use just pointer parameter, but now I see that it could be really const.

>> --- a/xen/arch/riscv/p2m.c
>> +++ b/xen/arch/riscv/p2m.c
>> @@ -852,3 +852,139 @@ int map_regions_p2mt(struct domain *d,
>>   {
>>       return p2m_insert_mapping(p2m_get_hostp2m(d), gfn, nr, mfn, p2mt);
>>   }
>> +
>> +/*
>> + * Get the details of a given gfn.
>> + *
>> + * If the entry is present, the associated MFN will be returned type filled up.
> This sentence doesn't really parse, perhaps due to missing words.

IDK what happened but it should be:
   ... the associated MFN will returned and type filled up ...
Perhpaps, it would be better just:
   ... the associated MFN will returned and the p2m type of the mapping.
   (or just entry's type)

>> + * The page_order will correspond to the order of the mapping in the page
>> + * table (i.e it could be a superpage).
>> + *
>> + * If the entry is not present, INVALID_MFN will be returned and the
>> + * page_order will be set according to the order of the invalid range.
>> + *
>> + * valid will contain the value of bit[0] (e.g valid bit) of the
>> + * entry.
>> + */
>> +static mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
>> +                           p2m_type_t *t,
>> +                           unsigned int *page_order,
>> +                           bool *valid)
>> +{
>> +    unsigned int level = 0;
>> +    pte_t entry, *table;
>> +    int rc;
>> +    mfn_t mfn = INVALID_MFN;
>> +    DECLARE_OFFSETS(offsets, gfn_to_gaddr(gfn));
>> +
>> +    ASSERT(p2m_is_locked(p2m));
>> +    BUILD_BUG_ON(XEN_PT_LEVEL_MAP_MASK(0) != PAGE_MASK);
> What function-wide property is this check about? Even when moved ...

I think this check isn't needed anymore.

This check is/was needed to be sure that 4k page(s) are used on L3 (in Arm terms)
mapping as Arm can support 4k, 16k and 64k.
Initially this check derived from:
   https://lore.kernel.org/xen-devel/1402394278-9850-4-git-send-email-ian.campbell@citrix.com/
And it was needed because of the way how maddr is calculated, calculation for which
could be wrong if page size isn't 4k.
But then this check was migrated to p2m_get_entry():
   https://lore.kernel.org/xen-devel/1469717505-8026-13-git-send-email-julien.grall@arm.com/
But the way how maddr is got isn't depends on mask and PAGE_MASK, and I don't see any other
reason to why BUILD_BUG_ON() is needed now.

>
>> +    if ( valid )
>> +        *valid = false;
>> +
>> +    /* XXX: Check if the mapping is lower than the mapped gfn */
> (Nested: What is this about?)
>
>> +    /* This gfn is higher than the highest the p2m map currently holds */
>> +    if ( gfn_x(gfn) > gfn_x(p2m->max_mapped_gfn) )
>> +    {
>> +        for ( level = P2M_ROOT_LEVEL; level; level-- )
>> +            if ( (gfn_x(gfn) & (XEN_PT_LEVEL_MASK(level) >> PAGE_SHIFT)) >
> ... into the more narrow scope where another XEN_PT_LEVEL_MASK() exists I
> can't really spot what the check is to guard against.
>
>> +                 gfn_x(p2m->max_mapped_gfn) )
>> +                break;
>> +
>> +        goto out;
>> +    }
>> +
>> +    table = p2m_get_root_pointer(p2m, gfn);
>> +
>> +    /*
>> +     * the table should always be non-NULL because the gfn is below
>> +     * p2m->max_mapped_gfn and the root table pages are always present.
>> +     */
> Nit: Style.
>
>> +    if ( !table )
>> +    {
>> +        ASSERT_UNREACHABLE();
>> +        level = P2M_ROOT_LEVEL;
>> +        goto out;
>> +    }
>> +
>> +    for ( level = P2M_ROOT_LEVEL; level; level-- )
>> +    {
>> +        rc = p2m_next_level(p2m, true, level, &table, offsets[level]);
> Why would you blindly allocate a page table (hierarchy) here? If anything,
> this may need doing upon caller request (as it's only up the call chain
> where the necessary knowledge exists).

I wanted to set it to always|false|, as based on the name|p2m_get_entry()|,
it is expected that the page tables are already allocated.

> For example, ...
>
>> +static mfn_t p2m_lookup(struct p2m_domain *p2m, gfn_t gfn, p2m_type_t *t)
>> +{
>> +    mfn_t mfn;
>> +
>> +    p2m_read_lock(p2m);
>> +    mfn = p2m_get_entry(p2m, gfn, t, NULL, NULL);
> ... this (by its name) pretty likely won't want allocation, while ...
>
>> +    p2m_read_unlock(p2m);
>> +
>> +    return mfn;
>> +}
>> +
>> +struct page_info *p2m_get_page_from_gfn(struct p2m_domain *p2m, gfn_t gfn,
>> +                                        p2m_type_t *t)
>> +{
> ... this will. Yet then ...

I didn't really get why p2m_get_page_from_gfn() is expected to allocate
page table. My understanding is that GFN will point to a page only if
a mapping was done before for the GFN.

>
>> +    struct page_info *page;
>> +    p2m_type_t p2mt = p2m_invalid;
>> +    mfn_t mfn = p2m_lookup(p2m, gfn, t);
> ... you use the earlier one here.

We don't need|page_order| and/or the valid bit in|p2m_get_page_from_gfn()|.

>
>> +    if ( !mfn_valid(mfn) )
>> +        return NULL;
>> +
>> +    if ( t )
>> +        p2mt = *t;
>> +
>> +    page = mfn_to_page(mfn);
>> +
>> +    /*
>> +     * get_page won't work on foreign mapping because the page doesn't
>> +     * belong to the current domain.
>> +     */
>> +    if ( p2m_is_foreign(p2mt) )
>> +    {
>> +        struct domain *fdom = page_get_owner_and_reference(page);
>> +        ASSERT(fdom != NULL);
>> +        ASSERT(fdom != p2m->domain);
>> +        return page;
> In a release build (with no assertions) this will be wrong if either of the
> two condition would not be satisfied. See x86'es respective code.

I will add the following then instead:
     if ( unlikely(p2m_is_foreign(t)) )
     {
         const struct domain *fdom = page_get_owner_and_reference(page);

         if ( fdom )
         {
             if ( likely(fdom != d) )
                 return page;
             ASSERT_UNREACHABLE();
             put_page(page);
         }

         return NULL;
     }

I'm not sure that unlikely() is needed, x86 has it.
It seems then Arm needs such a change too.

Thanks.

~ Oleksii


--------------t0OIcO9CZCU0XKU2PJ9JQBKp
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/11/25 3:25 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:f7f81e65-5c85-4e30-a68b-01cdcf51dc07@suse.com">
      <pre wrap="" class="moz-quote-pre">On 31.07.2025 17:58, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Introduce helper functions for safely querying the P2M (physical-to-machine)
mapping:
 - add p2m_read_lock(), p2m_read_unlock(), and p2m_is_locked() for managing
   P2M lock state.
 - Implement p2m_get_entry() to retrieve mapping details for a given GFN,
   including MFN, page order, and validity.
 - Add p2m_lookup() to encapsulate read-locked MFN retrieval.
 - Introduce p2m_get_page_from_gfn() to convert a GFN into a page_info
   pointer, acquiring a reference to the page if valid.
 - Introduce get_page().

Implementations are based on Arm's functions with some minor modifications:
- p2m_get_entry():
  - Reverse traversal of page tables, as RISC-V uses the opposite level
    numbering compared to Arm.
  - Removed the return of p2m_access_t from p2m_get_entry() since
    mem_access_settings is not introduced for RISC-V.
  - Updated BUILD_BUG_ON() to check using the level 0 mask, which corresponds
    to Arm's THIRD_MASK.
  - Replaced open-coded bit shifts with the BIT() macro.
  - Other minor changes, such as using RISC-V-specific functions to validate
    P2M PTEs, and replacing Arm-specific GUEST_* macros with their RISC-V
    equivalents.

Signed-off-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E"
        href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
---
Changes in V3:
 - Add is_p2m_foreign() macro and connected stuff.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">What is this about?</pre>
    </blockquote>
    <pre>Sorry for that, it is a stale change. I will drop it in the next patch version.

</pre>
    <blockquote type="cite"
      cite="mid:f7f81e65-5c85-4e30-a68b-01cdcf51dc07@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -202,6 +202,24 @@ static inline int p2m_is_write_locked(struct p2m_domain *p2m)
 
 unsigned long construct_hgatp(struct p2m_domain *p2m, uint16_t vmid);
 
+static inline void p2m_read_lock(struct p2m_domain *p2m)
+{
+    read_lock(&amp;p2m-&gt;lock);
+}
+
+static inline void p2m_read_unlock(struct p2m_domain *p2m)
+{
+    read_unlock(&amp;p2m-&gt;lock);
+}
+
+static inline int p2m_is_locked(struct p2m_domain *p2m)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">bool return type (also for p2m_is_write_locked() in patch 11)? Also perhaps
pointer-to-const parameter?</pre>
    </blockquote>
    <pre>I haven't checked what is a argument type of rw_is_locked() inside, so, automatically
use just pointer parameter, but now I see that it could be really const.

</pre>
    <blockquote type="cite"
      cite="mid:f7f81e65-5c85-4e30-a68b-01cdcf51dc07@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -852,3 +852,139 @@ int map_regions_p2mt(struct domain *d,
 {
     return p2m_insert_mapping(p2m_get_hostp2m(d), gfn, nr, mfn, p2mt);
 }
+
+/*
+ * Get the details of a given gfn.
+ *
+ * If the entry is present, the associated MFN will be returned type filled up.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">This sentence doesn't really parse, perhaps due to missing words.</pre>
    </blockquote>
    <pre>IDK what happened but it should be:
  ... the associated MFN will returned and type filled up ...
Perhpaps, it would be better just:
  ... the associated MFN will returned and the p2m type of the mapping.
  (or just entry's type)

</pre>
    <blockquote type="cite"
      cite="mid:f7f81e65-5c85-4e30-a68b-01cdcf51dc07@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+ * The page_order will correspond to the order of the mapping in the page
+ * table (i.e it could be a superpage).
+ *
+ * If the entry is not present, INVALID_MFN will be returned and the
+ * page_order will be set according to the order of the invalid range.
+ *
+ * valid will contain the value of bit[0] (e.g valid bit) of the
+ * entry.
+ */
+static mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
+                           p2m_type_t *t,
+                           unsigned int *page_order,
+                           bool *valid)
+{
+    unsigned int level = 0;
+    pte_t entry, *table;
+    int rc;
+    mfn_t mfn = INVALID_MFN;
+    DECLARE_OFFSETS(offsets, gfn_to_gaddr(gfn));
+
+    ASSERT(p2m_is_locked(p2m));
+    BUILD_BUG_ON(XEN_PT_LEVEL_MAP_MASK(0) != PAGE_MASK);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">What function-wide property is this check about? Even when moved ...</pre>
    </blockquote>
    <pre>I think this check isn't needed anymore.

This check is/was needed to be sure that 4k page(s) are used on L3 (in Arm terms)
mapping as Arm can support 4k, 16k and 64k.
Initially this check derived from:
  <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/1402394278-9850-4-git-send-email-ian.campbell@citrix.com/">https://lore.kernel.org/xen-devel/1402394278-9850-4-git-send-email-ian.campbell@citrix.com/</a>
And it was needed because of the way how maddr is calculated, calculation for which
could be wrong if page size isn't 4k.
But then this check was migrated to p2m_get_entry():
  <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/1469717505-8026-13-git-send-email-julien.grall@arm.com/">https://lore.kernel.org/xen-devel/1469717505-8026-13-git-send-email-julien.grall@arm.com/</a>
But the way how maddr is got isn't depends on mask and PAGE_MASK, and I don't see any other
reason to why BUILD_BUG_ON() is needed now.

</pre>
    <blockquote type="cite"
      cite="mid:f7f81e65-5c85-4e30-a68b-01cdcf51dc07@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    if ( valid )
+        *valid = false;
+
+    /* XXX: Check if the mapping is lower than the mapped gfn */
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">(Nested: What is this about?)

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    /* This gfn is higher than the highest the p2m map currently holds */
+    if ( gfn_x(gfn) &gt; gfn_x(p2m-&gt;max_mapped_gfn) )
+    {
+        for ( level = P2M_ROOT_LEVEL; level; level-- )
+            if ( (gfn_x(gfn) &amp; (XEN_PT_LEVEL_MASK(level) &gt;&gt; PAGE_SHIFT)) &gt;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">... into the more narrow scope where another XEN_PT_LEVEL_MASK() exists I
can't really spot what the check is to guard against.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+                 gfn_x(p2m-&gt;max_mapped_gfn) )
+                break;
+
+        goto out;
+    }
+
+    table = p2m_get_root_pointer(p2m, gfn);
+
+    /*
+     * the table should always be non-NULL because the gfn is below
+     * p2m-&gt;max_mapped_gfn and the root table pages are always present.
+     */
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Nit: Style.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    if ( !table )
+    {
+        ASSERT_UNREACHABLE();
+        level = P2M_ROOT_LEVEL;
+        goto out;
+    }
+
+    for ( level = P2M_ROOT_LEVEL; level; level-- )
+    {
+        rc = p2m_next_level(p2m, true, level, &amp;table, offsets[level]);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Why would you blindly allocate a page table (hierarchy) here? If anything,
this may need doing upon caller request (as it's only up the call chain
where the necessary knowledge exists). </pre>
    </blockquote>
    <pre>I wanted to set it to always <code data-start="77"
    data-end="84">false</code>, as based on the name <code
    data-start="107" data-end="124">p2m_get_entry()</code>,
it is expected that the page tables are already allocated.

</pre>
    <blockquote type="cite"
      cite="mid:f7f81e65-5c85-4e30-a68b-01cdcf51dc07@suse.com">
      <pre wrap="" class="moz-quote-pre">For example, ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+static mfn_t p2m_lookup(struct p2m_domain *p2m, gfn_t gfn, p2m_type_t *t)
+{
+    mfn_t mfn;
+
+    p2m_read_lock(p2m);
+    mfn = p2m_get_entry(p2m, gfn, t, NULL, NULL);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">... this (by its name) pretty likely won't want allocation, while ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    p2m_read_unlock(p2m);
+
+    return mfn;
+}
+
+struct page_info *p2m_get_page_from_gfn(struct p2m_domain *p2m, gfn_t gfn,
+                                        p2m_type_t *t)
+{
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">... this will. Yet then ...</pre>
    </blockquote>
    <pre>I didn't really get why p2m_get_page_from_gfn() is expected to allocate
page table. My understanding is that GFN will point to a page only if
a mapping was done before for the GFN.

</pre>
    <blockquote type="cite"
      cite="mid:f7f81e65-5c85-4e30-a68b-01cdcf51dc07@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    struct page_info *page;
+    p2m_type_t p2mt = p2m_invalid;
+    mfn_t mfn = p2m_lookup(p2m, gfn, t);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">... you use the earlier one here.</pre>
    </blockquote>
    <pre data-start="48" data-end="127">We don't need <code
    data-start="62" data-end="74">page_order</code> and/or the valid bit in <code
    data-start="99" data-end="124">p2m_get_page_from_gfn()</code>.

</pre>
    <blockquote type="cite"
      cite="mid:f7f81e65-5c85-4e30-a68b-01cdcf51dc07@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    if ( !mfn_valid(mfn) )
+        return NULL;
+
+    if ( t )
+        p2mt = *t;
+
+    page = mfn_to_page(mfn);
+
+    /*
+     * get_page won't work on foreign mapping because the page doesn't
+     * belong to the current domain.
+     */
+    if ( p2m_is_foreign(p2mt) )
+    {
+        struct domain *fdom = page_get_owner_and_reference(page);
+        ASSERT(fdom != NULL);
+        ASSERT(fdom != p2m-&gt;domain);
+        return page;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">In a release build (with no assertions) this will be wrong if either of the
two condition would not be satisfied. See x86'es respective code.</pre>
    </blockquote>
    <pre>I will add the following then instead:
    if ( unlikely(p2m_is_foreign(t)) )
    {
        const struct domain *fdom = page_get_owner_and_reference(page);

        if ( fdom )
        {
            if ( likely(fdom != d) )
                return page;
            ASSERT_UNREACHABLE();
            put_page(page);
        }

        return NULL;
    }
</pre>
    <pre>I'm not sure that unlikely() is needed, x86 has it.
It seems then Arm needs such a change too.

Thanks.

~ Oleksii
</pre>
    <br>
  </body>
</html>

--------------t0OIcO9CZCU0XKU2PJ9JQBKp--

