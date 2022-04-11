Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CE74FBA50
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 13:00:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302976.516911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndrlz-0002VY-31; Mon, 11 Apr 2022 10:59:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302976.516911; Mon, 11 Apr 2022 10:59:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndrlz-0002T8-0B; Mon, 11 Apr 2022 10:59:55 +0000
Received: by outflank-mailman (input) for mailman id 302976;
 Mon, 11 Apr 2022 10:59:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ndrly-0002T2-By
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 10:59:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ndrlw-0004MK-Kp; Mon, 11 Apr 2022 10:59:52 +0000
Received: from [54.239.6.185] (helo=[192.168.17.122])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ndrlw-0004mL-F0; Mon, 11 Apr 2022 10:59:52 +0000
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
	bh=fq3qWzRuKmfh3iIzAxhArmlWL9Wdtpn9u3fQlAMUS9I=; b=673a2quflBcaYnsXLSRv7mPIrU
	erI6DvkgZ6HtVseySSirXAjueM4fkVLHW7KLyZNMkXKft27EZ0noPWVnPged4RnhIRX903+Zu+ErA
	R8dQbOvPRotTyKlDCR+zuG4Y2N3+y3a4xkjSMF28GhgFH/U+GRbeOp7ClPo1fkxYwBmU=;
Message-ID: <e0efebc8-cda1-8235-888f-c9048155eb29@xen.org>
Date: Mon, 11 Apr 2022 11:59:50 +0100
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
 <41fe950e-cbc8-1da9-02d2-733c6fe4bb7a@xen.org>
 <YlBUF0j8HEpRX8Hs@Air-de-Roger>
From: Julien Grall <julien@xen.org>
In-Reply-To: <YlBUF0j8HEpRX8Hs@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 08/04/2022 16:26, Roger Pau Monné wrote:
> On Fri, Apr 08, 2022 at 12:24:27PM +0100, Julien Grall wrote:
>> Hi Roger,
>>
>> On 08/04/2022 12:16, Roger Pau Monné wrote:
>>> On Fri, Apr 08, 2022 at 12:08:02PM +0100, Julien Grall wrote:
>>>> Hi,
>>>>
>>>> On 08/04/2022 12:01, Roger Pau Monné wrote:
>>>>>>> I could add a suitable dom0_max_vcpus parameter to osstest.  XenServer
>>>>>>> uses 16 for example.
>>>>>>
>>>>>> I'm afraid a fixed number won't do, the more that iirc there are
>>>>>> systems with just a few cores in the pool (and you don't want to
>>>>>> over-commit by default).
>>>>>
>>>>> But this won't over commit, it would just assign dom0 16 vCPUs at
>>>>> most, if the system has less than 16 vCPUs that's what would be
>>>>> assigned to dom0.
>>>>
>>>> AFAICT, this is not the case on Arm. If you ask 16 vCPUs, then you will get
>>>> that number even if there are 8 pCPUs.
>>>>
>>>> In fact, the documentation of dom0_max_vcpus suggests that the numbers of
>>>> vCPUs can be more than the number of pCPUs.
>>>
>>> It was my understanding that you could only achieve that by using the
>>> min-max nomenclature, so in order to force 16 vCPUs always you would
>>> have to use:
>>>
>>> dom0_max_vcpus=16-16
>>>
>>> Otherwise the usage of '_max_' in the option name is pointless, and it
>>> should instead be dom0_vcpus.
>>>
>>> Anyway, I could use:
>>>
>>> dom0_max_vcpus=1-16
>>>
>>> Which is unambiguous and should get us 1 vCPU at least, or 16vCPUs at
>>> most.
>>
>> Unfortunately, Arm doesn't support the min-max nomenclature.
> 
> Hm, can we update the command line document then?
> 
> There's no mention that the min-max nomenclature is only available to
> x86. I assume it's not possible to share the logic here so that both
> Arm and x86 parse the option in the same way?

Looking at the x86 implementation, I think we can re-use everything but 
the pv_shim and NUMA bits.

> We don't need to store this information anywhere I think. Since we
> first install plain Debian and then install Xen we can always fetch
> the number of physical CPUs when running plain Linux and use that to
> calculate the amount to give to dom0?

You will need to check how that works with U-boot. I can't remember 
whether the script is loaded via tftp or stored on the local disk.

Cheers,

-- 
Julien Grall

