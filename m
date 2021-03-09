Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D125933228E
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 11:06:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95290.179815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJZF0-0007CL-KO; Tue, 09 Mar 2021 10:05:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95290.179815; Tue, 09 Mar 2021 10:05:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJZF0-0007Bv-H7; Tue, 09 Mar 2021 10:05:26 +0000
Received: by outflank-mailman (input) for mailman id 95290;
 Tue, 09 Mar 2021 10:05:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lJZEy-0007Bq-H7
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 10:05:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lJZEv-0004WG-0j; Tue, 09 Mar 2021 10:05:21 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lJZEu-0007DG-HT; Tue, 09 Mar 2021 10:05:20 +0000
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
	bh=Ydd65JX7traKb0hGUfqh3WQxjaeJ9AE7hlTdwXR+3jY=; b=P3Ni8lt34Fv3Ms+AHOJIzgIPQD
	dEY+V96J0fXpV3jdfQZBmX/QDCZ0PM3i22Y0mUzHOz+1QYKUvQL5M0IW/7+4fsPmW+viiTest5ypE
	4mJ8cpHNIWYMUdhUANIIkkCWBLt3C/QgxfiKIO6ZxZT3wlOW2hiQTu0UGX8H8me1pCGc=;
Subject: Re: [PATCH for-4.15] xen: Bump the minimum version of GCC supported
 to 4.9 (5.1 on arm64)
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, famzheng@amazon.com, cardoe@cardoe.com,
 wl@xen.org, Bertrand.Marquis@arm.com, andrew.cooper3@citrix.com
References: <161507188317.11025.6744028462008264481@c667a6b167f6>
 <af575951-9d48-09da-d120-a6120ca29ead@xen.org>
 <alpine.DEB.2.21.2103081654030.16374@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <10b8048a-e8fe-1fcd-7291-7f1b16da2f4c@xen.org>
