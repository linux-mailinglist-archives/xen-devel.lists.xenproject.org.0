Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F591CB196
	for <lists+xen-devel@lfdr.de>; Fri,  8 May 2020 16:19:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jX3pf-0002z7-Sb; Fri, 08 May 2020 14:18:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JXU2=6W=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jX3pe-0002z2-7d
 for xen-devel@lists.xenproject.org; Fri, 08 May 2020 14:18:30 +0000
X-Inumbo-ID: c9787082-9136-11ea-a002-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c9787082-9136-11ea-a002-12813bfff9fa;
 Fri, 08 May 2020 14:18:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B9930ABC7;
 Fri,  8 May 2020 14:18:30 +0000 (UTC)
Subject: Re: Xen Coding style
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>, Julien Grall <julien@xen.org>
References: <ad26bbdc-5209-ce0c-7956-f8b08e6c2492@amazon.com>
 <8771c424-6340-10e5-1c1f-d72271ab8c1b@suse.com>
 <38926d4e-3429-58bc-f43c-514aed253a8e@xen.org>
 <3b55f045-c6a0-af62-c607-3a85d38cea25@suse.com>
 <63d1ceac-81bb-c916-d403-6f227b4d0ea8@xen.org>
 <CABfawhnvKgoP_EE7An8FDgJ11Ta8_gOo7tZ_J98sB_+Qir7=Yg@mail.gmail.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <10ee3601-fc34-5714-30ea-abd2f2c03cfe@suse.com>
Date: Fri, 8 May 2020 16:18:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CABfawhnvKgoP_EE7An8FDgJ11Ta8_gOo7tZ_J98sB_+Qir7=Yg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: "paul@xen.org" <paul@xen.org>, Julien Grall <jgrall@amazon.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Woodhouse,
 David" <dwmw@amazon.co.uk>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 08.05.20 14:55, Tamas K Lengyel wrote:
> On Fri, May 8, 2020 at 6:21 AM Julien Grall <julien@xen.org> wrote:
>>
>> Hi Jan,
>>
>> On 08/05/2020 12:20, Jan Beulich wrote:
>>> On 08.05.2020 12:00, Julien Grall wrote:
>>>> You seem to be the maintainer with the most unwritten rules. Would
>>>> you mind to have a try at writing a coding style based on it?
>>>
>>> On the basis that even small, single aspect patches to CODING_STYLE
>>> have been ignored [1],
>>
>> Your thread is one of the example why I started this thread. Agreeing on
>> specific rule doesn't work because it either result to bikesheding or
>> there is not enough interest to review rule by rule.
>>
>>> I don't think this would be a good use of my
>>> time.
>>
>> I would have assumed that the current situation (i.e
>> nitpicking/bikeshedding on the ML) is not a good use of your time :).
>>
>> I would be happy to put some effort to help getting the coding style
>> right, however I believe focusing on an overall coding style would value
>> everyone's time better than a rule by rule discussion.
>>
>>> If I was promised (reasonable) feedback, I could take what I
>>> have and try to add at least a few more things based on what I find
>>> myself commenting on more frequently. But really I'd prefer it to
>>> be done the other way around - for people to look at the patches
>>> already sent, and for me to only subsequently send more. After all,
>>> if already those adjustments are controversial, I don't think we
>>> could settle on others.
>> While I understand this requires another investment from your part, I am
>> afraid it is going to be painful for someone else to go through all the
>> existing coding style bikeshedding and infer your unwritten rules.
>>
>> It might be more beneficial for that person to pursue the work done by
>> Tamas and Viktor in the past (see my previous e-mail). This may mean to
>> adopt an existing coding style (BSD) and then tweak it.
> 
> Thanks Julien for restarting this discussion. IMHO agreeing on a set
> of style rules ahead and then applying universally all at once is not
> going to be productive since we are so all over the place. Instead, I
> would recommend we start piece-by-piece. We introduce a baseline style
> checker, then maintainers can decide when and if they want to move
> their code-base to be under the automated style checker. That way we
> have a baseline and each maintainer can decide on their own term when
> they want to have their files be also style checked and in what form.
> The upside of this route I think is pretty clear: we can have at least
> partial automation even while we figure out what to do with some of
> the more problematic files and quirks that are in our code-base. I
> would highly prefer this route since I would immediately bring all
> files I maintain over to the automated checker just so I never ever
> have to deal with this again manually. What style is in use to me
> really doesn't matter, BSD was very close with some minor tweaks, or
> even what we use to check the style just as long as we have
> _something_.

Wouldn't it make more sense to have a patch checker instead and accept
only patches which change code according to the style guide? This
wouldn't require to change complete files at a time.


Juergen

