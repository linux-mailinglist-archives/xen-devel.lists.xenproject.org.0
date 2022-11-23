Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F97635309
	for <lists+xen-devel@lfdr.de>; Wed, 23 Nov 2022 09:45:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447438.703644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxlNU-0000gM-Gz; Wed, 23 Nov 2022 08:45:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447438.703644; Wed, 23 Nov 2022 08:45:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxlNU-0000eN-EH; Wed, 23 Nov 2022 08:45:08 +0000
Received: by outflank-mailman (input) for mailman id 447438;
 Wed, 23 Nov 2022 08:45:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oxlNT-0000eH-BZ
 for xen-devel@lists.xenproject.org; Wed, 23 Nov 2022 08:45:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oxlNS-0007f8-V0; Wed, 23 Nov 2022 08:45:06 +0000
Received: from [54.239.6.185] (helo=[192.168.17.134])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oxlNS-0007qQ-Mz; Wed, 23 Nov 2022 08:45:06 +0000
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
	bh=qxmfUAdRQQG/x8hp7Kbsx4WZpq7ukxDPxnFwRN8mpdk=; b=lTy/av9Ohktck/6osGe2VbJCXJ
	0zVf3bhCTaMmnm37zU+jNs83O5u69O+A6LdptqhDq4gI04FcLoJeSW+kak6yTbI08pO9te9W1HNuS
	b2daM81CyWPchvV3yp/rnXFbvQh5dL3EMzO8egC8qdwli5bv/VXkt4cZIbq5DAPbtXvc=;
Message-ID: <7b43c459-55db-58d4-840b-e13f11204211@xen.org>
Date: Wed, 23 Nov 2022 09:45:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v3 1/3] CHANGELOG: Add missing entries for work during the
 4.17 release
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20221122112623.1441905-1-Henry.Wang@arm.com>
 <20221122112623.1441905-2-Henry.Wang@arm.com>
 <cab642b3-3928-7bd2-a874-0c0edf48fbc1@xen.org>
 <AS8PR08MB7991D017719BCDA177D377D6920D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AS8PR08MB7991D017719BCDA177D377D6920D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 22/11/2022 12:46, Henry Wang wrote:
> Hi Julien,

Hi Henry,

> 
> Thanks for your review as always!
> 
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Subject: Re: [PATCH v3 1/3] CHANGELOG: Add missing entries for work during
>> the 4.17 release
>>
>> (Reducing the CC-list)
> 
> Thanks, I will use this CC-list in v4.
> 
>>
>> Hi,
>>
>> On 22/11/2022 11:26, Henry Wang wrote:
>>> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
>>> - - Support VIRT_SSBD feature for HVM guests on AMD.
>>> + - Support VIRT_SSBD feature for HVM guests on AMD and
>> MSR_SPEC_CTRL feature for
>>> +   SVM guests.
>>
>> Did you really intend to write "SVM" rather than HVM? If yes, then to me
>> "HVM guests on AMD" means the same as "SVM guests".
> 
> I am sorry about the confusion. I think the latter part of this sentence is
> just a direct copy of title in [1]. But by reading the content of that
> cover letter I think...
> 
>>
>> So I would suggest the following wording:
>>
>> Support for VIRT_SSBD and MSR_SPEC_CTRL for HVM guests on AMD.
> 
> ...this is correct. So I will use your suggested sentence in v4. Thanks.
> 
>>
>>> + - Support VirtIO-MMIO devices in toolstack on Arm.
>>
>> I would clarify that this is *only* creating the device-tree binding.
>> IOW, there are no support for ACPI nor device-emulator (still in
>> progress from Xen Project PoV).
> 
> You are correct. I will change to:
> "Support VirtIO-MMIO devices device-tree binding creation in toolstack
> on Arm"
> 
>>
>>> + - Allow setting the number of CPUs to activate at runtime from command
>> line
>>> +   option on Arm.
>>> + - Grant-table support on Arm was improved and hardened by
>> implementing
>>> +   "simplified M2P-like approach for the xenheap pages"
>>> + - Add Renesas R-Car Gen4 IPMMU-VMSA support on Arm.
>>> + - Add i.MX lpuart and i.MX8QM initial support on Arm.
>>
>> I was under the impression that the code that was merged is enough to
>> support the platform. Do you have any pointer where it says it is not
>> sufficient?
> 
> Ah this is also directly from the title of [2], where it is only a
> "xen/arm: add i.MX lpuart and i.MX8QM initial support"
> 
> I would be more than happy to remove the "initial" if you think it is
> appropriate.

I saw you already remove "initial" in v4 but I will still reply. On an 
earlier revision of the series I asked Peng if this was enough to boot 
Xen upstream on the platform and the answer was yes [3].

So I would assume that the basics work. Not sure about platform device 
passthrough.

> 
>>
>>> + - Improved toolstack build system.
>>> + - Add Xue - console over USB 3 Debug Capability.
>>>
>>>    ### Removed / support downgraded
>>>     - dropped support for the (x86-only) "vesa-mtrr" and "vesa-remap"
>> command line options
> 
> [1] https://lore.kernel.org/xen-devel/20220128132927.14997-1-andrew.cooper3@citrix.com/
> [2] https://lore.kernel.org/xen-devel/20220419043927.23542-1-peng.fan@oss.nxp.com/
[3] 
https://lore.kernel.org/xen-devel/DU0PR04MB9417B86346491B63442D234D88139@DU0PR04MB9417.eurprd04.prod.outlook.com/


Cheers,

-- 
Julien Grall

