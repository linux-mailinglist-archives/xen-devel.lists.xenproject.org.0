Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF2C3F5AD4
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 11:18:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170758.311661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mISYo-0005rE-FA; Tue, 24 Aug 2021 09:17:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170758.311661; Tue, 24 Aug 2021 09:17:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mISYo-0005pR-C3; Tue, 24 Aug 2021 09:17:34 +0000
Received: by outflank-mailman (input) for mailman id 170758;
 Tue, 24 Aug 2021 09:17:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mISYm-0005pL-Uu
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 09:17:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mISYi-0007am-Nh; Tue, 24 Aug 2021 09:17:28 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mISYi-00071u-HW; Tue, 24 Aug 2021 09:17:28 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=SPcgU1Wj2foiQgmDV260M9lK2mvEVW5aQeKvMNPW/s8=; b=iBo5Oj5fcGTHVBw3U8Qd5HiieK
	ymoDo6PathUG5+OgxOOS85NZ+Z/9xdpXWo7JAOsRcJQFZ0AVrVj0iZQbxGspipt2AdotZQV1jseYG
	BM5nN8eOP2Ov+XHVP+4+XE56/1M6bU8riQXdeKkhD4hCmSBcm5ROMHAo4C9RU6LkEZWw=;
Subject: Re: Xen 4.16: Proposed release manager and schedule
To: Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, George Dunlap <George.Dunlap@citrix.com>,
 committers@xenproject.org
References: <24861.8902.217023.673705@mariner.uk.xensource.com>
 <5198b3ce-8a7c-a5b1-4ddd-f2052e1d4181@suse.com>
 <24862.31351.137596.242803@mariner.uk.xensource.com>
From: Julien Grall <julien@xen.org>
Message-ID: <db112874-eb0a-c9ad-4509-6d048b056038@xen.org>
Date: Tue, 24 Aug 2021 10:17:26 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <24862.31351.137596.242803@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Ian,

On 19/08/2021 16:36, Ian Jackson wrote:
> Jan Beulich writes ("Re: Xen 4.16: Proposed release manager and schedule"):
>> On 18.08.2021 17:09, Ian Jackson wrote:
>>> ** DRAFT **
>>>
>>>    Friday 17th September                 Last posting date
>>>
>>>      Patches adding new features should be posted to the mailing list
>>>      by this cate, although perhaps not in their final version.
>>>      (3 weeks)
>>
>> Without meaning this to express any opposition to the proposed schedule,
>> I'd like to point out that as of mid July there's been unusually little
>> changes getting committed. The above leaves less than a month (plus the
>> 3 weeks of until feature freeze); at the present rate this would mean
>> about no further (larger) changes.
> 
> Thanks for your reply.  I recognise the problems you describe.
>  From my pov as (putative) RM it is difficult to see what could
> constructively be done about this situation.
> 
> One option is to slip the whole release, in the expectation (hope!) of
> collecting more input.  In practical terms because of the impact of
> Christmas and New Year on many of our contributors, a month's slip now
> is probably more like two months' slip to the release.  So arguably
> for this to be worth it, we ought to plan to slip 2 months now and
> release in February.

A 2 months slip looks appealling to get more features. But it means we 
will end up to split all the future releases.

IIRC the timing was chosen so the release avoids major holidays in 
various part of the world. So we would either need to decide on a new 
cadence or find a way (maybe the next release will be longer as well?) 
to get back on track.

> 
> Some of the thinness of this release in particular relates to an
> unusual combination of substantial leave taken by many key
> contributors, so maybe this is a thing we should consider.
> Even my proposing this schedule was rather late, in part for those
> reasons.
> 
> I don't personally have a strong opinion about the right decision.
> But if we are intending to release in December, I think something like
> my proposed schedule is probably about right.  Perhaps it could be
> compressed a bit due to the lack of major contributions so far.

At the moment, my preference is to stick with the release in December. 
We don't have major contributions checked in yet on Arm, but there is a 
chance to have a couple of them with the current schedule on Arm.

We also have a collection of bug fixes which makes Arm running better on 
some platform.

So I think the release would still be worthwhile even in the worst case 
where nothing major is merged.

Cheers,

-- 
Julien Grall

