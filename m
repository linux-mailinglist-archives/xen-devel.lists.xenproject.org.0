Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F225FC3F3
	for <lists+xen-devel@lfdr.de>; Wed, 12 Oct 2022 12:50:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421001.666159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiZJB-0006oO-RP; Wed, 12 Oct 2022 10:49:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421001.666159; Wed, 12 Oct 2022 10:49:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiZJB-0006m1-Oh; Wed, 12 Oct 2022 10:49:53 +0000
Received: by outflank-mailman (input) for mailman id 421001;
 Wed, 12 Oct 2022 10:49:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oiZJB-0006lv-8a
 for xen-devel@lists.xenproject.org; Wed, 12 Oct 2022 10:49:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oiZJ9-00038U-BO; Wed, 12 Oct 2022 10:49:51 +0000
Received: from [15.248.2.148] (helo=[10.24.69.10])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oiZJ9-0002qx-5C; Wed, 12 Oct 2022 10:49:51 +0000
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
	bh=3MfTNnSjWR3ocVSJbg4TZTpjgmify4S/m7d0xAw11cc=; b=dDxQ1frUjEO9OwyxMb3pnpTLKU
	39lAryroWDmAUj5XT4pn8WkextH5vasfFEeGrBGEa3YUlNXbHBy/2XiZge3q0wDiNW8gECRUTFcKZ
	Ld9cQvWdAMvF82Q1Gams80jyx47Y8QeSpUqvb4ANBLw649lVZyoCx8m9M2v/HFb8cvUU=;
Message-ID: <1f884b50-afb7-0210-21f8-f7fe22105feb@xen.org>
Date: Wed, 12 Oct 2022 11:49:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.1
Subject: Re: [xen-unstable-smoke test] 173492: regressions - FAIL
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Henry Wang
 <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: osstest service owner <osstest-admin@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>
References: <osstest-173492-mainreport@xen.org>
 <9a004932-ccaa-5e78-c0fa-6fe3f2c13b78@suse.com>
 <AS8PR08MB79917FBE55B5344A8A1F915D92229@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <add54637-1578-225e-7021-6b52e62b221b@xen.org>
 <09bd969d-b6f0-eedf-0a94-70856cc007e8@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <09bd969d-b6f0-eedf-0a94-70856cc007e8@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 12/10/2022 11:29, Andrew Cooper wrote:
> On 12/10/2022 11:01, Julien Grall wrote:
>> (+ Bertrand & Stefano)
>>
>> Hi Henry,
>>
>> On 12/10/2022 07:39, Henry Wang wrote:
>>>> -----Original Message-----
>>>> Subject: Re: [xen-unstable-smoke test] 173492: regressions - FAIL
>>>>
>>>> On 11.10.2022 18:29, osstest service owner wrote:
>>>>> flight 173492 xen-unstable-smoke real [real]
>>>>> http://logs.test-lab.xenproject.org/osstest/logs/173492/
>>>>>
>>>>> Regressions :-(
>>>>>
>>>>> Tests which did not succeed and are blocking,
>>>>> including tests which could not be run:
>>>>>    test-arm64-arm64-xl-xsm      14 guest-start              fail
>>>>> REGR. vs. 173457
>>>>
>>>> Parsing config from /etc/xen/debian.guest.osstest.cfg
>>>> libxl: debug: libxl_create.c:2079:do_domain_create: ao 0xaaaacaccf680:
>>>> create: how=(nil) callback=(nil) poller=0xaaaacaccefd0
>>>> libxl: detail: libxl_create.c:661:libxl__domain_make: passthrough:
>>>> disabled
>>>> libxl: debug: libxl_arm.c:148:libxl__arch_domain_prepare_config:
>>>> Configure
>>>> the domain
>>>> libxl: debug: libxl_arm.c:151:libxl__arch_domain_prepare_config:  -
>>>> Allocate
>>>> 0 SPIs
>>>> libxl: error: libxl_create.c:709:libxl__domain_make: domain creation
>>>> fail: No
>>>> such file or directory
>>
>> So this is -ENOENT which could be returned by the P2M is it can't
>> allocate a page table (see p2m_set_entry()).
>>
>>>> libxl: error: libxl_create.c:1294:initiate_domain_create: cannot
>>>> make domain:
>>>> -3
>>>>
>>>> Later flights don't fail here anymore, though.
>>>>
>>>>>    test-armhf-armhf-xl          14 guest-start              fail
>>>>> REGR. vs. 173457
>>>>
>>>> Similar log contents here, but later flights continue to fail the
>>>> same way.
>>>>
>>>> I'm afraid I can't draw conclusions from this; I haven't been able
>>>> to spot
>>>> anything helpful in the hypervisor logs. My best guess right now is
>>>> the use
>>>> of some uninitialized memory, which just happened to go fine in the
>>>> later
>>>> flights for 64-bit.
>>
>> It looks like the smoke flight failed on laxton0 but passed on
>> rochester{0, 1}. The former is using GICv2 whilst the latter are using
>> GICv3.
>>
>> In the case of GICv2, we will create a P2M mapping when the domain is
>> created. This is not necessary in the GICv3.
>>
>> IIRC the P2M pool is only populated later on (we don't add a few pages
>> like on x86). So I am guessing this is why we are seen failure.
>>
>> If that's correct, then this is a complete oversight from me (I
>> haven't done any GICv2 testing) while reviewing the series.
>>
>> The easy way to solve it would be to add a few pages in the pool when
>> the domain is created. I don't like it, but I think there other
>> possible solutions would require more work as we would need to delay
>> the mappings.
> 
> Honestly, I've considered doing this on x86 too.

AFAICT, this is already the case for HAP (see call to 
hap_set_allocation() in hap_enable()). 256 pages will be pre-allocated.

> 
> There are several things which want allocating in domain_create(), but
> are deferred to max_vcpus() because they require the P2M having a
> non-zero allocation.  This in turn means we've got a load of checks in
> paths where we'd ideally not have them.
> 
> We already have a calculation of the absolutely minimum we will ever
> permit the p2m pool to be.  IMO we ought to allocate this minimum size
> in domain_create().

It depends on the number. At the moment domain_create() is not 
preemptible, so we don't want to allocate too many pages (I think even 
256 pages could be risky on some Arm platform).

Maybe the solution is to have domain_create() preemptible. But it is not 
something that could be done in the 4.17 time frame.

Cheers,

-- 
Julien Grall

