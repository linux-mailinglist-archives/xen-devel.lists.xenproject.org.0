Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D91327B7D
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 11:06:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91412.172828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGfQY-0003nR-0J; Mon, 01 Mar 2021 10:05:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91412.172828; Mon, 01 Mar 2021 10:05:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGfQX-0003n2-TE; Mon, 01 Mar 2021 10:05:21 +0000
Received: by outflank-mailman (input) for mailman id 91412;
 Mon, 01 Mar 2021 10:05:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m81q=H7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lGfQW-0003mx-OS
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 10:05:20 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6af40abd-bfb4-4b09-93c9-ed14bd420163;
 Mon, 01 Mar 2021 10:05:19 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 64DC1ADE5;
 Mon,  1 Mar 2021 10:05:18 +0000 (UTC)
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
X-Inumbo-ID: 6af40abd-bfb4-4b09-93c9-ed14bd420163
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614593118; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I85YvG63xiKI1EdSmWPpVQXUBthXlkkhb07ihuINFm4=;
	b=mV6Ex57eM8Kw7T7+p0XfQfNpzI4pOEr+qDrOJ394Lk2Arxx+hAR9ILgxPRUdLa5EaSFHZX
	KXz/RdlCo3iANO0vRfYUwmyvKywhPo4V3CEaKb9h9T8dJ/83mN8fDDPOXq1/oVKq1ZXTyp
	s2mUnd9DJeqokYglrnzdSO2oajQCpps=
Subject: Re: [PATCH for-4.15 2/3] firmware: provide a stand alone set of
 headers
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210226085908.21254-1-roger.pau@citrix.com>
 <20210226085908.21254-3-roger.pau@citrix.com>
 <2133ba4c-5120-30ca-1328-c8700fd2db94@suse.com>
 <YDyu3mWSgIIB6s91@Air-de-Roger>
 <445b205b-0a0b-da53-b7ba-98a1ac51aab4@suse.com>
 <YDy45rEl5sqv2eqk@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e2f254cf-4726-609e-850d-1c0ea73028b9@suse.com>
Date: Mon, 1 Mar 2021 11:05:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YDy45rEl5sqv2eqk@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 01.03.2021 10:50, Roger Pau Monné wrote:
> On Mon, Mar 01, 2021 at 10:17:32AM +0100, Jan Beulich wrote:
>> On 01.03.2021 10:07, Roger Pau Monné wrote:
>>> On Fri, Feb 26, 2021 at 02:24:43PM +0100, Jan Beulich wrote:
>>>> On 26.02.2021 09:59, Roger Pau Monne wrote:
>>>>> The current build of the firmware relies on having 32bit compatible
>>>>> headers installed in order to build some of the 32bit firmware, but
>>>>> that usually requires multilib support and installing a i386 libc when
>>>>> building from an amd64 environment which is cumbersome just to get
>>>>> some headers.
>>>>>
>>>>> Usually this could be solved by using the -ffreestanding compiler
>>>>> option which drops the usage of the system headers in favor of a
>>>>> private set of freestanding headers provided by the compiler itself
>>>>> that are not tied to libc. However such option is broken at least
>>>>> in the gcc compiler provided in Alpine Linux, as the system include
>>>>> path (ie: /usr/include) takes precedence over the gcc private include
>>>>> path:
>>>>>
>>>>> #include <...> search starts here:
>>>>>  /usr/include
>>>>>  /usr/lib/gcc/x86_64-alpine-linux-musl/10.2.1/include
>>>>>
>>>>> Since -ffreestanding is currently broken on at least that distro, and
>>>>> for resilience against future compilers also having the option broken
>>>>> provide a set of stand alone 32bit headers required for the firmware
>>>>> build.
>>>>>
>>>>> This allows to drop the build time dependency on having a i386
>>>>> compatible set of libc headers on amd64.
>>>>>
>>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>>
>>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>>> with possibly small adjustments:
>>>>
>>>>> ---
>>>>> There's the argument of fixing gcc in Alpine and instead just use
>>>>> -ffreestanding. I think that's more fragile than providing our own set
>>>>> of stand alone headers for the firmware bits. Having the include paths
>>>>> wrongly sorted can easily make the system headers being picked up
>>>>> instead of the gcc ones, and then building can randomly fail because
>>>>> the system headers could be amd64 only (like the musl ones).
>>>>>
>>>>> I've also seen clang-9 on Debian with the following include paths:
>>>>>
>>>>> #include "..." search starts here:
>>>>> #include <...> search starts here:
>>>>>  /usr/local/include
>>>>>  /usr/lib/llvm-9/lib/clang/9.0.1/include
>>>>>  /usr/include/x86_64-linux-gnu
>>>>>  /usr/include
>>>>>
>>>>> Which also seems slightly dangerous as local comes before the compiler
>>>>> private path.
>>>>>
>>>>> IMO using our own set of stand alone headers is more resilient.
>>>>
>>>> I agree (in particular given the observations), but I don't view
>>>> this as an argument against use of -ffreestanding. In fact I'd
>>>> rather see this change re-based on top of Andrew's changes. Then ...
>>>
>>> But doesn't using -nostdinc kind of defeats the purpose of
>>> -ffreestanding, as it would remove all default paths from the include
>>> search, and thus prevent using the gcc private headers?
>>
>> I guess I don't understand: It is the purpose of this change here to
>> not use compiler provided headers (nor libc provided ones), so why
>> would it matter to retain any kind of built-in include paths?
> 
> Sorry, I'm also confused.
> 
> It's my understanding that the point of using -ffreestanding is that
> the compiler will set __STDC_HOSTED__ == 0, and then the built in
> compiler headers will be used to provide a freestanding environment
> instead of the libc ones.
> 
> However if -nostdinc is used the header search path becomes:
> 
> #include <...> search starts here:
> End of search list.
> 
> At which point setting __STDC_HOSTED__ == 0 is pointless as the built
> in compiler headers are not used, and hence the compiler will always
> resort to the stand alone environment provided in this patch.
> 
> -ffreestanding also allows the program to have a non-standard main,
> but I don't think we care much about that since we already use a custom
> linker script.

While indeed we don't care about this specific last aspect, we
do e.g. care about the implied -fno-builtin (which currently we
specify explicitly, yes). So while with -nostdinc added we
_might_ indeed be fine already, I think we're better off going
the full step and specify what we mean, even if - right now -
we're unaware of further effects which are relevant to us. (For
example, I don't see why in principle we couldn't ourselves
grow a use of __STDC_HOSTED__ somewhere.)

Jan