Date: Tue, 9 Mar 2021 10:05:18 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2103081654030.16374@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 09/03/2021 00:59, Stefano Stabellini wrote:
> On Sun, 7 Mar 2021, Julien Grall wrote:
>> On 06/03/2021 23:04, no-reply@patchew.org wrote:
>>> Hi,
>>>
>>> Patchew automatically ran gitlab-ci pipeline with this patch (series)
>>> applied, but the job failed. Maybe there's a bug in the patches?
>>>
>>> You can find the link to the pipeline near the end of the report below:
>>>
>>> Type: series
>>> Message-id: 20210306214148.27021-1-julien@xen.org
>>> Subject: [PATCH for-4.15] xen: Bump the minimum version of GCC supported to
>>> 4.9 (5.1 on arm64)
>>>
>>> === TEST SCRIPT BEGIN ===
>>> #!/bin/bash
>>> sleep 10
>>> patchew gitlab-pipeline-check -p xen-project/patchew/xen
>>> === TEST SCRIPT END ===
>>>
>>> warning: redirecting to https://gitlab.com/xen-project/patchew/xen.git/
>>> warning: redirecting to https://gitlab.com/xen-project/patchew/xen.git/
>>>   From https://gitlab.com/xen-project/patchew/xen
>>>    * [new tag]               patchew/20210306214148.27021-1-julien@xen.org ->
>>> patchew/20210306214148.27021-1-julien@xen.org
>>> Switched to a new branch 'test'
>>> f332859b88 xen: Bump the minimum version of GCC supported to 4.9 (5.1 on
>>> arm64)
>>>
>>> === OUTPUT BEGIN ===
>>> [2021-03-06 21:45:17] Looking up pipeline...
>>> [2021-03-06 21:45:18] Found pipeline 266507477:
>>>
>>> https://gitlab.com/xen-project/patchew/xen/-/pipelines/266507477
>>>
>>> [2021-03-06 21:45:18] Waiting for pipeline to finish...
>>> [2021-03-06 22:00:21] Still waiting...
>>> [2021-03-06 22:15:26] Still waiting...
>>> [2021-03-06 22:30:31] Still waiting...
>>> [2021-03-06 22:45:35] Still waiting...
>>> [2021-03-06 23:00:41] Still waiting...
>>> [2021-03-06 23:04:42] Pipeline failed
>>> [2021-03-06 23:04:42] Job 'qemu-smoke-x86-64-clang-pvh' in stage 'test' is
>>> skipped
>>> [2021-03-06 23:04:42] Job 'qemu-smoke-x86-64-gcc-pvh' in stage 'test' is
>>> skipped
>>> [2021-03-06 23:04:42] Job 'qemu-smoke-x86-64-clang' in stage 'test' is
>>> skipped
>>> [2021-03-06 23:04:42] Job 'qemu-smoke-x86-64-gcc' in stage 'test' is skipped
>>> [2021-03-06 23:04:42] Job 'qemu-smoke-arm64-gcc' in stage 'test' is skipped
>>> [2021-03-06 23:04:42] Job 'qemu-alpine-arm64-gcc' in stage 'test' is skipped
>>> [2021-03-06 23:04:42] Job 'build-each-commit-gcc' in stage 'test' is skipped
>>> [2021-03-06 23:04:42] Job 'alpine-3.12-clang' in stage 'build' is failed
>>
>> The following jobs are failing:
>>
>> alpine-3.12-clang [1]
>> debian-unstable-32-gcc-debug
>> debian-unstable-clang
>> debian-unstable-gcc-randconfig
>> ubuntu-bionic-clang
>>
>> Cloning into 'qemu-xen-dir-remote.tmp'...
>> error: inflate: data stream error (incorrect data check)
>> fatal: serious inflate inconsistency
>> fatal: index-pack failed
>>
>> This looks unrelated to my patch. Possibly a network error?
> 
> Yeah.
> 
> 
>> =========
>>
>> centos-7-2-gcc [2]
>> centos-7-2-gcc-debug
>> centos-7-gcc
>> centos-7-gcc-debug
>>
>> Centos 7 is using GCC 4.8.5. This patch is bumping the minimum version to 4.9.
>> So the failure is expected.
>>
>> We may have to disable the jobs if my patch goes ahead. May I ask why we chose
>> to build on Centos 7?
> 
> CentOS 7 is still the latest and it is maintained until 2024:
> 
> https://wiki.centos.org/About/Product
> 
> I don't have a lot of direct experience with x86 users any longer, but
> this seems to be problematic?

The last full updates was on the Q3 2020, so it looks unlikely that 
Centos 7 will upgrade to a new Xen.

So this is only going to be a problem for anyone that decides to build 
there own Xen.

I can't tell whether someone may want to build upstream Xen on Centos 7. 
What I can say is the Arm64 bug in GCC 4.9 will lead to corruption, the 
bug in GCC < 4.8 looks somewhat less problematic.

So, I am sure any user would appreciate if we tell (e.g. throw an error) 
them when there is a risk that GCC X.Y may miscompile Xen.

In the ideal world (e.g if we had unlimited time), we should workaround 
it in Xen. But this doesn't look easy/possible here.

Therefore, for now, I think dropping support for GCC < 4.9 (< 5.1 for 
Arm) is the best approach. The support can be revived when someone is 
willing to spend time on it.

> 
> 
>> ==========
>>
>> ubuntu-trusty-gcc [3]
>> ubuntu-trusty-gcc-debug
>>
>> Ubuntu trusty is using GCC 4.8.4. This patch is bumping the minimum version to
>> 4.9. So the failure is expected. We may have to disable the jobs if my patch
>> goes ahead. May I ask why we chose to build on Ubuntu trusty?
> 
> Ubuntu Trusty is in "Extended Security Maintenance", so technically
> still supported also:
> 
> https://ubuntu.com/about/release-cycle

See above.

Cheers,

-- 
Julien Grall

