Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C03835AE1A2
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 09:54:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399609.640835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVTPX-0005y2-3y; Tue, 06 Sep 2022 07:54:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399609.640835; Tue, 06 Sep 2022 07:54:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVTPX-0005vx-17; Tue, 06 Sep 2022 07:54:19 +0000
Received: by outflank-mailman (input) for mailman id 399609;
 Tue, 06 Sep 2022 07:54:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oVTPV-0005vl-GN
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 07:54:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVTPT-0005hO-EJ; Tue, 06 Sep 2022 07:54:15 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=[192.168.11.176]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVTPT-0006W5-7w; Tue, 06 Sep 2022 07:54:15 +0000
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
	bh=a8Wh/kJtL/F/TQEAqDvvb/FehWLQq5CpfEz41666VF8=; b=cFNeC34hQ7X4atEEK4UENrUpwf
	E1ZiHkOiAxwed3IQGiWqp/TPmAoBW7gwepM8Ow68GlXEmw8qs3AJ1OTx1cvdr8JvH3OYTlToHRU0n
	oyMwZO37i22JEf0A4bMwjau4G9nXRpBoIMWgdqybRDD0Bd5bX6p2JsRtgMqbxTx33RSQ=;
Message-ID: <7bf75eba-f5c5-6c63-5c45-10c5d2d20254@xen.org>
Date: Tue, 6 Sep 2022 08:54:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v3 7/7] xen/arm: introduce new xen,enhanced property value
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Rahul Singh <Rahul.Singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1662023183.git.rahul.singh@arm.com>
 <d8dae49b05e6c59715016e0995b1275f3cb6e7fc.1662023183.git.rahul.singh@arm.com>
 <28b9679c-8223-ae71-d629-4ec31a72dcb2@xen.org>
 <36A408C8-36C5-4A39-80B4-F564445635C7@arm.com>
 <616b36ec-5a42-cb9a-2131-3aea1bec7c67@xen.org>
 <46897765-5063-49CE-8A8A-F4DA50570A08@arm.com>
 <a669182c-dab1-35b7-9bf7-caac1813e3ad@xen.org>
 <C27FD0DE-D8FA-4A67-AE0B-DF4030A65127@arm.com>
 <a14b4d4a-5ae6-4af0-2d00-49bbc688cd4a@xen.org>
 <6B0D4F4B-C7CC-4C04-9BA4-71976CAA82C5@arm.com>
 <cf2872c6-23e3-ced4-d7c5-2a5e6ade98ad@xen.org>
 <1874D575-E3B3-4221-925F-AF71D3EF0289@arm.com>
 <EBF5412F-F932-4D25-A2E3-9F53D59ABBCC@arm.com>
 <alpine.DEB.2.22.394.2209051530250.3931@ubuntu-linux-20-04-desktop>
 <D1317300-F801-47B6-B54A-E0788F6477EF@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <D1317300-F801-47B6-B54A-E0788F6477EF@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 06/09/2022 08:24, Bertrand Marquis wrote:
>> I agree with Julien: I prefer this proposal compared to the earlier one
>> by Bertrand and Rahul because I think it is a lot clearer and "ENHANCED"
>> should mean everything. Also, it makes it easier from a compatibility
>> perspective because it matches the current definition.
>>
>> But I also agree with Bertrand that "BASIC" doesn't sound nice. I think
>> we should keep "DOM0LESS_ENHANCED" and "DOM0LESS_XENSTORE" as suggested
>> here, but replace "DOM0LESS_ENHANCED_BASIC" with something better. Some
>> ideas:
>>
>> - DOM0LESS_ENHANCED_LIMITED
>> - DOM0LESS_ENHANCED_MINI
> 
> Personally I do not find those more clear then BASIC
> 
>> - DOM0LESS_ENHANCED_NO_XS
> 
> This has the problem to be true now but would need renaming if we introduce a definition for an other bit.

Internal renaming is not a problem.

> 
>> - DOM0LESS_ENHANCED_GNT_EVTCHN
> 
> I would vote for this one as it explicitly state what is in so the bitset system is even more meaningful.

This would be fine if the flag were doing what it is supposed to do (i.e 
enable grant-table and event-channel only). However, so far, it will 
expose any Xen features but Xenstore. So of the features are strictly 
not necessary for the grant-table/event-channel support (e.g. ballooning 
facilities, runstate...).

The name would also really confusing in the definition of ENHANCED 
(XENSTORE | GNT_EVTCHN). Does this mean the domain cannot use the runstate?

Cheers,

-- 
Julien Grall

