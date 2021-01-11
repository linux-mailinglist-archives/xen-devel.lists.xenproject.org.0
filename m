Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7522F115F
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 12:26:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64792.114541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyvKX-000530-7y; Mon, 11 Jan 2021 11:25:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64792.114541; Mon, 11 Jan 2021 11:25:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyvKX-00052a-3n; Mon, 11 Jan 2021 11:25:49 +0000
Received: by outflank-mailman (input) for mailman id 64792;
 Mon, 11 Jan 2021 11:25:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kyvKW-00052V-EB
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 11:25:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kyvKW-0002Vi-5F; Mon, 11 Jan 2021 11:25:48 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kyvKV-0000RH-R0; Mon, 11 Jan 2021 11:25:47 +0000
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
	MIME-Version:Date:Message-ID:From:References:To:Subject;
	bh=6wWTD1w1y9OPUtPjfxT8DkCxivVEaKv11VliSlk9058=; b=XiX+fkd8aDuXhDJ1U2jUY0RgE3
	yXUc+q7TevKQP+zW+6ZXWiaGJEDDEavYpAgcn0bZjWqIIGQqmHGoE33QbsBztTmPi2X7/6b0JbCfH
	3JnymfAzrL5CWBoyfl/Zcb8AuEQFS46ofAY3qJnQdEez0I8O9NhbARhLcQiYGuQrbsTA=;
Subject: Re: Smoke test failure on Arm (was Re: [PATCH v4 0/8] xen/arm:
 Emulate ID registers) [and 2 more messages]
To: Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
References: <E1kyZKj-0000Qd-6A@osstest.test-lab.xenproject.org>
 <osstest-158303-mainreport@xen.org>
 <cover.1608214355.git.bertrand.marquis@arm.com>
 <ea8e117c-26c0-5c94-e06a-12027d25d7d6@xen.org>
 <338ef917-4b67-d839-82e4-164bbf46f85e@arm.com>
 <alpine.DEB.2.21.2101051042230.4307@sstabellini-ThinkPad-T480s>
 <7942af32-6bae-36c4-e1ee-dd3edc85097a@xen.org>
 <alpine.DEB.2.21.2101051425360.4307@sstabellini-ThinkPad-T480s>
 <db69c99b-d7b5-fe10-b24b-2a673c7b9e28@xen.org>
 <alpine.DEB.2.21.2101061235160.7075@sstabellini-ThinkPad-T480s>
 <094d2819-8658-d74f-e7da-c61cdeb14608@xen.org>
 <24572.13383.933043.911224@mariner.uk.xensource.com>
From: Julien Grall <julien@xen.org>
Message-ID: <bf780e18-6a7d-c8a5-ed30-88c684dbcbe2@xen.org>
Date: Mon, 11 Jan 2021 11:25:45 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <24572.13383.933043.911224@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Ian,

On 11/01/2021 11:19, Ian Jackson wrote:
> It seems there is still something wrong with ARM in staging.  Whatever
> change was made passed the smoke test but now the main flights are
> failing:
> 
> osstest service owner writes:
>> flight 158303 xen-unstable real [real]
>> http://logs.test-lab.xenproject.org/osstest/logs/158303/
>>
>> Regressions :-(
>>
>> Tests which did not succeed and are blocking,
>> including tests which could not be run:
>>   test-arm64-arm64-xl-thunderx  8 xen-boot             fail REGR. vs. 158290
>>   test-arm64-arm64-examine      8 reboot               fail REGR. vs. 158290
>>   test-arm64-arm64-xl-xsm       8 xen-boot             fail REGR. vs. 158290
>>   test-arm64-arm64-xl-credit1   8 xen-boot             fail REGR. vs. 158290
> 
> The bisector has fingered the same commit in unstable as it did in the
> smoke tests.  That might be because the fix made to staging, to get
> the smoke tests to pass, was not complete enough.  It also might be
> because something different broke the other tests and the tree was
> briefly working in between.

The smoke test ran on laxton0 (AMD Seattle) while the unstable test ran 
on rochester0 (Cavium Thunder-X).

The issue seems to be processor specific.

> 
> fx: puts on Release Manager hat.  Can one of you ARM folks please take
> a look at this and fix it ASAP ?

Jan sent an e-mail this morning about this. See [1].

Cheers,

[1] <dce8bed2-db66-b032-06a9-86c8f80d26aa@xen.org>

-- 
Julien Grall

