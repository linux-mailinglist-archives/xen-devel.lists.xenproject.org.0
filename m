Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0753F5A3D
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 10:56:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170750.311650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mISDs-0003My-Mi; Tue, 24 Aug 2021 08:55:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170750.311650; Tue, 24 Aug 2021 08:55:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mISDs-0003KN-It; Tue, 24 Aug 2021 08:55:56 +0000
Received: by outflank-mailman (input) for mailman id 170750;
 Tue, 24 Aug 2021 08:55:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mISDr-0003KH-ME
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 08:55:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mISDn-0007DR-Mx; Tue, 24 Aug 2021 08:55:51 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mISDn-0004e7-Gm; Tue, 24 Aug 2021 08:55:51 +0000
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
	bh=wVgtpYlYjXQSb3UpiwNiOFTGs7zww5EnvDddJY0c+H8=; b=yJ7DW0i+n+EitzFhozPT6vk4tY
	iqc69TfDmGaXmPLp2F8WyDYDXwXN0jTWt25wv9lo2RzPNWb/UDoH5c15NH8osKmsu1N0VLeUDQb7e
	yiEIIO3kg1782nH0d78jLy+aEhGDtgL3hRTsaSZASLtTtUPU1n6UeCGZPI7g8nKgiG20=;
Subject: Re: Xen 4.16: Proposed release manager and schedule
To: Ian Jackson <iwj@xenproject.org>, committers@xenproject.org
Cc: xen-devel@lists.xenproject.org, George Dunlap <George.Dunlap@citrix.com>
References: <24861.8902.217023.673705@mariner.uk.xensource.com>
From: Julien Grall <julien@xen.org>
Message-ID: <478691b0-d01c-4d4d-66f7-c7f417293ced@xen.org>
Date: Tue, 24 Aug 2021 09:55:49 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <24861.8902.217023.673705@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 18/08/2021 16:09, Ian Jackson wrote:
> We haven't formally appointed a release manager for Xen 4.16.
> I was approached and asked if I would do the job, and said yes,
> but I think things got stuck there.  Taking this as a prima
> faciae indication of community confidence, I hereby volunteer to
> take on this role.
> 
> And, I would like to tentatively propose the following schedule and
> policies for Xen 4.16.  This is based on the 4.15 schedule with some
> tweaks, and is intended to align the ultimate date roughly with the
> 4.10 and 4.13 releases, which were also in early/mid December.
> 
> I suggest we use the Lazy Consensus procedure to decide on the Release
> Manager appointment, starting now (since we're already rather late).
> In particular, if you feel someone else would make a better release
> manager, please say so right away.
> 
> For the release schedule, assuming I'm the RM, please send comments
> ASAP and in any case by noon UTC on Wednesday the 25th of August.  I
> hope to finalise the schedule then.
> 
> ** DRAFT **
> 
>    Friday 17th September                 Last posting date
> 
>      Patches adding new features should be posted to the mailing list
>      by this cate, although perhaps not in their final version.
>      (3 weeks)
> 
>    Friday 8th October                    Feature freeze
>   
>      Patches adding new features should be committed by this date.
>      Straightforward bugfixes may continue to be accepted by
>      maintainers.
>      (3 weeks)

At the moment, on Arm, I am tracking a few big series that are candidate 
for 4.16. Unfortunately, we will have some review bandwidth shortage 
over the next month so this will impact what we can merge on time.

So far, we don't have major features merged. If we follow this schedule, 
this will be a fairly quiet release.

I think on the Arm side, an extra week could give us some slack to merge 
part of what is currently under review on the ML.

I saw your answer to Jan about splipping the release for longer. I will 
answer there directly.

Cheers,

-- 
Julien Grall

