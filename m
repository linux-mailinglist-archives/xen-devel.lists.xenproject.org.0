Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4681BBAB3
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 12:06:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTN80-0004of-CU; Tue, 28 Apr 2020 10:06:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c5nG=6M=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jTN7y-0004oa-Jj
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 10:06:10 +0000
X-Inumbo-ID: e214778a-8937-11ea-ae69-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e214778a-8937-11ea-ae69-bc764e2007e4;
 Tue, 28 Apr 2020 10:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2428JvOxmqbJVE6MC3VW9164x8yTcsFVcaiWK3PSEyc=; b=WbVKq00uIgL8khQwD0Vx0EzIkD
 t6EAysqr/P5uXHd9PJgrEZgrc0lYG5GLvRiNxOrk72VEynUW/lm8NShi9igI4E/2jeJdznt7nasER
 zW+EauAezyfK5bLHFyWSBl/Yc8KeeQBfzmdw5h6m6R1ZK8GQNMusncw+YlY+PcxtjN4c=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jTN7x-0008WG-Bp; Tue, 28 Apr 2020 10:06:09 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jTN7x-00056B-0q; Tue, 28 Apr 2020 10:06:09 +0000
Subject: Re: [PATCH v7 08/12] xen: add /buildinfo/config entry to hypervisor
 filesystem
To: Jan Beulich <jbeulich@suse.com>
References: <20200402154616.16927-1-jgross@suse.com>
 <20200402154616.16927-9-jgross@suse.com>
 <19f84540-6b49-f99d-805a-e07f56330f31@suse.com>
 <b9ddd1fb-d868-bb69-3b6b-27531beda2fa@suse.com>
 <f7d1f3aa-3a7e-fcb2-3163-5e67756e8452@suse.com>
 <17d65095-a51e-2e00-38ee-7c1c83d2bb99@suse.com>
 <51e0f0d2-f9ce-83fd-79fa-ae4805356612@suse.com>
 <31c7f4fe-847c-96f5-e598-dba99b0bb61a@suse.com>
 <085E1F72-EC22-43D6-8F7E-EDC132CC787D@citrix.com>
 <fb0e92cc-102f-7f87-1ad6-f3ccce1eee60@suse.com>
 <064958B4-1FCC-4300-A98A-7A1D608376F8@citrix.com>
 <23606595-8ce0-5151-d800-1dc0d97513d1@suse.com>
 <304ab794-4d04-ae0d-d644-a7ddb0f23bf4@xen.org>
 <26926b3c-11ee-345b-5602-c4607dbe37ae@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e8d3539b-618b-969d-4c56-a08959393a4a@xen.org>
