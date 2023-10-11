Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BA77C54C0
	for <lists+xen-devel@lfdr.de>; Wed, 11 Oct 2023 15:05:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615497.956760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqYt9-0002di-OJ; Wed, 11 Oct 2023 13:04:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615497.956760; Wed, 11 Oct 2023 13:04:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqYt9-0002bq-LW; Wed, 11 Oct 2023 13:04:35 +0000
Received: by outflank-mailman (input) for mailman id 615497;
 Wed, 11 Oct 2023 13:04:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qqYt8-0002aK-7x
 for xen-devel@lists.xenproject.org; Wed, 11 Oct 2023 13:04:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qqYt7-00052M-1p; Wed, 11 Oct 2023 13:04:33 +0000
Received: from [15.248.2.150] (helo=[10.24.67.30])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qqYt6-0004uD-PQ; Wed, 11 Oct 2023 13:04:32 +0000
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
	bh=mLIPEpNJeklH/hQJe4puXODD1fFnim0FDM4CsuYjTi4=; b=fCFyFda1XhI16L0Jb/rfQUWng5
	aNZT85HQIRzJQpep9wH+hoPbsQjCZ0xFtTjuRKNQgDzxFGnZroLrOz/vaXsMdI4+1ySotuNaEh51o
	sebrk477yE/l75STboVf22E/Uaa6ppj9pSsuZsrWEeY5+MnCxafm+CWyqYylJAOoezMg=;
Message-ID: <781c9b5c-1301-4a23-8c13-fba62c844b03@xen.org>
Date: Wed, 11 Oct 2023 14:04:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH][for-4.19 v2 2/2] docs/misra: add deviations.rst to
 document additional deviations.
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Henry.Wang@arm.com
References: <cover.1696865051.git.nicola.vetrini@bugseng.com>
 <ccda90b6be8f6977cff14ae65749ffc7fa429c3c.1696865051.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2310091811190.3431292@ubuntu-linux-20-04-desktop>
 <a5635fc5e51518c205d776ac8a9600ba@bugseng.com>
 <alpine.DEB.2.22.394.2310101524080.3431292@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2310101524080.3431292@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/10/2023 23:27, Stefano Stabellini wrote:
> On Tue, 10 Oct 2023, Nicola Vetrini wrote:
>> On 10/10/2023 03:19, Stefano Stabellini wrote:
>>> +Henry
>>>
>>> On Mon, 9 Oct 2023, Nicola Vetrini wrote:
>>>> This file contains the deviation that are not marked by
>>>> a deviation comment, as specified in
>>>> docs/misra/documenting-violations.rst.
>>>>
>>>> Suggested-by: Stefano Stabellini <sstabellini@kernel.org>
>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>
>>> This is great! Thank you so much!
>>>
>>> I have a few questions below but even as-is it is way better than
>>> nothing. I think we should add this for 4.18
>>>
>>>
>>>> ---
>>>>   docs/index.rst            |   1 +
>>>>   docs/misra/deviations.rst | 240 ++++++++++++++++++++++++++++++++++++++
>>>>   docs/misra/rules.rst      |   2 +-
>>>>   3 files changed, 242 insertions(+), 1 deletion(-)
>>>>   create mode 100644 docs/misra/deviations.rst
>>>>
>>>> diff --git a/docs/index.rst b/docs/index.rst
>>>> index 2c47cfa999f2..f3f779f89ce5 100644
>>>> --- a/docs/index.rst
>>>> +++ b/docs/index.rst
>>>> @@ -63,6 +63,7 @@ Xen hypervisor code.
>>>>      :maxdepth: 2
>>>>
>>>>      misra/rules
>>>> +   misra/deviations
>>>>
>>>>
>>>>   Miscellanea
>>>> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
>>>> new file mode 100644
>>>> index 000000000000..19743e34ce03
>>>> --- /dev/null
>>>> +++ b/docs/misra/deviations.rst
>>>> @@ -0,0 +1,240 @@
>>>> +.. SPDX-License-Identifier: CC-BY-4.0
>>>> +
>>>> +MISRA C deviations for Xen
>>>> +==========================
>>>> +
>>>> +The following is the list of MISRA C:2012 deviations for the Xen codebase
>>>> that
>>>> +are not covered by a `SAF-x-safe` or `SAF-x-false-positive-<tool>`
>>>> comment, as
>>>> +specified in docs/misra/documenting-violations.rst; the lack of
>>>> +such comments is usually due to the excessive clutter they would bring to
>>>> the
>>>> +codebase or the impossibility to express such a deviation (e.g., if it's
>>>> +composed of several conditions).
>>>> +
>>>> +Deviations related to MISRA C:2012 Directives:
>>>> +----------------------------------------------
>>>> +
>>>> +.. list-table::
>>>> +   :header-rows: 1
>>>> +
>>>> +   * - Directive identifier
>>>> +     - Justification
>>>> +     - Notes
>>>> +
>>>> +   * - D4.3
>>>> +     - Accepted for the ARM64 codebase
>>>> +     - Tagged as `disapplied` for ECLAIR on any other violation report.
>>>
>>> This mean it has been applied for ARM64 but not x86, right?
>>>
>>>
>>
>> Yes.
>>
>>>> +   * - D4.3
>>>> +     - The inline asm in 'xen/arch/arm/arm64/lib/bitops.c' is tightly
>>>> coupled
>>>> +       with the surronding C code that acts as a wrapper, so it has been
>>>> decided
>>>> +       not to add an additional encapsulation layer.
>>>> +     - Tagged as `deliberate` for ECLAIR.
>>>> +
>>>> +Deviations related to MISRA C:2012 Rules:
>>>> +-----------------------------------------
>>>> +
>>>> +.. list-table::
>>>> +   :header-rows: 1
>>>> +
>>>> +   * - Rule identifier
>>>> +     - Justification
>>>> +     - Notes
>>>> +
>>>> +   * - R2.1
>>>> +     - The compiler implementation guarantees that the unreachable code
>>>> is
>>>> +       removed. Constant expressions and unreachable branches of if and
>>>> switch
>>>> +       statements are expected.
>>>> +     - Tagged as `safe` for ECLAIR.
>>>> +
>>>> +   * - R2.1
>>>> +     - Some functions are intended not to be referenced.
>>>> +     - Tagged as `deliberate` for ECLAIR.
>>>
>>> What does it mean "some functions" in this case? Should we list which
>>> functions?
>>>
>>
>> Well, there are a lot, typically resulting from build configurations that do
>> not
>> use them, or because they are used only in asm code. I can mention these
>> reasons in the
>> document, to make it easier to understand.
> 
> Yes, I think we need to clarify further this point, because saying "Some
> functions" doesn't help the reader understand:
> - whether all functions can be not referenced
> - which subset of functions can be not referenced
> 
> How to distinguish between? How do we know whether a certain patch is
> violating the rule or not?
> 
> If there is a clear list of functions that can be not referenced, then
> we should list them here. If there is a methodology we can use to
> distinguish between them (e.g. functions called from asm only) then we
> can write the methodology here. Either way it is fine as long as the
> criteria to know if it is OK if a function is not referenced is clear.

Aren't they more or less the one we tagged with SAF-1-safe because there 
were no prototype? If so, we could use the same tags.

We could introduce an extra tags for the others. An alternative would be 
to add an attribute (e.g. asmcall) to mark each function used by assembly.

Cheers,

-- 
Julien Grall

