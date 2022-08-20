Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E85F59AFD0
	for <lists+xen-devel@lfdr.de>; Sat, 20 Aug 2022 21:09:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390869.628484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPTpx-0007JC-LB; Sat, 20 Aug 2022 19:08:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390869.628484; Sat, 20 Aug 2022 19:08:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPTpx-0007HQ-HT; Sat, 20 Aug 2022 19:08:49 +0000
Received: by outflank-mailman (input) for mailman id 390869;
 Sat, 20 Aug 2022 19:08:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oPTpw-0007HK-1w
 for xen-devel@lists.xenproject.org; Sat, 20 Aug 2022 19:08:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oPTpt-0008FP-9i; Sat, 20 Aug 2022 19:08:45 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oPTpt-0002hN-24; Sat, 20 Aug 2022 19:08:45 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=jng5HCW7wQ+fvQzgfFq13eV/V99XPlJSQ/Drv/8a6pU=; b=nE1AyrhnvAPPQ1MM3qhJUpLLLS
	ox3C1dJ2Ng4Qx9H436urTQrF/qJrptcdl3rWYZpgHfcu/p6ahp8yollI/gqF5WnX/DNO9gnMLU2NL
	m9dppfyyIgj7kCPV7CqvAo0s8HaaHtAIOzkmhlhqIBAprFFD10HTguNaerh1MFdMq8HA=;
Message-ID: <f235f6f8-d585-4e24-7fc8-3f2df9240c9d@xen.org>
Date: Sat, 20 Aug 2022 20:08:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org, wl@xen.org, jbeulich@suse.com,
 george.dunlap@citrix.com, andrew.cooper3@citrix.com,
 bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com, roger.pau@citrix.com
References: <alpine.DEB.2.22.394.2208181453530.3790@ubuntu-linux-20-04-desktop>
 <20220818220320.2538705-3-stefano.stabellini@amd.com>
 <61b01c8b-1f98-e559-f971-f081a25e0b93@xen.org>
 <alpine.DEB.2.22.394.2208191528050.3790@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 3/3] add SPDX to arch/arm/*.c
In-Reply-To: <alpine.DEB.2.22.394.2208191528050.3790@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 19/08/2022 23:53, Stefano Stabellini wrote:
> On Fri, 19 Aug 2022, Julien Grall wrote:
>> On 18/08/2022 23:03, Stefano Stabellini wrote:
>>> Add SPDX license information to all the *.c files under arch/arm.
>>
>> There are some of the files below that didn't have copyright. It would be
>> worth explaining in the commit message which license you selected and how.
>> AFAICT you assumed they were GPLv2 but I am not sure this is correct at least
>> one of them.
> 
> My goal is not to change the existing license on any of the files, even
> if the existing license is imprecise. By what is written under COPYING,
> everything not explicitly listed is GPL-2.0. I only reflected today's
> reality. I think it is best if we keep mechanical changes separate from
> "smart" changes, especially on a series like this introducing many
> mechanical changes.  More on this at the bottom.

I will answer to this at the bottom.

>> [...]
>>
>>> diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
>>> index f5f6562600..2537dbebc1 100644
>>> --- a/xen/arch/arm/decode.c
>>> +++ b/xen/arch/arm/decode.c
>>> @@ -1,3 +1,4 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>
>> This license is not part of LICENSES. Was it intended?
> 
> It is: the tag is described as part of LICENSES/GPL-2.0.

Ah! I was looking as the list of files and didn't look for the tag. 
Thanks for the pointer :).

> 
> 
>> If yes, this should be mentioned in one of the commit message (possible patch
>> #2) and maybe in CONTRIBUTING (to tell user to not use it for new files)
>> because one could expect all the LICENSES to be listed.
> 
> It could make sense to say that:
> 
> /* SPDX-License-Identifier: GPL-2.0 */
> 
> is recommended for new files.

So I was reading through xen/COPYING and we already have something like 
that:

"Note that the only valid version of the GPL as far as Xen is concerned
is _this_ particular version of the license (i.e., *only* v2, not v2.2
or v3.x or whatever), unless explicitly otherwise stated."

