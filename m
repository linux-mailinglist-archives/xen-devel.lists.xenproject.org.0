Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E77301B7219
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 12:35:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRvft-0000Q0-TU; Fri, 24 Apr 2020 10:35:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WQMg=6I=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jRvfr-0000Pr-M3
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 10:35:11 +0000
X-Inumbo-ID: 465b3fd6-8617-11ea-83d8-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 465b3fd6-8617-11ea-83d8-bc764e2007e4;
 Fri, 24 Apr 2020 10:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xhfyywIssX/u9GqLDNH+aeGbuO0fHxD9WwzpORFPQ2k=; b=SnSFsSK1sM0g6xirtb3DJ+OHQk
 e/eo4vvdfDIwIdrzzVVCntjoG+SXnxuB5qXTBQ7MJAQur0vpYyh27KyEF8XtX7vUjU3Ih6iDu057c
 8X5L4J3bAyE5zZpKB4aBPWCURNOKhu8vDyW04M6bBIE7QZjoy2ElbDrJTfywG1ROJYiY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jRvfp-0005VW-EQ; Fri, 24 Apr 2020 10:35:09 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jRvfp-0002dI-7c; Fri, 24 Apr 2020 10:35:09 +0000
Subject: Re: [PATCH 0/3] xenoprof: XSA-313 follow-up
To: paul@xen.org, 'Jan Beulich' <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
References: <25c5b76f-4f95-3ba9-0ae0-dd0c1f3f8496@suse.com>
 <002801d61302$dbd21950$93764bf0$@xen.org>
 <410df70e-6e21-2d0a-8148-62ccf2a24366@xen.org>
 <004301d61724$9a5c9ab0$cf15d010$@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <660fa82f-7316-a0ec-baef-dee18f0a57ea@xen.org>
Date: Fri, 24 Apr 2020 11:35:07 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <004301d61724$9a5c9ab0$cf15d010$@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Wei Liu' <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Paul,

On 20/04/2020 16:01, Paul Durrant wrote:
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: 20 April 2020 15:15
>> To: paul@xen.org; 'Jan Beulich' <jbeulich@suse.com>; xen-devel@lists.xenproject.org
>> Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>; 'George Dunlap' <george.dunlap@citrix.com>; 'Ian
>> Jackson' <ian.jackson@eu.citrix.com>; 'Stefano Stabellini' <sstabellini@kernel.org>; 'Wei Liu'
>> <wl@xen.org>
>> Subject: Re: [PATCH 0/3] xenoprof: XSA-313 follow-up
>>
>> Hi Paul,
>>
>> On 15/04/2020 09:50, Paul Durrant wrote:
>>>> -----Original Message-----
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: 15 April 2020 09:45
>>>> To: xen-devel@lists.xenproject.org
>>>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap <george.dunlap@citrix.com>; Ian
>> Jackson
>>>> <ian.jackson@eu.citrix.com>; Julien Grall <julien@xen.org>; Stefano Stabellini
>>>> <sstabellini@kernel.org>; Wei Liu <wl@xen.org>; Paul Durrant <paul@xen.org>
>>>> Subject: [PATCH 0/3] xenoprof: XSA-313 follow-up
>>>>
>>>> Patch 1 was considered to become part of the XSA, but it was then
>>>> decided against. The other two are a little bit of cleanup, albeit
>>>> there's certainly far more room for tidying. Yet then again Paul,
>>>> in his mail from Mar 13, was asking whether we shouldn't drop
>>>> xenoprof altogether, at which point cleaning up the code would be
>>>> wasted effort.
>>>>
>>>
>>> That's still my opinion. This is a large chunk of (only passively maintained) code which I think is
>> of very limited value (since it relates to an old tool, and it only works for PV domains).
>>
>> While there are no active user we are aware of, this is an example on
>> how to implement a profiler backend with Xen. So I would agree with
>> Andrew here.
>>
>> IIRC, the reason behind your request is it makes difficult for your
>> xenheap work. Am I correct? If so, do you have a thread explaining the
>> issues?
> 
> After shared info and grant table, it is the only other occurrence of a xenheap page shared with a non-system domain. Also, it cannot be trivially replaced with an 'extra' domheap page because its assignment changes. Thus a whole bunch of cleanup work that I was hoping to do (largely in domain_relinquish_resources and free_domheap_pages) is either ruled out, or would have to special-case this type of page.

My knowledge of xenoprof is very limited, so I might be wrong.

 From my understanding, a buffer can only be shared between two domains:
    - When in passive mode, the buffer will be shared with the primary 
profiler (always the hwdom per the check in xenoprof_op_init()).
    - When in active mode, the buffer will be shared with the domain 
requesting to be profiled.

Would it be possible to consider to have a separate buffer for the 
passive mode and active mode?

> Also, I am unconvinced that PV guests are sufficiently common these days (apart from dom0) that profiling them is of any real use.

Even an HVM guest can't profile itself, I think it would be useful to 
have dom0 to profile an HVM guest. Are you suggesting this doesn't work?

Cheers,

-- 
Julien Grall

