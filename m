Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC00C3CB38B
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jul 2021 09:51:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.157082.289921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4IcH-0005XF-E7; Fri, 16 Jul 2021 07:50:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 157082.289921; Fri, 16 Jul 2021 07:50:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4IcH-0005Ug-Aw; Fri, 16 Jul 2021 07:50:37 +0000
Received: by outflank-mailman (input) for mailman id 157082;
 Fri, 16 Jul 2021 07:50:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m4IcG-0005Ua-J4
 for xen-devel@lists.xenproject.org; Fri, 16 Jul 2021 07:50:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m4IcF-00078l-9x; Fri, 16 Jul 2021 07:50:35 +0000
Received: from [54.239.6.184] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m4IcF-0005kg-3X; Fri, 16 Jul 2021 07:50:35 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=nuvAn3Osm61b7V5FfBQLaw6p/rQzgD0Flb9xeaxLFKg=; b=cdubYlcH5v0JlbFipYPdCSgDs3
	EL7xEEwkngyJu+4r/IkkRrr6egBeu7J1S9RvYPAWmLR864zMHf+RKGfMFimV36EcAj0inyl4f1Yah
	2rcQVHQ2miHFvD1NJC03TkCjiV2YcMdSSyMpYp6XFbNC0fbNEoAZSwWaSP3s18M4KjxA=;
Subject: Re: [PATCH v2 13/13] SUPPORT.md: write down restriction of 32-bit
 tool stacks
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
 <ddff8b28-274d-d7fe-4ba9-0772859b7a72@suse.com>
 <e12989f7-9217-e2b8-a17d-5c252dc89248@xen.org>
 <dfc17ae6-2100-cb27-9826-1f6001788707@suse.com>
 <870cae2b-5601-b10b-926b-0995e661ffc1@xen.org>
 <d91b5d10-03a1-14fd-0b92-0de5e4e8d482@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <efc24648-5858-5b81-e31d-49bf9743e27b@xen.org>
Date: Fri, 16 Jul 2021 08:50:32 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d91b5d10-03a1-14fd-0b92-0de5e4e8d482@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 15/07/2021 12:36, Jan Beulich wrote:
> On 15.07.2021 11:05, Julien Grall wrote:
>> On 15/07/2021 07:38, Jan Beulich wrote:
>>> On 14.07.2021 20:16, Julien Grall wrote:
>>>> On 05/07/2021 16:18, Jan Beulich wrote:
>>>>> Let's try to avoid giving the impression that 32-bit tool stacks are as
>>>>> capable as 64-bit ones.
>>>>
>>>> Would you be able to provide a few examples of the known issues in the
>>>> commit message? This would be helpful for anyone to understand why we
>>>> decided to drop the support.
>>>
>>> Not sure how useful this is going to be.
>>
>> It would at least be useful to me, so I can make an informed decision. I
>> suspect it would also be for anyone reading it in the future. This is
>> rather frustrating to find commit message with barely any rationale and
>> no-one remembering why this was done...
> 
> Well, I've added "There are a number of cases there where 32-bit
> types are used to hold e.g. frame numbers." Not sure whether you
> consider this sufficient.

That's good enough for me in the commit message.

> 
> Problematic code may be primarily in areas Arm doesn't
> care about (yet), like PCI pass-through or migration. But see e.g.
> - xc_map_foreign_range()'s "mfn" and "size" parameters,
> - xc_maximum_ram_page()'s "max_mfn" parameter,
> - libxl_dom.c:hvm_build_set_params()'s "store_mfn" and "console_mfn"
>    parameters,
> - xs_introduce_domain()'s "mfn" parameter,
> and quite a few more in particular in libxenguest.

That's quite a few :/. Thanks for listing them on the ML, they are 
useful to have them log on the ML.

> 
> And then there are also subtle oddities like xc_set_mem_access_multi()
> having
> 
>      xen_mem_access_op_t mao =
>      {
>          .op       = XENMEM_access_op_set_access_multi,
>          .domid    = domain_id,
>          .access   = XENMEM_access_default + 1, /* Invalid value */
>          .pfn      = ~0UL, /* Invalid GFN */
>          .nr       = nr,
>      };
 >
> Clearly ~0UL won't have the intended effect even for 32-bit guests,
> when the field is uint64_t (we get away here because for whatever
> reason the hypervisor doesn't check that the field indeed is ~0UL).
> But I wouldn't be surprised to find uses where there would be a
> difference. One of the main aspects certainly is ...

Whoops :). One topic that came up on my series to drop the M2P helpers 
on Arm is the lack of a suitable define for invalid GFN.

However, at the first look, it didn't seem to be easy to introduce 
because the GFN is sometime stored in a 64-bit and other time in 
xen_ulong_t.

> 
>> I vaguely recall a discussion about 64-bit hypercall ([1]). I assume the
>> decision to drop support is related to it, but I have no way to prove it
>> from the commit message.
> 
> ... this. Some XENMEM_* may return 64-bit values, yet the hypercall
> interface is limited to "long" return types. Not even the multicall
> approach taken to work around the restriction to "int" would help
> here for x86-32, as struct multicall_entry also uses xen_ulong_t
> for its "result" field.
> 
>> It is also not clear why adding the restriction is the way to go...
>>
>>> This would be pointing at the
>>> declarations / definitions of various tool stack internal variables or
>>> structure fields. Which also is why ...
>>
>> ... is this because such issues are too widespread in libxc/libxl to fix
>> it in long term?
> 
> Fixing is an option, but until it gets fixed (if anyone really cared
> to do so), spelling out the restriction looks to be an appropriate
> step to me (or else I wouldn't have followed the request and created
> this patch). Once suitably audited, fixed, and tested, I wouldn't see
> a reason not to remove the restriction again.

Agreed. I was mostly wondering whether this was a matter of couple 
patches and could be restricted to maybe libxl (IOW toolstack based on 
libxc may not be affected). But from what you wrote, the issue is quite 
widespread.

Anyway, this is enough to convince me that dropping support (until it is 
fixed) for 32-bit toolstack on 64-bit hypervisor.

Cheers,

-- 
Julien Grall

