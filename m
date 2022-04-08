Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA764F93E7
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 13:24:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301428.514422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncmjC-0006BK-Sg; Fri, 08 Apr 2022 11:24:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301428.514422; Fri, 08 Apr 2022 11:24:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncmjC-000683-P1; Fri, 08 Apr 2022 11:24:34 +0000
Received: by outflank-mailman (input) for mailman id 301428;
 Fri, 08 Apr 2022 11:24:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ncmjB-00067x-7R
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 11:24:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ncmj8-0000ip-6R; Fri, 08 Apr 2022 11:24:30 +0000
Received: from [54.239.6.190] (helo=[192.168.16.176])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ncmj7-0004Dj-VA; Fri, 08 Apr 2022 11:24:30 +0000
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
	bh=dfZYbA2+g/Mq99fHHN1OrLY+2tfL2C0kh8EFlYfSwWY=; b=SAp9nHwyDFp3xV2UM11rOB6SHr
	1b0DLR3sFuDR50sORuxDqf65qkYPnQNU1O+4BC+2j/kWXkcJ/YmFt/Xo49tVt+KnJKkDWj30N/s4a
	laOg8+rZbSpONMNexut4vU95Q2dRkm1Z8gc0lvugZGOMMUema9as4YDxi4NXJiZ963bc=;
Message-ID: <41fe950e-cbc8-1da9-02d2-733c6fe4bb7a@xen.org>
Date: Fri, 8 Apr 2022 12:24:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [xen-4.12-testing test] 169199: regressions - FAIL
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 osstest service owner <osstest-admin@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>
References: <osstest-169199-mainreport@xen.org>
 <43ad1e8c-dacc-9b7a-7250-9348e7e52580@suse.com>
 <Yk/tzuKq4D3mFEQu@Air-de-Roger>
 <a6c6901d-0f6f-f4f6-eba9-c3d169c30433@suse.com>
 <YlAWBom8O8d1lCpQ@Air-de-Roger>
 <ab27a3c3-a85d-b9aa-de0c-ca96f3e2a3fc@xen.org>
 <YlAZhWVFziwoL0rb@Air-de-Roger>
From: Julien Grall <julien@xen.org>
In-Reply-To: <YlAZhWVFziwoL0rb@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Roger,

On 08/04/2022 12:16, Roger Pau Monné wrote:
> On Fri, Apr 08, 2022 at 12:08:02PM +0100, Julien Grall wrote:
>> Hi,
>>
>> On 08/04/2022 12:01, Roger Pau Monné wrote:
>>>>> I could add a suitable dom0_max_vcpus parameter to osstest.  XenServer
>>>>> uses 16 for example.
>>>>
>>>> I'm afraid a fixed number won't do, the more that iirc there are
>>>> systems with just a few cores in the pool (and you don't want to
>>>> over-commit by default).
>>>
>>> But this won't over commit, it would just assign dom0 16 vCPUs at
>>> most, if the system has less than 16 vCPUs that's what would be
>>> assigned to dom0.
>>
>> AFAICT, this is not the case on Arm. If you ask 16 vCPUs, then you will get
>> that number even if there are 8 pCPUs.
>>
>> In fact, the documentation of dom0_max_vcpus suggests that the numbers of
>> vCPUs can be more than the number of pCPUs.
> 
> It was my understanding that you could only achieve that by using the
> min-max nomenclature, so in order to force 16 vCPUs always you would
> have to use:
> 
> dom0_max_vcpus=16-16
> 
> Otherwise the usage of '_max_' in the option name is pointless, and it
> should instead be dom0_vcpus.
> 
> Anyway, I could use:
> 
> dom0_max_vcpus=1-16
> 
> Which is unambiguous and should get us 1 vCPU at least, or 16vCPUs at
> most.

Unfortunately, Arm doesn't support the min-max nomenclature.

> 
> But given Jans suggestion we might want to go for something more
> complex?

I think we already have some knowledge about each HW (i.e. grub vs 
uboot) in Osstest. So I think it would be fine to extend the knowledge 
and add the number of CPUs.

Cheers,

-- 
Julien Grall

