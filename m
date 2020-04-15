Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A471A9B2C
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 12:45:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOfXD-0004OK-SM; Wed, 15 Apr 2020 10:44:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UoJL=57=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jOfXC-0004OF-5H
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 10:44:46 +0000
X-Inumbo-ID: 1e5a4b2a-7f06-11ea-b4f4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e5a4b2a-7f06-11ea-b4f4-bc764e2007e4;
 Wed, 15 Apr 2020 10:44:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EDA5BAC51;
 Wed, 15 Apr 2020 10:44:42 +0000 (UTC)
Subject: Re: [PATCH v2] Introduce a description of a new optional tag for
 Backports
To: George Dunlap <George.Dunlap@citrix.com>
References: <20200410164942.9747-1-sstabellini@kernel.org>
 <50c8b3be-eadf-dd39-3ce0-05658faa3a4a@suse.com>
 <alpine.DEB.2.21.2004140953450.4953@sstabellini-ThinkPad-T480s>
 <707a1448-be1d-0aa8-6b11-a33eb247304f@suse.com>
 <04881FC6-A816-44AB-8F25-54E5A265707E@citrix.com>
 <49c732e6-d30d-0892-0bd7-65c082da0429@xen.org>
 <10D98CF7-E38E-44C3-AF24-C93088F6682D@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <454b13b1-2901-d864-6fc8-bc4f338a14d6@suse.com>
Date: Wed, 15 Apr 2020 12:44:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <10D98CF7-E38E-44C3-AF24-C93088F6682D@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15.04.2020 11:56, George Dunlap wrote:
> 
> 
>> On Apr 15, 2020, at 10:49 AM, Julien Grall <julien@xen.org> wrote:
>>
>>
>>
>> On 15/04/2020 10:43, George Dunlap wrote:
>>>> On Apr 15, 2020, at 7:23 AM, Jan Beulich <JBeulich@suse.com> wrote:
>>>>
>>>> On 14.04.2020 18:54, Stefano Stabellini wrote:
>>>>> On Tue, 14 Apr 2020, Jan Beulich wrote:
>>>>>> On 10.04.2020 18:49, Stefano Stabellini wrote:
>>>>>
>>> [snip]
>>>>>>> +    Backport: all
>>>>>>> +
>>>>>>> +It marks a commit for being a candidate for backports to all relevant
>>>>>>> +trees.
>>>>>>
>>>>>> I'm unconvinced of the utility of this form - what "all" resolves to
>>>>>> changes over time. There's almost always a first version where a
>>>>>> particular issue was introduced. If we want this to be generally
>>>>>> useful, imo we shouldn't limit the scope of the tag to the upstream
>>>>>> maintained stable trees.
>>>>>
>>>>> The reason why I suggested also to have a "wildcard" version of this
>>>>> tag, is that the person adding the tag (could be the contributor trying
>>>>> to be helpful) might not know exactly to which stable trees the patch
>>>>> should be backported to.
>>>>>
>>>>> Writing this sentence, I realize that I really meant "any" rather than
>>>>> "all". Would you prefer if I used "any"? Or we could even suggest to leave
>>>>> it black like this:
>>>>>
>>>>>  Backport:
>>>>>
>>>>> But it looks a bit weird.
>>>>
>>>> Indeed. Instead of "all" or "any", how about "yes", "unspecified", or
>>>> "unknown"? Nevertheless, I still think people asking for a backport
>>>> should be nudged towards determining the applicable range; them not
>>>> doing so effectively pushes the burden to the general maintainers or
>>>> the stable tree ones, both of which scales less well. Omitting the
>>>> tag if they don't want to invest the time would to me then seem to
>>>> be the cleanest alternative. Albeit I'm sure views here will vary.
>>> FWIW asking people adding the tag to do the work of figuring out which versions to backport to makes sense to me.
>>
>> If you ask the contributor to do the work then you need to give guidance on the "older" version you can specify in Backport.
>>
>> For instance, let say the bug was introduced in Xen 4.2. Are we allowing the user to specify Backport: 4.2+ or should it be 4.11+?
>>
>> I would favor the former as this helps for downstream user which haven't yet moved to the supported stable tree.
> 
> I agree that specifying the oldest revision possible would be helpful.
> 
> However, I don’t think finding the absolute oldest revision should be *required* — imagine a bug that was introduced between 3.2 and 3.3.  It’s also perfectly fine if you go all the way back to 4.2 and stop because you get bored, not because you found out that 4.1 didn’t need it.

In which case I'd like there to be a (canonical?) way of expressing
this, like in XSAs we say "at least back to" in such a case.

Jan

