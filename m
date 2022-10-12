Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC205FC35E
	for <lists+xen-devel@lfdr.de>; Wed, 12 Oct 2022 12:02:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.420941.666079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiYYU-0008HE-07; Wed, 12 Oct 2022 10:01:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 420941.666079; Wed, 12 Oct 2022 10:01:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiYYT-0008F1-T5; Wed, 12 Oct 2022 10:01:37 +0000
Received: by outflank-mailman (input) for mailman id 420941;
 Wed, 12 Oct 2022 10:01:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oiYYS-0008Ev-JW
 for xen-devel@lists.xenproject.org; Wed, 12 Oct 2022 10:01:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oiYYR-0002Es-Ki; Wed, 12 Oct 2022 10:01:35 +0000
Received: from [15.248.2.148] (helo=[10.24.69.10])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oiYYR-0000sp-EZ; Wed, 12 Oct 2022 10:01:35 +0000
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
	bh=w+yWvQkrnh/YS559Rxc8tdkYjKXcooXovV4rsV94Lpw=; b=JrLrF4mXMYYWwBAG52SIabV02F
	PIyU7HtSTft7JfeJkNd3sI19Y0S/htiV3Zr7s/0hu3xplaqeX0pO4+4ySOzb0c1bcsfqCMpCP7whJ
	bRRHER6vdB+D/e8orfIP1HOwIFSeTxWCReP+nhUkOof11imT1fq0JsTP9v5ywQkJrCLI=;
Message-ID: <add54637-1578-225e-7021-6b52e62b221b@xen.org>
Date: Wed, 12 Oct 2022 11:01:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.1
Subject: Re: [xen-unstable-smoke test] 173492: regressions - FAIL
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: osstest service owner <osstest-admin@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>
References: <osstest-173492-mainreport@xen.org>
 <9a004932-ccaa-5e78-c0fa-6fe3f2c13b78@suse.com>
 <AS8PR08MB79917FBE55B5344A8A1F915D92229@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AS8PR08MB79917FBE55B5344A8A1F915D92229@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

(+ Bertrand & Stefano)

Hi Henry,

On 12/10/2022 07:39, Henry Wang wrote:
>> -----Original Message-----
>> Subject: Re: [xen-unstable-smoke test] 173492: regressions - FAIL
>>
>> On 11.10.2022 18:29, osstest service owner wrote:
>>> flight 173492 xen-unstable-smoke real [real]
>>> http://logs.test-lab.xenproject.org/osstest/logs/173492/
>>>
>>> Regressions :-(
>>>
>>> Tests which did not succeed and are blocking,
>>> including tests which could not be run:
>>>   test-arm64-arm64-xl-xsm      14 guest-start              fail REGR. vs. 173457
>>
>> Parsing config from /etc/xen/debian.guest.osstest.cfg
>> libxl: debug: libxl_create.c:2079:do_domain_create: ao 0xaaaacaccf680:
>> create: how=(nil) callback=(nil) poller=0xaaaacaccefd0
>> libxl: detail: libxl_create.c:661:libxl__domain_make: passthrough: disabled
>> libxl: debug: libxl_arm.c:148:libxl__arch_domain_prepare_config: Configure
>> the domain
>> libxl: debug: libxl_arm.c:151:libxl__arch_domain_prepare_config:  - Allocate
>> 0 SPIs
>> libxl: error: libxl_create.c:709:libxl__domain_make: domain creation fail: No
>> such file or directory

So this is -ENOENT which could be returned by the P2M is it can't 
allocate a page table (see p2m_set_entry()).

>> libxl: error: libxl_create.c:1294:initiate_domain_create: cannot make domain:
>> -3
>>
>> Later flights don't fail here anymore, though.
>>
>>>   test-armhf-armhf-xl          14 guest-start              fail REGR. vs. 173457
>>
>> Similar log contents here, but later flights continue to fail the same way.
>>
>> I'm afraid I can't draw conclusions from this; I haven't been able to spot
>> anything helpful in the hypervisor logs. My best guess right now is the use
>> of some uninitialized memory, which just happened to go fine in the later
>> flights for 64-bit.

It looks like the smoke flight failed on laxton0 but passed on 
rochester{0, 1}. The former is using GICv2 whilst the latter are using 
GICv3.

In the case of GICv2, we will create a P2M mapping when the domain is 
created. This is not necessary in the GICv3.

IIRC the P2M pool is only populated later on (we don't add a few pages 
like on x86). So I am guessing this is why we are seen failure.

If that's correct, then this is a complete oversight from me (I haven't 
done any GICv2 testing) while reviewing the series.

The easy way to solve it would be to add a few pages in the pool when 
the domain is created. I don't like it, but I think there other possible 
solutions would require more work as we would need to delay the mappings.

> 
> I am also quite confused about this issue, as from my local test today on
> different Arm/Arm64 boards, this issue would be only triggered on some of
> them instead of all of them...

Did this include any GICv2 HW?

Cheers,

-- 
Julien Grall

