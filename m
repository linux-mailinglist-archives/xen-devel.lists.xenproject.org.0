Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 963631CB3F6
	for <lists+xen-devel@lfdr.de>; Fri,  8 May 2020 17:51:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jX5Go-0004sE-Uy; Fri, 08 May 2020 15:50:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nu4B=6W=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jX5Gn-0004s9-ID
 for xen-devel@lists.xenproject.org; Fri, 08 May 2020 15:50:37 +0000
X-Inumbo-ID: a865cd4a-9143-11ea-a02a-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a865cd4a-9143-11ea-a02a-12813bfff9fa;
 Fri, 08 May 2020 15:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ryni20iStrFgE63HRr0c2L62ozRLJ8mQqDXVcSy1G0o=; b=v9yBpfz4yeys70013FohC/h6T5
 Fgi4eE0l3EUrF+9UnvJWXDXtCBMTesYR1eYfsTuKhyNiS7w2uf2FngMXoB2Yvr1c2vIPrfpr6i04S
 mqz8KcJS/TjKSyRBQQpHUK9d8v8B2E1da+SZU51cC846HRYAqIiwhyT0ZTwvARHZ5NqE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jX5Gj-0003Fz-1u; Fri, 08 May 2020 15:50:33 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jX5Gi-0002Xh-MG; Fri, 08 May 2020 15:50:32 +0000
Subject: Re: Xen Coding style
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>
References: <ad26bbdc-5209-ce0c-7956-f8b08e6c2492@amazon.com>
 <8771c424-6340-10e5-1c1f-d72271ab8c1b@suse.com>
 <38926d4e-3429-58bc-f43c-514aed253a8e@xen.org>
 <3b55f045-c6a0-af62-c607-3a85d38cea25@suse.com>
 <63d1ceac-81bb-c916-d403-6f227b4d0ea8@xen.org>
 <CABfawhnvKgoP_EE7An8FDgJ11Ta8_gOo7tZ_J98sB_+Qir7=Yg@mail.gmail.com>
 <10ee3601-fc34-5714-30ea-abd2f2c03cfe@suse.com>
 <CABfawhkRcVavY+gkyvPfUTDdr1Xf=Xsmap11mgCi8cwcNyR=Ug@mail.gmail.com>
 <d0be31c1-f5fe-30ba-9c1a-5d37333d2479@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <f24a6c04-e11d-ae64-3d9a-cb3ad1ac3c14@xen.org>
Date: Fri, 8 May 2020 16:50:30 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <d0be31c1-f5fe-30ba-9c1a-5d37333d2479@suse.com>
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
Cc: "paul@xen.org" <paul@xen.org>, Julien Grall <jgrall@amazon.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Woodhouse,
 David" <dwmw@amazon.co.uk>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 08/05/2020 15:42, Jürgen Groß wrote:
