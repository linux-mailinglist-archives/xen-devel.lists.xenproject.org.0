Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FB77DDE34
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 10:14:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626178.976171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7Iz-0002uZ-LP; Wed, 01 Nov 2023 09:14:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626178.976171; Wed, 01 Nov 2023 09:14:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7Iz-0002se-Ig; Wed, 01 Nov 2023 09:14:29 +0000
Received: by outflank-mailman (input) for mailman id 626178;
 Wed, 01 Nov 2023 09:14:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qy7Ix-0002rO-9u
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 09:14:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qy7Iv-0003yV-1H; Wed, 01 Nov 2023 09:14:25 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qy7Iu-0006zs-Rh; Wed, 01 Nov 2023 09:14:24 +0000
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
	bh=IJy7ohh2P80trrurzNDpJ9gaIXCG3I2f9gcqC5joIvw=; b=T/L2zBp6/xhQ3p33R3NIKcOJEA
	tX1A69g5VIQyu9a9AxRRibPY8T6IE2G6ATGYrYWtPJIrZHhKL/K1w8knJt/8lJomYCfkdmjKSgu6s
	e10U588u9facBkGyv8eT6pmBnWRoc1svZZsCYI7cTUMg8S5DoQfNMPnCZU0tRLGQHsLM=;
Message-ID: <ad8c3c99-135c-425c-a0e9-f74c6cadbc78@xen.org>
Date: Wed, 1 Nov 2023 09:14:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: exynos-mixer 14450000.mixer: [drm:exynos_drm_register_dma]
 *ERROR* Device 14450000.mixer lacks support for IOMMU
Content-Language: en-GB
To: Chuck Zmudzinski <brchuckz@netscape.net>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Mario Marietto <marietto2008@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
References: <CA+1FSiip1U0_EskJNgV3pSZPTCNOiTbpHosRLsy-6t1QQGd8Dw@mail.gmail.com>
 <alpine.DEB.2.22.394.2310311557520.1795129@ubuntu-linux-20-04-desktop>
 <CA+1FSih0hORYZf6Hfmf=nY4jkHPvFSgGfc1tJfzN6smnKxcsxA@mail.gmail.com>
 <alpine.DEB.2.22.394.2310311625260.1795129@ubuntu-linux-20-04-desktop>
 <d7d353b6-8d98-4bfa-8f45-1cb56fcea1f8@netscape.net>
 <08d50d8e-00bc-4bd0-be64-49639028eca8@xen.org>
 <5b3f5d86-1499-4dbb-934e-2006a3dc108e@netscape.net>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5b3f5d86-1499-4dbb-934e-2006a3dc108e@netscape.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 01/11/2023 08:45, Chuck Zmudzinski wrote:
> On 11/1/2023 4:27 AM, Julien Grall wrote:
>> Hi,
>>
>> @Stefano, as you pointed out, there is already a thread on xen-users for
>> this discussion. Could we use this thread for any discussion? This would
>> make easier to follow.
>>
>> Some high level comment below.
> 
> I agree to keep the discussion here and not at other places.

I was meant to suggest the other thread :). But either is fine with me. 
I just want to avoid avoid multiple seperate threads for the discussion.

> 
> I just want to add that the best results for Xen dom0 so far are
> by implementing Marek's suggestion to disable these two settings
> in the 6.1.59 kernel config, but leaving everything else the same,
> including keeping the EXYNOS_IOMMU support enabled:
That's good news! I would be interested to hear how this works once you 
start to have PV backend in dom0 (I expect that the IOMMU will get 
confused with grant mapping).

Also, do you plan to passthrough any of the devices protected by IOMMU?

> 
> # CONFIG_DRM_EXYNOS_MIXER is not set
> 
> Disabling the mixer also makes this unavailable:
> 
> # CONFIG_HDMI
> 
> With this change, the GPU is working well enough to allow the display
> manager and an X11 session to run normally on the built-in display of the
> Chromebook. The Wifi also works well.

I saw your other answer about the Wifi not working when the IOMMU is not 
used. I was about to reply there, but instead I will do it here.

TBH, I am quite surprised this is the case. The only difference with 
baremetal would be the RAM regions. Do you know if the Wifi dongle only 
accept certain physical address?

Cheers,

-- 
Julien Grall

