Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7103480836A
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 09:44:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649602.1014290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rB9yX-0002tj-Bu; Thu, 07 Dec 2023 08:43:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649602.1014290; Thu, 07 Dec 2023 08:43:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rB9yX-0002rr-7f; Thu, 07 Dec 2023 08:43:17 +0000
Received: by outflank-mailman (input) for mailman id 649602;
 Thu, 07 Dec 2023 08:43:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rB9yV-0002rj-Tl
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 08:43:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rB9yR-0006e8-13; Thu, 07 Dec 2023 08:43:11 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rB9yQ-0002X6-RW; Thu, 07 Dec 2023 08:43:10 +0000
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
	bh=B0o4FSP3sNW7d5pk5ZbI4YFCDsL+/YfidwTgsBn/X0s=; b=eWT7sJH92/u93sqLTFlnAOBSBs
	8igWTxfIh2hT8XJfz1fhwZtvQ3cF3SOlX62PR3Gu3Qiw2EsF123CVWY3ABsxd5KTSl1S/pCoPYMYf
	k6dG2RjBm790/QQFonRLvKckYBgGpsbG4AqqIjEulsWWQ2NSTlSXdNAbQACBdR2SFbhg=;
Message-ID: <52f25f40-ab42-4845-9912-81ce92cc4de6@xen.org>
Date: Thu, 7 Dec 2023 08:43:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Clang-format configuration discussion - pt 2
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Luca Fancellu <Luca.Fancellu@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <Michal.Orzel@amd.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 George Dunlap <george.dunlap@cloud.com>
References: <1B83FF45-E93B-47D7-AD21-615CFCFD0816@arm.com>
 <2E778E49-C2F5-421F-9598-CED15E7D4284@arm.com>
 <827e24a2-0ecd-48c4-becb-12129c4208dc@suse.com>
 <CA+zSX=b77av9rHwWHsRD8MAnprfXQiotUPPPKFDOU9cTOA2OzA@mail.gmail.com>
 <4ce995a3-78a1-49e5-881d-d6af10514673@xen.org>
 <b71c4e81-7026-40b2-ad76-ea4de5bbf6b3@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <b71c4e81-7026-40b2-ad76-ea4de5bbf6b3@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 07/12/2023 07:28, Jan Beulich wrote:
> On 06.12.2023 18:55, Julien Grall wrote:
>> On 06/12/2023 02:32, George Dunlap wrote:
>>> On Tue, Dec 5, 2023 at 2:07 PM Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 05.12.2023 14:46, Luca Fancellu wrote:
>>>>> In my opinion, I don’t know of any tool that can address all the flexibility the Xen codestyle allows, yet the use of automatic
>>>>> checkers would improve the review time, allow more new contributors to approach the community without being put down by
>>>>> the amount of code-style comments,
>>>>
>>>> Since this argument is being repeated: I find it odd. No-one needs to even
>>>> fear any amount of style comments if they simply follow the written down
>>>> policy plus a tiny bit of common sense. According to my observation, (some)
>>>> newcomers don't even care to look at what is being said about our style.
>>>> It's not like you and I haven't been through this. When I started working
>>>> with GNU toolchain, I had to adopt to their style. When I later started to
>>>> work with Linux, I had to also adopt there. And then for Xen. And all of
>>>> that already past closed source projects I had been working on before.
>>
>> I am not sure I get the point. With this argument, we are not only
>> putting load on the contributors but also on the reviewers because we
>> have to check the style manually while reviewing the code.
>>
>> Do you really think this is a good use of our time? Personally I don't
>> think so and definitely there are more unwritten rule than you let
>> transpire above.
>>
>> A good example is the "_" vs "-". If even a maintainer can't guess it,
>> then how can a contributor know it?
> 
> I didn't even hint at anything unwritten, did I?

You didn't and that was my point. I don't think we can put the unwritten 
rules aside when arguing about how easy it is to follow our coding 
style. They are usually the ones that tends to be the most contentious 
and trigger the most debate everytime they come up...

>>> Most modern languages, including golang (and I think rust) have
>>> built-in style correctors (`go fmt` is go's official one).  If you
>>> haven't worked with an automatic style checker / fixer, you don't know
>>> how much time, hassle, and emotional energy you're saving.  I don't
>>> think I know anyone who, after using one, wants to go back to not
>>> using one any more.
>>>
>>> In general, I'm in favor of making changes to our style such that we
>>> can make clang's style checker official.  The only reason I would vote
>>> against it is if one of the style requirements was really intolerable;
>>> but I find that pretty unlikely.
>>
>> +1
>>
>>>
>>> And as I've said before, the main reservation I have going forward
>>> with this discussion is that I can't see clearly what it is that I'm
>>> agreeing to.
>>
>> +1
>>
>> I found the way we dealt with MISRA rules quite helpful. We had a weekly
>> meeting to discuss some of the rules and then the outcome was posted on
>> the ML. Maybe we should do the same here? Any other suggestion how to move?
> 
> I have mixed feelings with meetings like the Misra ones. That's probably
> unavoidable because of it being a goal to move fast. I'm not sure the
> same applies here. 

I think in this situation is less about moving fast but more about 
making a closure of the 3 years+ discussion about the coding style.

We had several persons (including maintainers) expressing there 
frustration about the coding style [1]. And this is not really going 
better...

We have a couple of solutions:
   1. Properly codify our coding style
   2. Pick an existing one close enough to Xen

The first one would require the less change in Xen but given nobody 
really agree on changes to CODING_STYLE, I feer it is going to take a 
very long time to retrofit. From the discussion here, it also seems like 
we will not be able to get the automatic checker doing what we want.

For the second one, this may have an impact on Xen. But it would help to 
use an automatic checker. I also don't expect many contributors been 
able to sink a lot of time trying to come to a conclusion with the 
coding style. So I would chose the least path of resistance which is 2. 
I believe this is what Luca is attempting.

> But first of all - see also what George said - there
> needs to be a coherent proposal of what aspects of style to change in
> which way. The more heavy the changes, the harder it may be for long
> time contributors to adapt;

The whole point of having an automatic coding-style checker/formatting 
is you don't need to worry about it anymore.

Obviously if you intend to avoid the coding style checker, then it will 
be more difficult...

Cheers,

[1] 
https://lore.kernel.org/all/CABfawhnaDS=nGn3+NqoY_nWXvu0cfsAmpYjiv9VqkT6C0Ow1FA@mail.gmail.com/

-- 
Julien Grall