> On 08.05.20 16:23, Tamas K Lengyel wrote:
>> On Fri, May 8, 2020 at 8:18 AM Jürgen Groß <jgross@suse.com> wrote:
>>>
>>> On 08.05.20 14:55, Tamas K Lengyel wrote:
>>>> On Fri, May 8, 2020 at 6:21 AM Julien Grall <julien@xen.org> wrote:
>>>>>
>>>>> Hi Jan,
>>>>>
>>>>> On 08/05/2020 12:20, Jan Beulich wrote:
>>>>>> On 08.05.2020 12:00, Julien Grall wrote:
>>>>>>> You seem to be the maintainer with the most unwritten rules. Would
>>>>>>> you mind to have a try at writing a coding style based on it?
>>>>>>
>>>>>> On the basis that even small, single aspect patches to CODING_STYLE
>>>>>> have been ignored [1],
>>>>>
>>>>> Your thread is one of the example why I started this thread. 
>>>>> Agreeing on
>>>>> specific rule doesn't work because it either result to bikesheding or
>>>>> there is not enough interest to review rule by rule.
>>>>>
>>>>>> I don't think this would be a good use of my
>>>>>> time.
>>>>>
>>>>> I would have assumed that the current situation (i.e
>>>>> nitpicking/bikeshedding on the ML) is not a good use of your time :).
>>>>>
>>>>> I would be happy to put some effort to help getting the coding style
>>>>> right, however I believe focusing on an overall coding style would 
>>>>> value
>>>>> everyone's time better than a rule by rule discussion.
>>>>>
>>>>>> If I was promised (reasonable) feedback, I could take what I
>>>>>> have and try to add at least a few more things based on what I find
>>>>>> myself commenting on more frequently. But really I'd prefer it to
>>>>>> be done the other way around - for people to look at the patches
>>>>>> already sent, and for me to only subsequently send more. After all,
>>>>>> if already those adjustments are controversial, I don't think we
>>>>>> could settle on others.
>>>>> While I understand this requires another investment from your part, 
>>>>> I am
>>>>> afraid it is going to be painful for someone else to go through all 
>>>>> the
>>>>> existing coding style bikeshedding and infer your unwritten rules.
>>>>>
>>>>> It might be more beneficial for that person to pursue the work done by
>>>>> Tamas and Viktor in the past (see my previous e-mail). This may 
>>>>> mean to
>>>>> adopt an existing coding style (BSD) and then tweak it.
>>>>
>>>> Thanks Julien for restarting this discussion. IMHO agreeing on a set
>>>> of style rules ahead and then applying universally all at once is not
>>>> going to be productive since we are so all over the place. Instead, I
>>>> would recommend we start piece-by-piece. We introduce a baseline style
>>>> checker, then maintainers can decide when and if they want to move
>>>> their code-base to be under the automated style checker. That way we
>>>> have a baseline and each maintainer can decide on their own term when
>>>> they want to have their files be also style checked and in what form.
>>>> The upside of this route I think is pretty clear: we can have at least
>>>> partial automation even while we figure out what to do with some of
>>>> the more problematic files and quirks that are in our code-base. I
>>>> would highly prefer this route since I would immediately bring all
>>>> files I maintain over to the automated checker just so I never ever
>>>> have to deal with this again manually. What style is in use to me
>>>> really doesn't matter, BSD was very close with some minor tweaks, or
>>>> even what we use to check the style just as long as we have
>>>> _something_.
>>>
>>> Wouldn't it make more sense to have a patch checker instead and accept
>>> only patches which change code according to the style guide? This
>>> wouldn't require to change complete files at a time.

So what are you going to do if a new contributor is unfortunate enough 
to modify code that doesn't pass the coding style checker? Are we going 
to impose him/her to fix the coding style before submitting his patch?

>>
>> In theory, yes. But in practice this would require that we can agree
>> on a style that applies to all patches that touch any file within Xen.
>> We can't seem to do that because there are too many exceptions and
>> corner-cases and personal-preferences of maintainers that apply only
>> to a subset of the codebase. So AFAICT what you propose doesn't seem
>> to be a viable way to start.
> 
> I think long ago we already agreed to have a control file which tells a
> style checker which style to apply (if any). As a start we could have a
> patch checker checking only the commit message (has it a Signed-off-by:
> etc.). The next step would be to add the control file, and the framework
> to split the patch into the changed file hunks and passing each hunk to
> the correct checking script (might be doing nothing in the beginning).
> And then we could add some logic to the single checkers.

Yes the framework can be written down now (patches are welcomed). But 
this doesn't resolve the underlying problem. Aside files imported from 
Linux, what is the coding style of Xen?

The best way to describe it at the moment is a collection of unwritten 
rules that can differ even between maintainers of the same component. I 
don't really see how we could write a style checker based on this.

The best way to reduce the burden on reviewer and bikeshedding is by 
formalizing what our coding style. With that, we can write a style 
checker effectively and all sort of other tools.

It would prefer to have a common one but we could consider small quirks 
per components if it is necessary.

Cheers,

-- 
Julien Grall

