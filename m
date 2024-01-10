Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E9E829E7A
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jan 2024 17:24:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665674.1035907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNbNQ-00046E-Ah; Wed, 10 Jan 2024 16:24:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665674.1035907; Wed, 10 Jan 2024 16:24:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNbNQ-00044R-7r; Wed, 10 Jan 2024 16:24:24 +0000
Received: by outflank-mailman (input) for mailman id 665674;
 Wed, 10 Jan 2024 16:24:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kDgC=IU=amazon.co.uk=prvs=732579c64=eliasely@srs-se1.protection.inumbo.net>)
 id 1rNbNP-00044L-6w
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2024 16:24:23 +0000
Received: from smtp-fw-6002.amazon.com (smtp-fw-6002.amazon.com [52.95.49.90])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4dcbda8-afd4-11ee-9b0f-b553b5be7939;
 Wed, 10 Jan 2024 17:24:20 +0100 (CET)
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-iad-1d-m6i4x-e651a362.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-6002.iad6.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 16:24:17 +0000
Received: from smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev
 (iad7-ws-svc-p70-lb3-vlan3.iad.amazon.com [10.32.235.38])
 by email-inbound-relay-iad-1d-m6i4x-e651a362.us-east-1.amazon.com (Postfix)
 with ESMTPS id 9F22880741; Wed, 10 Jan 2024 16:24:15 +0000 (UTC)
Received: from EX19MTAEUA001.ant.amazon.com [10.0.43.254:31906]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.36.219:2525]
 with esmtp (Farcaster)
 id 4ef6a9d5-919f-4523-93d1-2801bc773b21; Wed, 10 Jan 2024 16:24:14 +0000 (UTC)
Received: from EX19D018EUA002.ant.amazon.com (10.252.50.146) by
 EX19MTAEUA001.ant.amazon.com (10.252.50.192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 10 Jan 2024 16:24:14 +0000
Received: from [192.168.8.225] (10.106.82.23) by EX19D018EUA002.ant.amazon.com
 (10.252.50.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 10 Jan
 2024 16:24:11 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: b4dcbda8-afd4-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1704903861; x=1736439861;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=RBVTl5XcYOYGvhEPYisaaNFZ9VGQaSoCUvOQGtxkqvs=;
  b=ExNGsT2BIKgGTyThE2YdC19qZgpY3shrmaZrFOGFFAV+qSknf+Y2kJV8
   s/XJ3uaAn6qJlosvSI53Udu85GqxBOVs//HpAtC3KUwaFTk1wYBG59zji
   U3ILyORvaLQjat9enfCH5wVij0N3Ty++9ZtCtL1LBDHwOS5A9LLzXv70q
   Q=;
X-IronPort-AV: E=Sophos;i="6.04,184,1695686400"; 
   d="scan'208";a="379027315"
X-Farcaster-Flow-ID: 4ef6a9d5-919f-4523-93d1-2801bc773b21
Message-ID: <88024314-245f-404e-a6b7-7ea859bae309@amazon.com>
Date: Wed, 10 Jan 2024 16:24:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/22] x86/mapcache: initialise the mapcache for the idle
 domain
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
CC: Hongyan Xia <hongyxia@amazon.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Wei Wang <wawei@amazon.de>,
	Julien Grall <jgrall@amazon.com>, <xen-devel@lists.xenproject.org>
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-11-julien@xen.org>
 <751ffdb3-651c-b8e6-dc33-5a6857e3c88d@suse.com>
From: Elias El Yandouzi <eliasely@amazon.com>
In-Reply-To: <751ffdb3-651c-b8e6-dc33-5a6857e3c88d@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.106.82.23]
X-ClientProxiedBy: EX19D041UWA004.ant.amazon.com (10.13.139.9) To
 EX19D018EUA002.ant.amazon.com (10.252.50.146)
Precedence: Bulk

Hi,

On 22/12/2022 13:06, Jan Beulich wrote:
> On 16.12.2022 12:48, Julien Grall wrote:
>> From: Hongyan Xia <hongyxia@amazon.com>
>>
>> In order to use the mapcache in the idle domain, we also have to
>> populate its page tables in the PERDOMAIN region, and we need to move
>> mapcache_domain_init() earlier in arch_domain_create().
>>
>> Note, commit 'x86: lift mapcache variable to the arch level' has
>> initialised the mapcache for HVM domains. With this patch, PV, HVM,
>> idle domains now all initialise the mapcache.
> 
> But they can't use it yet, can they? This needs saying explicitly, or
> else one is going to make wrong implications.
> 

Yes, I tried to use the mapcache right after the idle vCPU gets 
scheduled and it worked. So, I believe it is enough.

>> --- a/xen/arch/x86/domain.c
>> +++ b/xen/arch/x86/domain.c
>> @@ -732,6 +732,8 @@ int arch_domain_create(struct domain *d,
>>   
>>       spin_lock_init(&d->arch.e820_lock);
>>   
>> +    mapcache_domain_init(d);
>> +
>>       /* Minimal initialisation for the idle domain. */
>>       if ( unlikely(is_idle_domain(d)) )
>>       {
>> @@ -829,8 +831,6 @@ int arch_domain_create(struct domain *d,
>>   
>>       psr_domain_init(d);
>>   
>> -    mapcache_domain_init(d);
> 
> You move this ahead of error paths taking the "goto out" route, so
> adjustments to affected error paths are going to be needed to avoid
> memory leaks.

Correct, I'll fix that.

> 
>> --- a/xen/arch/x86/mm.c
>> +++ b/xen/arch/x86/mm.c
>> @@ -5963,6 +5963,9 @@ int create_perdomain_mapping(struct domain *d, unsigned long va,
>>           l3tab = __map_domain_page(pg);
>>           clear_page(l3tab);
>>           d->arch.perdomain_l3_pg = pg;
>> +        if ( is_idle_domain(d) )
>> +            idle_pg_table[l4_table_offset(PERDOMAIN_VIRT_START)] =
>> +                l4e_from_page(pg, __PAGE_HYPERVISOR_RW);
> 
> Hmm, having an idle domain check here isn't very nice. I agree putting
> it in arch_domain_create()'s respective conditional isn't very neat
> either, but personally I'd consider this at least a little less bad.
> And the layering violation aspect isn't much worse than that of setting
> d->arch.ctxt_switch there as well.
> 

Why do you think it would be less bad to move it in 
arch_domain_create()? To me, it would make things worse as it would 
spread the mapping stuff across different functions.

-- 
Elias

