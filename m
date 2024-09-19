Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E743897CE24
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2024 21:32:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800895.1210888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srMrc-0001lC-Ni; Thu, 19 Sep 2024 19:30:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800895.1210888; Thu, 19 Sep 2024 19:30:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srMrc-0001j1-Kr; Thu, 19 Sep 2024 19:30:52 +0000
Received: by outflank-mailman (input) for mailman id 800895;
 Thu, 19 Sep 2024 19:30:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1srMra-0001iv-SU
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2024 19:30:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1srMrX-0005Ut-Vd; Thu, 19 Sep 2024 19:30:47 +0000
Received: from [62.218.181.144] (helo=[172.20.2.228])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1srMrX-0002UO-Ov; Thu, 19 Sep 2024 19:30:47 +0000
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
	bh=gF0VgQFzO8veiufk0Mf4CetMu8wactK583fUPWGGEEE=; b=07n3mKmnMNtLuvtneNVIVU6VJ+
	HN8Ll3T9eyKoZptcXyDLXU7NKGtbsYv2+OmLcE810EOyEAJ4kG7qVtpxZ+8HNg39R2FxRzHVNKAYa
	anrHzOsM3oOVTCIS3RgPqvf5aDBzF9PF2XdhqyZqxPs44XXhAiKU2q4NuLo2k+tkxNvw=;
Message-ID: <6426e9c3-2971-4497-8703-c2653b1a164c@xen.org>
Date: Thu, 19 Sep 2024 21:30:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.20 release schedule proposal
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Community Manager <community.manager@xenproject.org>,
 "committers @ xenproject . org" <committers@xenproject.org>
References: <CAMacjJya_30yczOSBR=3f7_wGVgaSw_fWh7jhPqn3EQ3h4i2pQ@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CAMacjJya_30yczOSBR=3f7_wGVgaSw_fWh7jhPqn3EQ3h4i2pQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 19/09/2024 18:10, Oleksii Kurochko wrote:
> Hello everyone,
> 
> Following the 8-month release cycle, also taking into account that 4.19
> has been released 27.07.24 and the next "good" month for release should
> be November according to [1] but it seems to me that it could be too short,
> below is the proposed release schedule that I come up with for Xen 4.20.
> 
> Please don't hesitate to provide your feedback.
> 
> If there are no objections, I plan to update the Wiki page
> *Xen_Project_X.YY_Release_Notes* to make it easier to find our final
> schedule ( especially for the people who aren't following xen-devel mailing
> list ). As an additional benefit, it will also be accessible via
> *SUPPORT.md* (in the wiki at
> https://xenbits.xen.org/docs/unstable-staging/support-matrix.html).
> 
> Thanks!
> 
> ** Proposed option: Wed March 12, 2024 **
> (+8 months from Xen 4.19 release)
> 
> - Last posting date          Fri Dec 20, 2023 (+13 weeks from now)
> 
> Patches adding new features are expected to be posted to the mailing
> list by this date, although perhaps not in their final version.
 > > - Feature freeze             Fri Jan 10, 2024 (+3 weeks from Last 
posting
> date)
> 
> Patches adding new features should be committed by this date.
> Straightforward bugfixes may continue to be accepted by maintainers.

I expect a few maintainer to be off around Christmas for a couple of 
weeks. So that will not leave much time between the last posting date 
and feature freeze. If you don't want to push too much the release, then 
I think it would be better if the feature freeze is just before (e.g. 
20th December) so last posting date early December.

Cheers,

-- 
Julien Grall


