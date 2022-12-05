Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D75236427C6
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 12:45:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453519.711113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p29ub-0002e4-PE; Mon, 05 Dec 2022 11:45:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453519.711113; Mon, 05 Dec 2022 11:45:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p29ub-0002aN-Lc; Mon, 05 Dec 2022 11:45:29 +0000
Received: by outflank-mailman (input) for mailman id 453519;
 Mon, 05 Dec 2022 11:45:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p29uZ-0002aG-Fv
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 11:45:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p29uU-0005bz-M9; Mon, 05 Dec 2022 11:45:22 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.30.208]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p29uU-0007yo-E9; Mon, 05 Dec 2022 11:45:22 +0000
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
	bh=MjV0u77qjH7Dz+WlLiaJIBXB6I3Zu6apIRPc7eMiF+4=; b=C7UbC5z80XNrCBly9xREn0BFWe
	AHwtrilk+CSYf3pRglOTRlK9zY8syypuZEVIDzFxFakZ1amXoGDUwKsmXzgAVuLCvyg6chAuEpxCB
	LR4oUnkG8Twyl/LYaIfUMCzjyGXfSZTYV9UaPoeT0KLyVD3q/+mTcFaX49VkD/m7h5dA=;
Message-ID: <68644044-a2ea-25b4-a400-422540ae29df@xen.org>
Date: Mon, 5 Dec 2022 11:45:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v2] process/release-technician-checklist: Explain how the
 banner in README is generated
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20221124190850.35344-1-julien@xen.org>
 <6819d05e-d1ab-fc3e-7795-bac650df3bc4@suse.com>
 <AS8PR08MB7991D653E57C71D2B4D4B0C992149@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <4e89184f-2e47-8205-1af5-7b2bb5431926@xen.org>
 <AS8PR08MB79910DD6A46EB01C61E0C3C592189@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AS8PR08MB79910DD6A46EB01C61E0C3C592189@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 05/12/2022 11:28, Henry Wang wrote:
> Hi Julien,

Hi Henry,

> 
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Subject: Re: [PATCH v2] process/release-technician-checklist: Explain how the
>> banner in README is generated
>>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> Release-acked-by: Henry Wang <Henry.Wang@arm.com>
>>
>> Thanks for the release-acked-by. However, I have no plan to port this
>> patch to 4.17 (IMHO, a release technician should always read the
>> unstable checklist).
> 
> No problem. Sorry for the noise :)
> 
> Speaking of the checklist and maybe it is slightly off topic: Will it bother
> you or other maintainers if I send a patch to remove the "qemu-iwj"
> section in the branch list? According to the discussion with Ian [1], I think
> this can be safely dropped, and I am asking because I think this indeed
> causes some confusion in the 4.17 branching process.
There are a few bits in the branch checklist that needs to be updated. 
This include removing the section "qemu-iwj.git". I will aim to send the 
series this week.

Cheers,

-- 
Julien Grall