Date: Tue, 28 Apr 2020 11:06:06 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <26926b3c-11ee-345b-5602-c4607dbe37ae@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 28/04/2020 10:59, Jan Beulich wrote:
> On 28.04.2020 11:43, Julien Grall wrote:
>> Hi Jan,
>>
>> On 28/04/2020 09:39, Jan Beulich wrote:
>>> On 28.04.2020 10:24, George Dunlap wrote:
>>>>> On Apr 28, 2020, at 8:20 AM, Jan Beulich <jbeulich@suse.com> wrote:
>>>>> On 27.04.2020 18:25, George Dunlap wrote:
>>>>>> If Jan is OK with it simply being outside CONFIG_EXPERT, then great.  But if he insists on some kind of testing for it to be outside of CONFIG_EXPERT, then again, the people who want it to be security supported should be the ones who do the work to make it happen.
>>>>>
>>>>> I don't understand this part, I'm afraid: Without a config option,
>>>>> the code is going to be security supported as long as it doesn't
>>>>> get marked otherwise (experimental or what not). With an option
>>>>> depending on EXPERT, what would become security unsupported is the
>>>>> non-default (i.e. disabled) setting. There's not a whole lot to
>>>>> test there, it's merely a formal consequence of our general rules.
>>>>> (Of course, over time dependencies of other code may develop on
>>>>> the information being available e.g. to Dom0 userland. Just like
>>>>> there's Linux userland code assuming the kernel config is
>>>>> available in certain ways [I don't necessarily mean the equivalent
>>>>> of hypfs here], to then use it in what I'd call abusive ways in at
>>>>> least some cases.)
>>>>
>>>> Here’s an argument you might make:
>>>>
>>>> “As a member of the security team, I don’t want to be on the hook for issuing XSAs for code which isn’t at least smoke-tested.  Therefore, I oppose any patch adding CONFIG_HYPFS outside of CONFIG_EXPERT, *unless* there is a concrete plan for getting regular testing for CONFIG_HYPFS=n.”
>>>>
>>>> I’m not saying that’s an argument you *should* make.  But personally I don’t have a strong argument against such an argument. So, it seems to me, if you did make it, you have a reasonable chance of carrying your point.
>>>>
>>>> Now consider this hypothetical universe where you made that argument and nobody opposed it.  In order to get a particular feature (CONFIG_HYPFS=n security supported), there is extra work that needs to be done (getting CONFIG_HYPFS=n tested regularly).  My point was, the expectation should be that the extra work will be done by the people who want or benefit from the feature; the series shouldn’t be blocked until Juergen implements CONFIG_HYPFS=n testing (since he doesn’t personally have a stake in that feature).
>>>>
>>>> Now obviously, doing work to help someone else out in the community is of course a good thing to do; it builds goodwill, uses our aggregate resources more efficiently, and makes our community more enjoyable to work with.  But the goodwill primarily comes from the fact that it was done as a voluntary choice, not as a requirement.
>>>>
>>>> Juergen was balking at having to do what he saw as extra work to implement CONFIG_HYPFS.  I wanted to make it clear that even though I see value in having CONFIG_HYPFS, *he* doesn’t have to do the work if he doesn’t want to (although it would certainly be appreciated if he did).  And this paragraph was extending the same principle into the hypothetical universe where someone insisted that CONFIG_HYPFS=n had to be tested before being security supported.
>>>>
>>>> Hope that makes sense. :-)
>>>
>>> Yes, it does, thanks for the clarification. I can see what you describe
>>> as a valid perspective to take, but really in my request to Jürgen I
>>> took another: Now that we have Kconfig, additions of larger bodies of
>>> code (possibly also just in terms of binary size) should imo generally
>>> be questioned whether they want/need to be built for everyone. I.e. it
>>> is not to be left to people being worried about binary sizes to arrange
>>> for things to not be built, but for people contributing new but not
>>> entirely essential code to consider making it option from the very
>>> beginning.
>>
>> I like the idea to have a more configurable Xen but this also comes at the expense of the testing/support.
>>
>> At the moment, we are getting around the problem by gating the new config options with CONFIG_EXPERT. I have stoppped counting the number of time I sweared because my config got rewritten when using 'make clean' or explain to someone else how to use it.
>>
>> As it stands, CONFIG_EXPERT is unusable and most likely anything behind it will rot quite quickly. So if we want to add more stuff behind it, then I would suggest to make it more accessible so any developper can experiment with it.
> 
> This complaint is not new; what I'm missing are concrete suggestions
> on how to improve the situation.

It is quite easy to improve, rather than specifying on the command line 
we could introduce a new Kconfig option so the user can select it normally.

This would not be very different compare to what Linux does.

> 
>> Going forward, I would expect the embedded folks to want more part of Xen configurable. Requesting them to use CONFIG_EXPERT may be an issue as this means we would not security support them. At the same time, I understand that exposing a CONFIG increase the testing matrix. How about declaring we are supporting/testing a given set of .config? On Arm it would be defconfig and tiny.
> 
> We could do this, sure, but it would end up being rather limiting at
> least on the x86 side.

It would not be worse than where we are today, right?

> 
> Considering how frequently this is coming up, perhaps instead we
> should drop use of EXPERT mostly or altogether, and declare that
> we're willing to live with the fallout? We could document options
> or option combinations we specifically exclude from being supported
> then ...

I would not suggest to remove EXPERT so far, just to make easier to use
of EXPERT.

Cheers,

-- 
Julien Grall

