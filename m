Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D15747856
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 20:37:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558631.872916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGktP-0001rp-E7; Tue, 04 Jul 2023 18:36:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558631.872916; Tue, 04 Jul 2023 18:36:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGktP-0001oy-BG; Tue, 04 Jul 2023 18:36:51 +0000
Received: by outflank-mailman (input) for mailman id 558631;
 Tue, 04 Jul 2023 18:36:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qGktN-0001oq-O5
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 18:36:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGktL-0007mn-N3; Tue, 04 Jul 2023 18:36:47 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234] helo=[192.168.9.70])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGktL-0008Gi-Hq; Tue, 04 Jul 2023 18:36:47 +0000
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
	References:To:Subject:MIME-Version:Date:Message-ID;
	bh=pUNTY2OwvugjMFqnxMcZ1IG177+ppdCBOHZA/7+TsBI=; b=rAuxCljuAYSJZdIO6GjQwOhp3Q
	Q5IbutG+xYtiRK8zbLpBu6UvvrHRrxUNSIXe4qXKnYTT66kd7cOnXc+X2LAE5rwZUd1H5U7KkawDU
	e6LR7YDk3zP3hZPnRvzo0/sRANyPpL4l2cCQ7MU2kL5LWxGK/Q+EYUoH633nPos/s1wc=;
Message-ID: <f48fdc6d-35b2-6881-b395-13459f9d4d44@xen.org>
Date: Tue, 4 Jul 2023 19:36:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: xen | Failed pipeline for staging | 9dd3caf1
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <649eeb9f5347_281f686f427353e@gitlab-sidekiq-catchall-v2-54666fdc77-xrbls.mail>
 <bff9074d-0345-2931-c57b-3acda238a9b5@suse.com>
 <220e6e10-ab9f-b036-9acf-58109d2a7426@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <220e6e10-ab9f-b036-9acf-58109d2a7426@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 04/07/2023 16:50, Andrew Cooper wrote:
> On 04/07/2023 4:39 pm, Jan Beulich wrote:
>> On 30.06.2023 16:50, GitLab wrote:
>>>
>>> Pipeline #917215286 has failed!
>>>
>>> Project: xen ( https://gitlab.com/xen-project/xen )
>>> Branch: staging ( https://gitlab.com/xen-project/xen/-/commits/staging )
>>>
>>> Commit: 9dd3caf1 ( https://gitlab.com/xen-project/xen/-/commit/9dd3caf12f52b859947c260b1cb3a48b491d53b6 )
>>> Commit Message: {x86,arm}/mm.c: Make populate_pt_range __init
>>>
>>> ...
>>> Commit Author: George Dunlap
>>> Committed by: George Dunlap
>>>
>>>
>>> Pipeline #917215286 ( https://gitlab.com/xen-project/xen/-/pipelines/917215286 ) triggered by Ganis ( https://gitlab.com/ganis )
>>> had 3 failed jobs.
>>>
>>> Job #4573553348 ( https://gitlab.com/xen-project/xen/-/jobs/4573553348/raw )
>>>
>>> Stage: build
>>> Name: opensuse-tumbleweed-gcc-debug
>>> Job #4573553345 ( https://gitlab.com/xen-project/xen/-/jobs/4573553345/raw )
>>>
>>> Stage: build
>>> Name: opensuse-tumbleweed-gcc
>> While iirc the above continue to be expected, ...
>>
>>> Job #4573553188 ( https://gitlab.com/xen-project/xen/-/jobs/4573553188/raw )
>>>
>>> Stage: build
>>> Name: debian-unstable-gcc-debug-arm64-randconfig
>> ... this one has
>>
>> ld    -EL --no-warn-rwx-segments -T arch/arm/xen.lds -N prelink.o \
>>      ./common/symbols-dummy.o -o ./.xen-syms.0
>> ld: Xen is too big
>>
>> in its build log. Whatever the .config, I'm inclined to say this should
>> not happen.
This was a latent bug because building Xen with GCOV will result to a 
binary bigger than 2MB (the max size we currently support)

The ASSERT() makes it more obvious. I am not sure why we never gated 
GCOV with !ARM as I don't see how this could have booted. Anyway...

> 
> That is
> https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=02a11313cdc60d266d8613899fcc9d3870ef5164
> and is intermittent when randconfig chooses COVERAGE
> 
> "[v2 0/4] xen/arm: Enable USBAN support" on list should fix it.

... I have now committed the series. So randconfig should not fail anymore.

Cheers,

-- 
Julien Grall

