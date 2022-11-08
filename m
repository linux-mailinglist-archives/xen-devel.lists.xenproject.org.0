Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D04620F21
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 12:32:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440000.694054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osMq5-0001YH-4h; Tue, 08 Nov 2022 11:32:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440000.694054; Tue, 08 Nov 2022 11:32:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osMq5-0001VZ-1I; Tue, 08 Nov 2022 11:32:21 +0000
Received: by outflank-mailman (input) for mailman id 440000;
 Tue, 08 Nov 2022 11:32:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1osMq4-0001VT-2H
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 11:32:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1osMpu-00046T-DG; Tue, 08 Nov 2022 11:32:10 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224] helo=[192.168.3.98])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1osMpu-0002C1-5m; Tue, 08 Nov 2022 11:32:10 +0000
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
	bh=AGZy5J90T/G3qtYKMfEanDERIn0ve4m192F7lR1tzWE=; b=TUfcqDrUUC+bLjIOGrkaI38z3d
	EO6MGx47W7AMJ4Mn1h0HpeaV/UHjWQ5X3Bip7GX044dP3jn+J2pVKFAfTTjHct1Zn5JqNqht98Rpb
	1n+tZbMePaaokpyaakHGMzjy4aapZKvbRGXiPU415z4omqRN/3vFE1P276to5L/FExS0=;
Message-ID: <d4ceb892-7265-f23f-7785-9368e18edf6e@xen.org>
Date: Tue, 8 Nov 2022 11:32:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [RFC PATCH 4/4] xen: Justify linker script defined symbols in
 include/xen/kernel.h
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Jan Beulich <jbeulich@suse.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20221107104739.10404-1-luca.fancellu@arm.com>
 <20221107104739.10404-5-luca.fancellu@arm.com>
 <5caf911d-e96d-39e4-d945-db6537412f60@suse.com>
 <3925276F-8B6E-4B19-9EC2-C085FE88A637@arm.com>
 <933c4227-5839-312e-3996-693a7d8f7706@suse.com>
 <f338e43f-d77d-06e9-ee50-7fc691848bb0@xen.org>
 <5B9130CD-BC40-42E3-8D79-DABC321AFF13@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5B9130CD-BC40-42E3-8D79-DABC321AFF13@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 08/11/2022 11:00, Luca Fancellu wrote:
> 
> 
>> On 7 Nov 2022, at 19:06, Julien Grall <julien@xen.org> wrote:
>>
>>
>>
>> On 07/11/2022 12:56, Jan Beulich wrote:
>>> On 07.11.2022 12:53, Luca Fancellu wrote:
>>>>> On 7 Nov 2022, at 11:49, Jan Beulich <jbeulich@suse.com> wrote:
>>>>> On 07.11.2022 11:47, Luca Fancellu wrote:
>>>>>> --- a/xen/include/xen/kernel.h
>>>>>> +++ b/xen/include/xen/kernel.h
>>>>>> @@ -65,24 +65,28 @@
>>>>>> 	1;                                      \
>>>>>> })
>>>>>>
>>>>>> +/* SAF-0-safe R8.6 linker script defined symbols */
>>>>>> extern char _start[], _end[], start[];
>>>>>> #define is_kernel(p) ({                         \
>>>>>>      char *__p = (char *)(unsigned long)(p);     \
>>>>>>      (__p >= _start) && (__p < _end);            \
>>>>>> })
>>>>>>
>>>>>> +/* SAF-0-safe R8.6 linker script defined symbols */
>>>>>> extern char _stext[], _etext[];
>>>>>> #define is_kernel_text(p) ({                    \
>>>>>>      char *__p = (char *)(unsigned long)(p);     \
>>>>>>      (__p >= _stext) && (__p < _etext);          \
>>>>>> })
>>>>>>
>>>>>> +/* SAF-0-safe R8.6 linker script defined symbols */
>>>>>> extern const char _srodata[], _erodata[];
>>>>>> #define is_kernel_rodata(p) ({                  \
>>>>>>      const char *__p = (const char *)(unsigned long)(p);     \
>>>>>>      (__p >= _srodata) && (__p < _erodata);      \
>>>>>> })
>>>>>>
>>>>>> +/* SAF-0-safe R8.6 linker script defined symbols */
>>>>>> extern char _sinittext[], _einittext[];
>>>>>> #define is_kernel_inittext(p) ({                \
>>>>>>      char *__p = (char *)(unsigned long)(p);     \
>>>>>
>>>>> Why the "R8.6" everywhere here? Didn't we agree that the in-code
>>>>> comments should be tool-agnostic?
>>>>
>>>> The R8.6 is not tool specific, it is to give the quick hint that we are deviating
>>>> from MISRA Rule 8.6.
>>> Well, yes, "tool" was wrong for me to write. Imo references to a specific
>>> spec should equally be avoided in in-code comments, as other specs may
>>> turn up.
>>
>> +1. The comment duplication is not great and sometimes even a short explanation it may not fit in 80 characters (AFAICT the justification should be a one line comment).
>>
> 
> Ok we can remove the R8.6 from the comments, is the remaining part ok?

I am afraid no. The comment should only be /* SAF-0-safe */.

Cheers,

-- 
Julien Grall

