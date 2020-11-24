Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6ED12C1A27
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 01:41:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.35303.66760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khMOD-0005Xx-Ip; Tue, 24 Nov 2020 00:41:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 35303.66760; Tue, 24 Nov 2020 00:41:01 +0000
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
	id 1khMOD-0005XY-Fc; Tue, 24 Nov 2020 00:41:01 +0000
Received: by outflank-mailman (input) for mailman id 35303;
 Tue, 24 Nov 2020 00:40:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rpYA=E6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1khMOB-0005XR-7I
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 00:40:59 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 734d45c5-fe77-4abd-be52-f55b66f8e497;
 Tue, 24 Nov 2020 00:40:57 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=rpYA=E6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1khMOB-0005XR-7I
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 00:40:59 +0000
X-Inumbo-ID: 734d45c5-fe77-4abd-be52-f55b66f8e497
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 734d45c5-fe77-4abd-be52-f55b66f8e497;
	Tue, 24 Nov 2020 00:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1606178457;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=hDAXSFYCTwV7+OA3EDO2Of56ILPq9gGqRN4D8Fc0RUg=;
  b=WEuA2VUQsq+fLhKfdC/SRbYjik9xr6lJbP9+T2Kdjfj08f+A4HTE1Uhq
   b2am9fOup7h0vyC4VoaXZagB1BmC6LFKbezeuyI1OEHD2mPdnz8o4UwaC
   HtFTRIU6z2IHXOZKSXh255VZvkW3n8FiAkI0WgxjCR+K4xinTEkDAFNhx
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 23uAuWnWj9ztOiIbw/OfThm+MbJqABlR73RviENEroa6b2kOXIZ5959DbpDA1Dd1FDzUgnFqqc
 n+9U+xJq8T8wONqSBJt4cx2m4WD3DQr6rtNnqTBdxtuzVyhu0mRq8LjcMz7hpnlXEl0s0apWcd
 +Wj1J4ojM0uGj3xmCTxBwn0E4DTGpw4EVPLUzbCnhMXpW054EcgL6WbnhRINGQhDG0/NeN6gVd
 Yq1M3Gi4rYr5Rty2Kc4bf5bnlN/o+R/hsQ5T4p/1bP/ZM1QIBYpdgOuzhxDhc0AuRA4TQPtO+D
 Ito=
X-SBRS: None
X-MesageID: 32134937
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,364,1599537600"; 
   d="scan'208";a="32134937"
Subject: Re: [PATCH v2 7/8] lib: move bsearch code
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
References: <aa1ca5da-3ecf-8721-63f9-b86ebbc64330@suse.com>
 <87a20884-5a76-a664-dcc9-bd4becee40b3@suse.com>
 <44ffc041-cacd-468e-a835-f5b2048bb201@xen.org>
 <2cf3a90d-f463-41f8-f861-6ef00279b204@suse.com>
 <2419eccf-c696-6aa1-ada4-0f7bd6bc5657@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <77534dc3-bdd6-f884-99e3-90dc9b02a81f@citrix.com>
Date: Tue, 24 Nov 2020 00:40:50 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2419eccf-c696-6aa1-ada4-0f7bd6bc5657@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 23/11/2020 22:49, Julien Grall wrote:
> Hi Jan,
>
> On 19/11/2020 10:27, Jan Beulich wrote:
>> On 18.11.2020 19:09, Julien Grall wrote:
>>> On 23/10/2020 11:19, Jan Beulich wrote:
>>>> --- a/xen/include/xen/compiler.h
>>>> +++ b/xen/include/xen/compiler.h
>>>> @@ -12,6 +12,7 @@
>>>>       #define inline        __inline__
>>>>    #define always_inline __inline__ __attribute__
>>>> ((__always_inline__))
>>>> +#define gnu_inline    __inline__ __attribute__ ((__gnu_inline__))
>>>
>>> bsearch() is only used by Arm and I haven't seen anyone so far
>>> complaining about the perf of I/O emulation.
>>>
>>> Therefore, I am not convinced that there is enough justification to
>>> introduce a GNU attribute just for this patch.
>>
>> Please settle this with Andrew: He had asked for the function to
>> become inline. I don't view making it static inline in the header
>> as an option here - if the compiler decides to not inline it, we
>> should not end up with multiple instances in different CUs.
>
> That's the cons of static inline... but then why is it suddenly a
> problem with this helper?
>
>> And
>> without making it static inline the attribute needs adding; at
>> least I'm unaware of an alternative which works with the various
>> compiler versions.
>
> The question we have to answer is: What is the gain with this approach?

Substantial.

>
> If it is not quantifiable, then introducing compiler specific
> attribute is not an option.
>
> IIRC, there are only two callers (all in Arm code) of this function.
> Even inlined, I don't believe you would drastically reduce the number
> of instructions compare to a full blown version. To be generous, I
> would say you may save ~20 instructions per copy.
>
> Therefore, so far, the compiler specific attribute doesn't look
> justified to me. As usual, I am happy to be proven wrong

There is a very good reason why this is the classic example used for
extern inline's in various libc's.

The gains are from the compiler being able to optimise away the function
pointer(s) entirely.  Instead of working on opaque objects, it can see
the accesses directly, implement compares as straight array reads, (for
sorting, the swap() call turns into memcpy()) and because it can see all
the memory accesses, doesn't have to assume that every call to cmp()
modifies arbitrary data in the array (i.e. doesn't have to reload the
objects from memory every iteration).

extern inline allows the compiler full flexibility to judge whether
inlining is a net win, based on optimisation settings and observing what
the practical memory access pattern would be from not inlining.

extern inline is the appropriate thing to use here, except for the big
note in the GCC manual saying "always use gnu_inline in this case" which
appears to be working around a change in the C99 standard which forces
any non-static inline to emit a body even when its not called, due to
rules about global symbols.

Therefore, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Some further observations:

For arch/arm/io.c, the handlers are sorted, so find_mmio_handler() will
be O(lg n), but it will surely be faster with the inlined version, and
this is the fastpath.

register_mmio_handler() OTOH is massively expensive, because sort()
turns the array into a heap and back into an array on every insertion,
just to insert an entry into an already sorted array.  It would be more
efficient to library-fy the work I did for VT-x MSR load/save lists
(again, extern inline) and reuse
"insert_$FOO_into_sorted_list_of_FOOs()" which is a search, single
memmove() to make a gap, and a memcpy() into place.

When you compile io.c with this patch in place, the delta is:

add/remove: 0/1 grow/shrink: 1/0 up/down: 92/-164 (-72)
Function                                     old     new   delta
try_handle_mmio                              720     812     +92
bsearch                                      164       -    -164
Total: Before=992489, After=992417, chg -0.01%

The reason cmp_mmio_handler (140 bytes) doesn't drop out is because it
is referenced by register_mmio_hanlder()'s call to sort().  All in all,
the inlined version is less than 1/3 the size of the out-of-lined
version, but I haven't characterised it further than that.


On a totally separate point,  I wonder if we'd be better off compiling
with -fgnu89-inline because I can't see any case we're we'd want the C99
inline semantics anywhere in Xen.

~Andrew

