Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9F69659BF
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 10:13:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786261.1195824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjwkn-0003mH-Aw; Fri, 30 Aug 2024 08:13:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786261.1195824; Fri, 30 Aug 2024 08:13:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjwkn-0003jl-8G; Fri, 30 Aug 2024 08:13:09 +0000
Received: by outflank-mailman (input) for mailman id 786261;
 Fri, 30 Aug 2024 08:13:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B9l7=P5=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sjwkl-0003jf-CZ
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 08:13:07 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aee40d92-66a7-11ef-99a0-01e77a169b0f;
 Fri, 30 Aug 2024 10:13:05 +0200 (CEST)
Received: from [192.168.1.113] (93-36-216-241.ip62.fastwebnet.it
 [93.36.216.241])
 by support.bugseng.com (Postfix) with ESMTPSA id 3563D4EE0793;
 Fri, 30 Aug 2024 10:13:04 +0200 (CEST)
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
X-Inumbo-ID: aee40d92-66a7-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1725005584; bh=ig0enLZKbwdcEtBIw4fDv7W8R6Dwv3rph1z68bp6GMU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JtHaX+rlkAhR3oHCh3TEZ+xdDDjkbDxOObWSFs6p5TA1LHyo+3alNfQlvGDwtBgI/
	 7nElvGh1tRlCylT5TvBMrsZSZeC2m4+un2UTEtNc3VDPG7bcHz8n6zx40XejdtKbF+
	 d7zKrcV/tUylN4nJurpkRf2w8UOqHVRmaFRk88wHpKxjNYsM1/deHpbL/QSg8k0sa2
	 lNKOjBgMPQoeTEf0tjY7W5ZfSyrK5il1wMNA27Os+d5opYhzmSpORJv2FsL9GwlgOy
	 0vtt1lVKo4PeWgfDharOtwI3bbgNHp1Ea1yy38gQj4yG7Eb35Im/Uc2HWiGeiwKYLv
	 HsKdteSkptoCg==
Message-ID: <45a72e19-dceb-46a1-9771-066e64f69f38@bugseng.com>
Date: Fri, 30 Aug 2024 10:13:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] xen/bitmap: remove comment-based deviations
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <4aa692a50a5d08d24560f02fdc36911965fc860b.1724850701.git.federico.serafini@bugseng.com>
 <1eae8fa0-2d4c-4cf6-8120-fd7fefa523ed@suse.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG
In-Reply-To: <1eae8fa0-2d4c-4cf6-8120-fd7fefa523ed@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/08/24 16:50, Jan Beulich wrote:
> On 28.08.2024 15:12, Federico Serafini wrote:
>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> @@ -565,6 +565,10 @@ of this macro do not lead to developer confusion, and can thus be deviated."
>>   -config=MC3R1.R20.7,reports+={safe, "any_area(any_loc(any_exp(macro(^count_args_$))))"}
>>   -doc_end
>>   
>> +-doc_begin="The expansion of an argument surrounded by tokens '{', '}' and ';' is safe."
>> +-config=MC3R1.R20.7,expansion_context+={safe, "left_right(^[\\{;]$,^[;\\}]$)"}
>> +-doc_end
> 
> Not the least because this is quite a bit wider than ...
> 
>> --- a/xen/include/xen/bitmap.h
>> +++ b/xen/include/xen/bitmap.h
>> @@ -103,13 +103,10 @@ extern int bitmap_allocate_region(unsigned long *bitmap, int pos, int order);
>>   #define bitmap_switch(nbits, zero, small, large)			  \
>>   	unsigned int n__ = (nbits);					  \
>>   	if (__builtin_constant_p(nbits) && !n__) {			  \
>> -		/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */ \
>>   		zero;							  \
>>   	} else if (__builtin_constant_p(nbits) && n__ <= BITS_PER_LONG) { \
>> -		/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */ \
>>   		small;							  \
>>   	} else {							  \
>> -		/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */ \
>>   		large;							  \
>>   	}
> 
> ... what's needed here, I wonder if we're not opening up avenues to
> problems by generally permitting that pattern. Plus in the description
> I'm missing a statement to the effect of why this is (always) safe.

The rational of the rule is that if a macro argument expands to an
expression, there may be problems related to operator precedence, e.g.:

#define A(x, y) x * y

A(1+1, 2+2) will expand to: 1+1 * 2+2

Yes, the deviation is more general and wider than what is needed for
the specific case but it is safe: if the expanded argument is between
one of the aforementioned tokens, then there are no operators involved
and no precedence issues.

I can add some details in a v2.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

