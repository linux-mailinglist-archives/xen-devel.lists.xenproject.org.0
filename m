Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D9A55998F
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 14:18:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355492.583183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4iFd-0000pd-8l; Fri, 24 Jun 2022 12:17:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355492.583183; Fri, 24 Jun 2022 12:17:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4iFd-0000mL-5M; Fri, 24 Jun 2022 12:17:29 +0000
Received: by outflank-mailman (input) for mailman id 355492;
 Fri, 24 Jun 2022 12:17:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o4iFa-0000mF-Tc
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 12:17:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4iFa-0005Sy-DB; Fri, 24 Jun 2022 12:17:26 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238] helo=[192.168.4.76])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4iFa-0007To-54; Fri, 24 Jun 2022 12:17:26 +0000
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
	bh=hDFGIsyZPScWlB7MJVgrHZKeGG+H8Vr4QrP7ZqH1GvE=; b=afk+ajY2L4Kkpl+4EDtnX7wA+7
	q63jTKFYoIPE1S94h0vnG6FyU3KqFBYkFZG1V0Loo/XiePXPH+zMxnFUb9VCxqcweZtOXbiuGczhP
	IQFxwrLbqgF0iod2t59DEgFthcdIraJ+ZkMYS2gPYicCcWCuSlTXMkENIEqajAye0Wy0=;
Message-ID: <88bd7017-e2b3-59f3-a68a-25db9e53136d@xen.org>
Date: Fri, 24 Jun 2022 13:17:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH] docs/misra: Add instructions for cppcheck
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220624105311.21057-1-luca.fancellu@arm.com>
 <692d09fa-5513-132a-6b5b-4bc62e46a443@xen.org>
 <15F23829-3693-47CC-A9D6-3D7A3B44EB64@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <15F23829-3693-47CC-A9D6-3D7A3B44EB64@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 24/06/2022 13:01, Luca Fancellu wrote:
> Hi Julien,

Hi Luca,

> 
>>> +First recommendation is to use exactly the same version in this page and provide
>>> +the same option to the build system, so that every Xen developer can reproduce
>>> +the same findings.
>>
>> I am not sure I agree. I think it is good that each developper use their own version (so long it is supported), so they may be able to find issues that may not appear with 2.7.
> 
> Yes I understand, but as Bertrand says, other version of this tool doesn’t work quite well. 

I have replied to this on Bertrand e-mail.


> I agree that everyone should use their own version, but for the sake of reproducibility
> of the findings, I think we should have a common ground.

I will reply to this below.

> The community can however propose from time to time to bump the version as long as we can say it works (maybe
> crossing the reports between cppcheck, eclair, other proprietary tools).

This would mean we should de-support 2.7 which sounds wrong if it worked 
before.

> 
>>
>>> +
>>> +Install cppcheck in the system
>>
>> NIT: s/in/on/ I think.
> 
> Sure will fix
>>
>>> +==============================
>>> +
>>> +Cppcheck can be retrieved from the github repository or by downloading the
>>> +tarball, the version tested so far is the 2.7:
>>> +
>>> + - https://github.com/danmar/cppcheck/tree/2.7
>>> + - https://github.com/danmar/cppcheck/archive/2.7.tar.gz
>>> +
>>> +To compile and install it, here the complete command line:
>>> +
>>> +make MATCHCOMPILER=yes \
>>> + FILESDIR=/usr/share/cppcheck \
>>> + CFGDIR=/usr/share/cppcheck/cfg \
>>> + HAVE_RULES=yes \
>>> + CXXFLAGS="-O2 -DNDEBUG -Wall -Wno-sign-compare -Wno-unused-function" \
>>> + install
>>
>> Let me start that I am not convinced that our documentation should explain how to build cppcheck.
>>
>> But if that's desire, then I think you ought to explain why we need to update CXXFLAGS (I would expect cppcheck to build everywhere without specifying additional flags).
> 
> Yes you are right, this is the recommended command line for building as in https://github.com/danmar/cppcheck/blob/main/readme.md section GNU make, I can add the source.

I think we should remove the command line and tell the user to read the 
cppcheck README.md.

> 
> My intention when writing this page was to have a common ground between Xen developers, so that if one day someone came up with a fix for something, we are able to reproduce
> the finding all together.
Well, if someone find a fix you want to check against all versions not 
the one that warns. Otherwise, you can end up in a situation where you 
silence cppcheck 2.10 (just making up a version) but then introduce a 
warning in cppcheck 2.7.

To me this is no different than other software used to build Xen. We 
don't tell the user that they should always build with GCC x.y.z. 
Instead, we provide a minimum version. This has multiple benefits:
  1) The user doesn't need to rebuild the software and can use the one 
provided by the distributions
  2) Different versions find different (most of the time) valid bugs. So 
we are getting towards a better codebase.

Cheers,

-- 
Julien Grall

