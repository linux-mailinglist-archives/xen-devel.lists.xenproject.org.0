Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3318676FB79
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 09:55:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576946.903672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRpee-0004R9-3f; Fri, 04 Aug 2023 07:55:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576946.903672; Fri, 04 Aug 2023 07:55:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRpee-0004ON-0Z; Fri, 04 Aug 2023 07:55:24 +0000
Received: by outflank-mailman (input) for mailman id 576946;
 Fri, 04 Aug 2023 07:55:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HS9z=DV=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qRpec-0004OH-Td
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 07:55:22 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43026afa-329c-11ee-b26a-6b7b168915f2;
 Fri, 04 Aug 2023 09:55:21 +0200 (CEST)
Received: from [192.168.1.15] (host-79-35-203-138.retail.telecomitalia.it
 [79.35.203.138])
 by support.bugseng.com (Postfix) with ESMTPSA id D71CA4EE0737;
 Fri,  4 Aug 2023 09:55:20 +0200 (CEST)
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
X-Inumbo-ID: 43026afa-329c-11ee-b26a-6b7b168915f2
Message-ID: <49fc793e-d0a3-7d9b-b501-d7a72dd9c736@bugseng.com>
Date: Fri, 4 Aug 2023 09:55:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH v2] xen/string: add missing parameter names
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Cc: Luca Fancellu <Luca.Fancellu@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <16c5362b740ed66100b55b528881cb26c1430f15.1691050900.git.federico.serafini@bugseng.com>
 <B1F3B24C-15FC-4A0F-BFB9-8C3C33E8FEB5@arm.com>
 <e2ab464c-f14a-4d7e-ba25-c88fad9c5d23@xen.org>
 <4FE67D84-A5AC-4EA1-BCF4-212E4B916BD2@arm.com>
 <1e2d06ab-ad3a-4e5a-ac78-d20bad28bb20@xen.org>
 <alpine.DEB.2.22.394.2308031226010.2127516@ubuntu-linux-20-04-desktop>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <alpine.DEB.2.22.394.2308031226010.2127516@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 03/08/23 21:26, Stefano Stabellini wrote:
> On Thu, 3 Aug 2023, Julien Grall wrote:
>> On 03/08/2023 12:52, Luca Fancellu wrote:
>>>> On 3 Aug 2023, at 12:46, Julien Grall <julien@xen.org> wrote:
>>>>
>>>> Hi Luca,
>>>>
>>>> On 03/08/2023 11:28, Luca Fancellu wrote:
>>>>>> On 3 Aug 2023, at 09:26, Federico Serafini
>>>>>> <federico.serafini@bugseng.com> wrote:
>>>>>>
>>>>>> Add missing parameter names to address violation of MISRA C:2012
>>>>>> rule 8.2 ("Function types shall be in prototype form with named
>>>>>> parameters").
>>>>>>
>>>>>> No functional changes.
>>>>>>
>>>>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>>>>> ---
>>>>>> Changes in v2:
>>>>>>    - memset() adjusted.
>>>>>> ---
>>>>>> xen/include/xen/string.h | 42 ++++++++++++++++++++--------------------
>>>>>> 1 file changed, 21 insertions(+), 21 deletions(-)
>>>>>>
>>>>>> +void *memset(void *s, int c, size_t count);
>>>>>> +void *memcpy(void *dest, const void *src, size_t count);
>>>>> There is a comment in arch/arm/rm32/lib/memcpy.S with this:
>>>>> /* Prototype: void *memcpy(void *dest, const void *src, size_t n); */
>>>>>> +void *memmove(void *dest, const void *src, size_t count);
>>>>> There is a comment in arch/arm/rm32/lib/memmove.S with this:
>>>>>    * Prototype: void *memmove(void *dest, const void *src, size_t n);
>>>>>> +int memcmp(const void *cs, const void *ct, size_t count);
>>>>>> +void *memchr(const void *s, int c, size_t n);
>>>>>> +void *memchr_inv(const void *s, int c, size_t n);
>>>>> @Stefano: would it make sense to remove it as part of this patch or
>>>>> maybe not?
>>>>
>>>> They are a verbatim copy of the Linux code. So I would rather no touch it.
>>>
>>> Oh I see! Thank you for pointing that out, then I’m wondering if it’s there
>>> a reason why we
>>> are using ‘count’ instead of ’n’ as third parameter name, I know Stefano
>>> suggested that, so
>>> It’s just a curiosity. Maybe it’s for clarity?
>>
>> I guess because the generic implementation of memset (see xen/lib/memset.c) is
>> using 'count' rather than 'n'.
> 
> Yep
> 
> 
>> Given what Andrew said, I would say we should rename the parameter to 'n'.
> 
> Yes, either way works. I was only trying to be consistent with
> xen/lib/memset.c. It is also fine to change xen/lib/memset.c instead.

If you want to be consistent compared to the C99 Standard,
then other parameter names need to be changed, for example all the `cs`
and `ct` should become `s1` and `s2`, respectively.
The same goes for `dest` and `src`.
If you agree, I can propose a v3 that takes care of that.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

