Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9008C1A995D
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 11:50:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOeg6-0006xU-9J; Wed, 15 Apr 2020 09:49:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=HSXo=57=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jOeg4-0006xP-60
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 09:49:52 +0000
X-Inumbo-ID: 739811f6-7efe-11ea-9e09-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 739811f6-7efe-11ea-9e09-bc764e2007e4;
 Wed, 15 Apr 2020 09:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u9uuE064Jb8xCh61RnjnOpdhmp/TBNWR/mKJf5x6p5Q=; b=Ft4P8P93LSORFtDNGdbVs94XSp
 D8zOtX5lmWewyw62cCnawg3KgNP1kH8NjRtPt9z0T3QQc6Z3N8iT7qT7OGFM58cQzk5Jl7ulU63b1
 apLS4MLDbeAAwVIT8A9K7FDVP5ngNA4ODsvxyiWxTa7fmL9F5CNSvYPgnmfi7rh+L/Bs=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jOeg1-00080X-Hu; Wed, 15 Apr 2020 09:49:49 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jOeg1-0007fp-A0; Wed, 15 Apr 2020 09:49:49 +0000
Subject: Re: [PATCH v2] Introduce a description of a new optional tag for
 Backports
To: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>
References: <20200410164942.9747-1-sstabellini@kernel.org>
 <50c8b3be-eadf-dd39-3ce0-05658faa3a4a@suse.com>
 <alpine.DEB.2.21.2004140953450.4953@sstabellini-ThinkPad-T480s>
 <707a1448-be1d-0aa8-6b11-a33eb247304f@suse.com>
 <04881FC6-A816-44AB-8F25-54E5A265707E@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <49c732e6-d30d-0892-0bd7-65c082da0429@xen.org>
Date: Wed, 15 Apr 2020 10:49:47 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <04881FC6-A816-44AB-8F25-54E5A265707E@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
 Stefano Stabellini <sstabellini@kernel.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 15/04/2020 10:43, George Dunlap wrote:
> 
> 
>> On Apr 15, 2020, at 7:23 AM, Jan Beulich <JBeulich@suse.com> wrote:
>>
>> On 14.04.2020 18:54, Stefano Stabellini wrote:
>>> On Tue, 14 Apr 2020, Jan Beulich wrote:
>>>> On 10.04.2020 18:49, Stefano Stabellini wrote:
>>>
> [snip]
>>>>> +    Backport: all
>>>>> +
>>>>> +It marks a commit for being a candidate for backports to all relevant
>>>>> +trees.
>>>>
>>>> I'm unconvinced of the utility of this form - what "all" resolves to
>>>> changes over time. There's almost always a first version where a
>>>> particular issue was introduced. If we want this to be generally
>>>> useful, imo we shouldn't limit the scope of the tag to the upstream
>>>> maintained stable trees.
>>>
>>> The reason why I suggested also to have a "wildcard" version of this
>>> tag, is that the person adding the tag (could be the contributor trying
>>> to be helpful) might not know exactly to which stable trees the patch
>>> should be backported to.
>>>
>>> Writing this sentence, I realize that I really meant "any" rather than
>>> "all". Would you prefer if I used "any"? Or we could even suggest to leave
>>> it black like this:
>>>
>>>   Backport:
>>>
>>> But it looks a bit weird.
>>
>> Indeed. Instead of "all" or "any", how about "yes", "unspecified", or
>> "unknown"? Nevertheless, I still think people asking for a backport
>> should be nudged towards determining the applicable range; them not
>> doing so effectively pushes the burden to the general maintainers or
>> the stable tree ones, both of which scales less well. Omitting the
>> tag if they don't want to invest the time would to me then seem to
>> be the cleanest alternative. Albeit I'm sure views here will vary.
> 
> FWIW asking people adding the tag to do the work of figuring out which versions to backport to makes sense to me.

If you ask the contributor to do the work then you need to give guidance 
on the "older" version you can specify in Backport.

For instance, let say the bug was introduced in Xen 4.2. Are we allowing 
the user to specify Backport: 4.2+ or should it be 4.11+?

I would favor the former as this helps for downstream user which haven't 
yet moved to the supported stable tree.

Cheers,

-- 
Julien Grall

