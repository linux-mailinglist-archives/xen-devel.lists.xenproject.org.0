Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A65263ED5E
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 11:14:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450448.707710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0gYw-0002Wk-Mt; Thu, 01 Dec 2022 10:13:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450448.707710; Thu, 01 Dec 2022 10:13:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0gYw-0002U9-Jb; Thu, 01 Dec 2022 10:13:02 +0000
Received: by outflank-mailman (input) for mailman id 450448;
 Thu, 01 Dec 2022 10:13:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p0gYv-0002Tv-4O
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 10:13:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p0gYu-0005J8-M0; Thu, 01 Dec 2022 10:13:00 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=[192.168.7.195]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p0gYu-0007Vw-Du; Thu, 01 Dec 2022 10:13:00 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=qxGAY0+sPkl5oR96861pPne+iPwbrPm/kO7cPIBXz4A=; b=kI1Xh23O2mFXbjctBO2XEr5whG
	2A778aJEbmUQKyALD3+SyB0kV7TFZrwOOL5RiNsusmhLqZ+gdrteJbllx1X81oEKoUe/Mm3jQn4RA
	KSTlmVbRsHoC9Cp4FsbLdT7Cvm0UyHpQJ8kng7YiuuyAWRI0udGOR0asxkEGaX69vjLA=;
Message-ID: <3e6e6948-7852-751e-a025-9fe36e9cfb82@xen.org>
Date: Thu, 1 Dec 2022 10:12:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v1 5/5] CODING_STYLE: add .clang-format
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, Edwin Torok <edvin.torok@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich
 <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <cover.1669829264.git.edvin.torok@citrix.com>
 <bf4013cdb5f3e66693551b5e45b3f975b5a48795.1669829264.git.edvin.torok@citrix.com>
 <7e6b8e69-70d2-8178-205d-8c20b993162d@xen.org>
 <7DF6F06F-A65A-4F1F-8FDA-BF0E8977F99B@citrix.com>
 <c3af2730-d503-e139-644a-480a506c94d1@xen.org>
 <99df302d-8bc5-55a7-a97e-dcc8eee41d2c@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <99df302d-8bc5-55a7-a97e-dcc8eee41d2c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 01/12/2022 10:08, Juergen Gross wrote:
> On 01.12.22 10:31, Julien Grall wrote:
>> (+ A few people)
>>
>> On 01/12/2022 09:21, Edwin Torok wrote:
>>>
>>>
>>>> On 1 Dec 2022, at 09:11, Julien Grall <julien@xen.org> wrote:
>>>>
>>>> Hi Edwin,
>>>>
>>>> The title should have "OCaml" to clarify that .clang-format is not 
>>>> added at the root level.
>>>>
>>>
>>> Sure, I'll update that when I resend.
>>>
>>>> On 30/11/2022 17:32, Edwin Török wrote:
>>>>> Add a .clang-format configuration that tries to match CODING_STYLE 
>>>>> where
>>>>> possible.
>>>>> I was not able to express the special casing of braces after 'do'
>>>>> though, this can only be controlled generally for all control
>>>>> statements.
>>>>> It is imperfect, but should be better than the existing bindings, 
>>>>> which
>>>>> do not follow Xen coding style.
>>>>
>>>> Right, from previous discussion, I was under the impression that it 
>>>> requires some work to write a clang-format file for Xen.
>>>>
>>>> I am hopeful that some day we will have a proper one. In fact, we 
>>>> have been discussing about this as part of MISRA (+ Stefano).
>>>>
>>>>> Add this to tools/ocaml first because:
>>>>> * there are relatively few C files here, and it is a good place to 
>>>>> start with
>>>>> * it'd be useful to make these follow Xen's CODING_STYLE
>>>>> (which they currently do not because they use tabs for example)
>>>>> * they change relatively infrequently, so shouldn't cause issues with
>>>>>    backporting security fixes (could either backport the reindentation
>>>>>    patch too, or use git cherry-pick with `-Xignore-space-change`)
>>>>> Once this is used it'll need inserting some '#include <stdint.h>', 
>>>>> otherwise xs_wire.h
>>>>> fails to compile due to the missing uint32_t define.
>>>>
>>>> At first I was a bit concerned with this paragraph because a coding 
>>>> style should not impact compilation. But I guess that's because the 
>>>> format will convert u32 to uint32_t. Is that correct?
>>>>
>>>> If so, I would expand the paragraph to explicit say that, per the 
>>>> coding styel, u32 will be converted to uint32_t.
>>>
>>>
>>> clang-format rearranges the order of '#include' in C files, it 
>>> shouldn't convert types.
>>> But rearranging (sorting) includes can sometimes reveal bugs where 
>>> the code only happened to compile because the includes were done in a 
>>> certain order
>>> (e.g. we included something that included stdint.h, therefore the 
>>> next include line worked, but if you swap the include order that no 
>>> longer works), i.e.:
>>>
>>> #include "c.h"
>>> #include "b.h"
>>>
>>> vs
>>>
>>> /* post formatting */
>>> #include "b.h"
>>> #include "c.h"
>>>
>>> Where c.h includes a.h, and b.h depends on declarations from a.h, 
>>> then prior to reformat the code compiles, and afterwards it doesn't.
>> Thanks for the detailed information, I think some of it needs to be 
>> summarized in the commmit message.
>>
>>>
>>> Which can be fixed by adding this to the C file (and then regardless 
>>> of include order of the other 2 it compiles):
>>> #include <a.h>
>> This would not work if the file were called "d.h" rather than "a.h" 
>> because the clang format would re-order it. So...
>>
>>>
>>> Or by fixing b.h to include a.h itself it it depends on it.
>>
>> ... this is the proper way to fix it.
>>
>>>
>>> Perhaps this'd better be fixed in xs_wire.h itself to include all its 
>>> dependencies, but that is a publicly installed header, and there 
>>> might be a reason why it doesn't include stdint.h.
>>
>> I am not aware of any restrictions and at least one public headers 
>> already include <stdint.h>. I am CCed a few more people to get an 
>> opinion.
> 
> I don't think xs_wire.h should include stdint.h. This will result in a 
> conflict
> e.g. in the Linux kernel.

AFAIU, Linux has its own copy of the headers. Is that correct?

> 
> We might want to add a comment to xs_wire.h like the one in ring.h in 
> order to
> document the requirement of the type definition of uint32_t.

The problem with this approach is you made more difficult for any 
userspace application to use the headers. So I would argue that the 
Linux copy can remove "stdint.h" if needed.

Cheers,

-- 
Julien Grall

