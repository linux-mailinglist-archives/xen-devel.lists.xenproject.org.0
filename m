Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C7866E0F0
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 15:37:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479531.743437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHn5l-0005bW-H9; Tue, 17 Jan 2023 14:37:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479531.743437; Tue, 17 Jan 2023 14:37:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHn5l-0005ZJ-EN; Tue, 17 Jan 2023 14:37:37 +0000
Received: by outflank-mailman (input) for mailman id 479531;
 Tue, 17 Jan 2023 14:37:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pHn5k-0005ZD-7K
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 14:37:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHn5k-00028w-0c; Tue, 17 Jan 2023 14:37:36 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.7.198]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHn5j-0000y3-Qo; Tue, 17 Jan 2023 14:37:35 +0000
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
	bh=EhJsozbj9A6D5UjyFPjtZNmE3z5a+bX2LhJ7SEKtA3M=; b=FmQccu+8W35yIMmJnCHKfGTf6K
	MqXWTuOrBzp+6VynnplLu1ihDbbweLFnzPBB1QhY8AjF1wAzpSLpw11jo2aqFtZFgyjWlewyFvn5Y
	Bm714YvwX25CI64esQLt7wjqgfiE8y/YCusLUk/j8pbAHX3Vs1GB/zHmOGBVqljbuvR4=;
Message-ID: <619a00f0-0f9f-5f5f-13a7-ea86f9c24eec@xen.org>
Date: Tue, 17 Jan 2023 14:37:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: AW: Xenalyze on ARM ( NXP S32G3 with Cortex-A53)
Content-Language: en-US
To: El Mesdadi Youssef ESK UILD7 <youssef.elmesdadi@zf.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
References: <AM5PR0802MB25781717167B5BFC980BF2A49DFF9@AM5PR0802MB2578.eurprd08.prod.outlook.com>
 <3e7059c2-0d23-03f2-9a93-f88de09171f4@xen.org>
 <AM5PR0802MB2578A1389424064D6884588E9DC29@AM5PR0802MB2578.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AM5PR0802MB2578A1389424064D6884588E9DC29@AM5PR0802MB2578.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 13/01/2023 12:56, El Mesdadi Youssef ESK UILD7 wrote:
> Hello Julien,

Hi,

>>>> xentrace should work on upstream Xen. What did you version did you try?
> 
> While building my image using the BSP-linux of NXP, the version that was downloaded is Xen 4.14.

Do you know where the source are downloaded from?

> 
> 
>>>> Can you also clarify the error you are seen?
> 
> The error I receive while tipping xentrace is: Command not found.


"Command not found" means the program hasn't been installed.

> I assume in this Xen version, Xentrace is not compatible with ARM architecture
The support for xentrace on Arm has been added around Xen 4.12. So it 
should work for Xen 4.14 (even though I don't recommend using older 
release).

I would suggest to check how you are building the tools and which 
package will be installed.

> 
> My question is, is there any new version of Xen that supports Xentrace on ARM? If yes how could I install it? Because Xen.4.14 was installed automatically by typing this ( DISTRO_FEATURES_append += "xen") in the local.conf file while creating my image.

I am not familiar with the BSP-linux of NXP as this is not a project 
maintained by Xen Project.

If you need support for it, then I would suggest to discuss with NXP 
directly.

> 
> Or is there any source on Xentrace that is compatible with ARM on GitHub, that I could download and compile myself?
Even if the hypervisor is Xen, you seem to use code provided by an 
external entity. I can't advise on the next steps without knowing the 
modification that NXP made in the hypervisor.

> 
>>>> Yes if you assign (or provide para-virtualized driver) the GPIO/LED/Can-Interface to the guest.
> 
> Is there any tutorial that could help me create those drivers? And how complicated is that, to create them?

I am not aware of any tutorial. Regarding the complexity, it all depends 
on what exactly you want to do.

> Or can they be assigned just with PCI-Passthrough?

PCI passthrough is not yet supported on Arm. That said, I was not 
expecting the GPIO/LED/Can-interface to be PCI devices.

If they are platform devices (i.e non-PCI devices), then you could 
potentially directly assign them to *one* guest (this would not work if 
you need to share them).

I wrote potentially because if the device is DMA-capabable, then the 
device must be behind an IOMMU.

Cheers,

-- 
Julien Grall