So nothing to add here unless you want to tell the contributor which tag 
correspond to GPLv2.

> 
> 
>>>    /*
>>>     * xen/arch/arm/decode.c
>>>     *
>>> @@ -5,16 +6,6 @@
>>>     *
>>>     * Julien Grall <julien.grall@linaro.org>
>>>     * Copyright (C) 2013 Linaro Limited.
>>> - *
>>> - * This program is free software; you can redistribute it and/or modify
>>> - * it under the terms of the GNU General Public License as published by
>>> - * the Free Software Foundation; either version 2 of the License, or
>>> - * (at your option) any later version.
>>> - *
>>> - * This program is distributed in the hope that it will be useful,
>>> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>> - * GNU General Public License for more details.
>>>     */
>>>      #include <xen/guest_access.h>
>>
>> [...]
>>
>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>> index 3fd1186b53..b29bdf3aa6 100644
>>> --- a/xen/arch/arm/domain_build.c
>>> +++ b/xen/arch/arm/domain_build.c
>>> @@ -1,3 +1,4 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>
>> AFAIU, the assumption is all the files with no copyright are GPLv2. That works
>> here. But ...
>>
>>>    #include <xen/init.h>
>>>    #include <xen/compile.h>
>>>    #include <xen/lib.h>
>>> diff --git a/xen/arch/arm/domain_page.c b/xen/arch/arm/domain_page.c
>>> index 71182575f9..47405e0866 100644
>>> --- a/xen/arch/arm/domain_page.c
>>> +++ b/xen/arch/arm/domain_page.c
>>> @@ -1,3 +1,4 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>
>> .... this file was split from mm.c which is gpl-2.0-or-later. So I don't think
>> we can use GPL-2.0 here.
> 
> Well spotted! Effectively this file is now declared as GPL 2.0 only,
> given what is stated in COPYING. The code in domain_page has lost "or
> later" with the loss of the copyright header.

Yes. This was an oversight from me when I split the code a few weeks ago.

> 
> So if there were new contributions to this file after its creation, they
> would have been GPL-2.0 only contributions, and it would have been
> impossible to go back to GPL-2.0-or-later without asking the copyright
> owners of the new changes.
> 
> In this case thankfully there are no new contributions since the split
> of the file, so I can fix it by using the SPDX GPL-2.0-or-later tag
> without problems. I'll do it in the next version of the series.
> 
> Xen is not saying: "if there is no copyright header it might be GPLv2
> but you need to look it up". Xen is actively saying: "if there is no
> copyright header it is GPLv2". Not up for discussion. Given that as a
> whole Xen is GPLv2, the only possibility is that the file without a
> copyright header used to be:
> - GPLv2 or later
> - dual license GPL and another compatible license (e.g. BSD)
> 
> Either way, with the loss of the copyright header, the file becomes
> immediately GPLv2 only.
> 
> Does it make sense?
> 
> This is why I think it is best to keep copyright discussions out of the
> SPDX patches review and limit ourselves to mechanical changes.

Yes I agree this series should be mechanical (baring the file that is 
contain GPLv2+ code).

I am putting some thoughts below (they can be split in a separate thread 
if you prefer).

This is not the first time this topic is brought up and probably not the 
last as long as we have file using GPLv2+.

IIRC from past discussion there are two broads concern with GPLv2+:
   - We are leaving the choice of which license applies to the person 
copying the code. So if a new version is released that is less favorable 
to the initial contributor, then we have no leverage.
   - Some companies are rather cautious to contribute code that my be 
licensed under GPLv3 (would be allowed with GPLv2+).

The later is particularly a problem because not many people realize that 
a fair part of Xen on Arm is GPLv2+. I never really understood why we 
chose that (this was before my time) but this got spread as the existing 
copyright was added to a new file. Admittely, the contributor should be 
more cautious. But I would not say this is trivial to spot the difference.

I would like to consider to re-license all the GPLv2+ files to GPLv2. 
AFAIU, this would mean we would need to ask the permission for every 
comapany that contributed to the file. Do you know if this was done 
before in Xen Project?

Cheers,

-- 
Julien Grall

